const fs = require('fs');
const { execSync } = require('child_process');

// Arquivo necessário é copiado para o diretório local
fs.copyFileSync('../../questoes/exercicio_8/log.tar.gz', './log.tar.gz');

// Extrai o arquivo requerido
execSync('tar -vzxf log.tar.gz');

// Lê o log e obtém as linhas
const accessFile = fs.readFileSync('./access.log', 'utf8');
const accessLines = accessFile.split('\n');

// Obtém o ano alvo passado como parâmetro
const [,, targetYear] = process.argv;

// Inicialize os contadores
let totalBytes = 0, impressions = 0;
accessLines.forEach((line) => {
  if (!line) return;

  // Obtém a data e quantidade de bytes da linha atual
  const [date, bytesString] = line.split(' ');
  // Extrai o ano da linha
  const year = date.split('/')[2].split(':')[0];

  // Se for o ano requerido, adiciona nos contadores
  if (year === targetYear) {
    totalBytes += Number(bytesString);
    impressions++;
  }
});

console.log(`Quantidade de arquivos impressos em ${targetYear}: ${impressions}`);
console.log(`Quantidade de bytes transimitidos em ${targetYear}: ${totalBytes} bytes`);
