const fs = require('fs');
const { execSync } = require('child_process');

// Função para obter as informações da CPU
function getCPU() {
  const output = execSync('cat /proc/cpuinfo').toString();
  const lines = output.split('\n');

  const cpuLine = lines.find((line) => line.startsWith('model name'));
  const cpuName = cpuLine.split(':')[1].trim();

  return cpuName;
}

// Função para obter as informações da Placa de Rede
function getEthernetController() {
  const output = execSync('lspci').toString();
  const lines = output.split('\n');

  const netLine = lines.find((line) => line.includes('Ethernet controller'));
  const netName = netLine.split(':')[2].trim();

  return netName;
}

// Função para obter o total de memória disponível
function getTotalMemory() {
  const output = execSync('cat /proc/meminfo').toString();
  const lines = output.split('\n');

  const memLine = lines.find((line) => line.startsWith('MemTotal'));
  const memSpace = memLine.split(':')[1].trim();

  return memSpace;
}

// Função do Processo Principal
function main() {
  // Criação do base.txt mais atualizado
  let baseString = getCPU() + '\n';
  baseString += getEthernetController() + '\n';
  baseString += getTotalMemory() + '\n';

  if (fs.existsSync('./base.txt')) {
    // Se o arquivo já existe, a comparação será feita
    const oldBase = fs.readFileSync('./base.txt', 'utf8');

    if (baseString === oldBase) console.log('SEM ALTERACOES');
    else {
      // Caso existam diferenças, o usuário é notificado e o arquivo é atualizado
      console.log('SISTEMA ALTERADO');

      fs.unlinkSync('./base.txt');
      fs.writeFileSync('./base.txt', baseString);
    }
  } else {
    // Caso o arquivo não exista, é criado um novo
    fs.writeFileSync('./base.txt', baseString);
    console.log('ARQUIVO BASE CRIADO');
  }
}

main();
