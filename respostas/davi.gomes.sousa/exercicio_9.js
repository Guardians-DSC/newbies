const fs = require('fs');
const { execSync } = require('child_process');

console.log('\n=========================================================');
console.log(`Relatório de utilização para o diretório ${directory}:`);
console.log('=========================================================');

// Inicializa os arrays que irão categorizar os diretórios
const less10MB = [], greater10MB = [], greater200MB = [], between10And200 = [];

// Função recursiva que faz a busca por novos diretórios em até um nível 2 de profundidade
function searchDir(dir, deepLevel) {
  if (deepLevel > 2) return;

  // Lista os arquivos desse diretório
  const files = fs.readdirSync(dir);

  // Para cada arquivo/diretório
  files.forEach((file) => {
    // Obtém o caminho absoluto e um objeto de status
    const filePath = dir + '/' + file;
    const statFile = fs.statSync(filePath);
    
    // Se for um diretório...
    if (statFile.isDirectory()) {
      // Obtém o uso em disco em um formato legível
      const output = execSync(`du -sh ${filePath}`).toString();
      const sizeString = output.split(/\s+/)[0];

      // Constrói o objeto do diretório
      const directoryItem = { path: filePath, size: sizeString };

      // Se tiver tamanho em Kilobytes ou em Bytes, categoriza como "não excede 10MB"
      if (sizeString.includes('K') || sizeString.includes('B')) 
        less10MB.push(directoryItem);

      // Se for em Megabytes, várias verificações precisam ser feitas
      else if (sizeString.includes('M')) {
        
        // Obtém o valor número do tamanho do diretório
        const sizeNumber = Number(sizeString.replace('M', ''));

        // Caso seja menor ou igual a 10MB, categoriza em "não excede 10MB"
        if (sizeNumber <= 10) less10MB.push(directoryItem);

        // Caso seja maior que 200MB, categoriza em "excede 10MB" e "excede 200MB"
        else if (sizeNumber > 200) {
          greater10MB.push(directoryItem);
          greater200MB.push(directoryItem);
        }

        // Caso > 10MB e <= 200MB, categoriza em "excede 10MB" e "excede 10MB e não excede 200MB"
        else {
          greater10MB.push(directoryItem);
          between10And200.push(directoryItem);
        }

      // Caso seja outra medida, obrigatoriamente tem valor maior que Megabyte
      } else {
        greater200MB.push(directoryItem);
        greater10MB.push(directoryItem);
      }

      // Recursivamente, faz a busca por mais diretórios
      searchDir(filePath, deepLevel + 1);
    }
  });
}

// Obtém o diretório dos parâmetros
const [,, directory] = process.argv;

// Começa a busca recursiva analisando o diretório passado como parâmetro
searchDir(directory, 1);

// Função para ordenar por ordem decrescente
function sortDirectories(a, b) {
  // Obtém o valor absoluto do tamanho do diretório A
  const outputA = execSync(`du -s ${a.path}`).toString();
  const sizeA = Number(outputA.split(/\s+/)[0]);

  // Obtém o valor absoluto do tamanho do diretório B
  const outputB = execSync(`du -s ${b.path}`).toString();
  const sizeB = Number(outputB.split(/\s+/)[0]);

  return sizeB - sizeA;
}

// Ordena todas as categorias
less10MB.sort(sortDirectories);
greater10MB.sort(sortDirectories);
greater200MB.sort(sortDirectories);
between10And200.sort(sortDirectories);

// Lista todas as categorias
console.log('\nDiretórios que não excedem 10MB:');
less10MB.forEach((item) => {
  console.log(`    ${item.size}    ${item.path}`);
});

console.log('\nDiretórios que excedem 10MB:');
greater10MB.forEach((item) => {
  console.log(`    ${item.size}    ${item.path}`);
});

console.log('\nDiretórios que excedem 200MB:');
greater200MB.forEach((item) => {
  console.log(`    ${item.size}    ${item.path}`);
});

console.log('\nDiretórios que excedem 10MB e não excedem 200MB:');
between10And200.forEach((item) => {
  console.log(`    ${item.size}    ${item.path}`);
});
