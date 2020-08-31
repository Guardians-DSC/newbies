const fs = require('fs');

// FactoryFunction para criar uma SystemCall mais intuitiva que a linha
function createSystemCall(line) {
  const systemCall = {};

  systemCall.name = line.split('(')[0];

  const duration = line.split('<')[1].split('>')[0];
  systemCall.duration = Number(duration);

  const exitSignal = line.split('=')[1].split(' ')[1];
  systemCall.isError = Number(exitSignal) < 0;

  return systemCall;
}

// Arquivo necessário é copiado para o diretório local
fs.copyFileSync('../../questoes/exercicio_3/ls.log', './ls.log');

// Leitura do Arquivo
const file = fs.readFileSync('./ls.log', 'utf-8');

// Separação por linhas
const lines = file.split('\n');

// Inicialização das Syscalls com maiores durações
let max1 = { duration: -Infinity };
let max2 = { duration: -Infinity };
let max3 = { duration: -Infinity };

// Inicialização do dicionário de quantidade de erros para cada Syscall
const numberOfErrors = {};

// Para cada linha, obtém as informações necessárias
console.log(lines[lines.length - 1]);
lines.forEach((line, index) => {
  // Não usa o algoritmo para as duas últimas linhas. (Mensagens de saída)
  if (index >= lines.length - 3) return;

  // Cria uma versão mais intuitiva da Syscall
  const syscall = createSystemCall(line);

  // Obtém as 3 syscalls com maiores durações
  if (syscall.duration > max1.duration) max1 = syscall;
  else if (syscall.duration > max2.duration) max2 = syscall;
  else if (syscall.duration > max3.duration) max3 = syscall;

  // Se existe um erro na Syscall, adiciona mais uma contabilização no dicionário
  if (syscall.isError) {
    if (numberOfErrors[syscall.name]) numberOfErrors[syscall.name]++;
    else numberOfErrors[syscall.name] = 1;
  }
});

// Percorre as chaves do dicionário e obtém a Syscall com maior quantidade de erros
const maxErrors = { errors: -Infinity };
Object.keys(numberOfErrors).forEach((callName) => {
  if (numberOfErrors[callName] > maxErrors.errors) {
    maxErrors.name = callName;
    maxErrors.errors = numberOfErrors[callName];
  }
});

console.log('Chamada de maior duração:', max1.name);
console.log('Chamada de segunda maior duração:', max2.name);
console.log('Chamada de terceira maior duração:', max3.name);

console.log('\nSyscall com maior quantidade de erros:', maxErrors.name);
console.log('Quantidade de erros:', maxErrors.errors);
