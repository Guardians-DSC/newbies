const fs = require('fs');
const { execSync } = require('child_process');

// Arquivo necessário é copiado para o diretório local
fs.copyFileSync('../../questoes/exercicio_1/jan_95.txt.gz', './jan_95.txt.gz');

// O arquivo é descompactado com o gunzip
execSync('gunzip jan_95.txt.gz');

// Leitura do Arquivo
const file = fs.readFileSync('./jan_95.txt', 'utf-8');

// Separação por linhas
let lines = file.split('\n');
// Filtragem das linhas
lines = lines.filter((item) => item.includes(' - - '));

// Contando a quantidade de requisições locais e remotas
let local = 0, remote = 0;
lines.forEach((line) => {
  if (line.startsWith('local')) local++;
  else if (line.startsWith('remote')) remote++;
});

console.log(`Foram feitas ${local} requisições locais!`);
console.log(`Foram feitas ${remote} requisições remotas!`);
