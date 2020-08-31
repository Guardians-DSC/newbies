const fs = require('fs');
const { execSync } = require('child_process');

// Arquivo necessário é copiado para o diretório local
fs.copyFileSync('../../questoes/exercicio_8/log.tar.gz', './log.tar.gz');

// Extrai o arquivo requerido
execSync('tar -vzxf log.tar.gz');

// Lê o log e obtém as linhas
const errorsFile = fs.readFileSync('./error.log', 'utf8');
const errorsLines = errorsFile.split('\n');

// Inicialize os contadores
let quantity = {};
errorsLines.forEach((line) => {
  if (!line) return;

  // Obtém a data e quantidade de bytes da linha atual
  const [date, bytesString] = line.split(' ');
  // Extrai o ano da linha
  const year = date.split('/')[2].split(':')[0];

  // Adiciona mais um erro ao ano
  if (quantity[year]) quantity[year]++;
  else quantity[year] = 1;
});

// Inicializando a soma total
let totalSum = 0;

// Percorre a quantidade de erros de cada ano
const years = Object.keys(quantity);
years.forEach((year) => {
  totalSum += quantity[year];
});

// Calcula a média
const media = totalSum / years.length;

console.log('Média de falhas por ano:', media);
