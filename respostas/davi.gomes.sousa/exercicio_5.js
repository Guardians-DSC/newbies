const fs = require('fs');
const { execSync } = require('child_process');

// Passando temporariamente o output do comando para um arquivo .txt
execSync('lsof > lsof.txt');
// Leitura do output
const file = fs.readFileSync('./lsof.txt', 'utf8');
// Excluindo o arquivo temporário
fs.unlinkSync('./lsof.txt');

// Separação do output por linhas e filtrando as linhas que contém TCP ou UDP
let lines = file.split('\n');
lines = lines.filter((line) => line.includes(' TCP ') || line.includes(' UDP '));

// Inicialização dos contadores
let LISTEN = 0, ESTABLISHED = 0, SYN_SENT = 0, CLOSE_WAIT = 0;
const occurrencesUDP = {}, occurrencesTCP = {};

lines.forEach((line) => {
  // Obtém o nome do processo
  const process = line.split(/\s+/)[0];
  
  if (line.includes(' TCP ')) {
    // Se for TCP, acrescenta mais uma ocorrência para o processo atual
    if (occurrencesTCP[process]) occurrencesTCP[process]++;
    else occurrencesTCP[process] = 1;
  
    // E faz a contagem dos estados em TCP
    if (line.includes('(LISTEN)')) LISTEN++;
    else if (line.includes('(ESTABLISHED)')) ESTABLISHED++;
    else if (line.includes('(SYN_SENT)')) SYN_SENT++;
    else if (line.includes('(CLOSE_WAIT)')) CLOSE_WAIT++;
  } else {
    // Se for UDP, acrescenta mais uma ocorrência para o processo atual
    if (occurrencesUDP[process]) occurrencesUDP[process]++;
    else occurrencesUDP[process] = 1;
  }
});

// Percorre todas as ocorrências UDP e armazena a maior
let maxUDP = { occurrences: -Infinity };
Object.keys(occurrencesUDP).forEach((key) => {
  if (occurrencesUDP[key] > maxUDP.occurrences) {
    maxUDP.process = key;
    maxUDP.occurrences = occurrencesUDP[key];
  }
});

// Percorre todas as ocorrências TCP e armazena a maior
let maxTCP = { occurrences: -Infinity };
Object.keys(occurrencesTCP).forEach((key) => {
  if (occurrencesTCP[key] > maxTCP.occurrences) {
    maxTCP.process = key;
    maxTCP.occurrences = occurrencesTCP[key];
  }
});

console.log('====== TOP =====');
console.log('TOP conexões UDP:');
console.log('*', maxUDP.process);
console.log('TOP conexões TCP:');
console.log('*', maxTCP.process);

console.log('\n====== TCP =====');
console.log('LISTEN:', LISTEN);
console.log('ESTABLISHED:', ESTABLISHED);
console.log('SYN_SENT:', SYN_SENT);
console.log('CLOSE_WAIT:', CLOSE_WAIT);
