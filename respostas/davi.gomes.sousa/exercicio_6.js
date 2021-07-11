const { execSync } = require('child_process');

// Obtém o output do comando em string
const output = execSync('ls -l').toString();

// Define os finais inseguros de permissão
const insecureEnds = {
  '-w-': true,
  'rw-': true,
  '-wx': true,
  'rwx': true,
};
let isSecure = true;

// Obtém as linhas do output
const lines = output.split('\n');

// Para cada linha, obtém as suas permissões e faz a verificação
lines.forEach((line) => {
  const permissions = line.split(' ')[0];

  // Obtém o final da permissão (3 últimos)
  // Representando os demais usuários do sistema
  const size = permissions.length;
  const end = permissions.slice(size - 3);

  // Se for um final inseguro, marca o diretório como inseguro
  if (insecureEnds[end]) {
    isSecure = false;
  }
});

if (isSecure) console.log('DIRETORIO SEGURO');
else console.log('DIRETORIO INSEGURO');
