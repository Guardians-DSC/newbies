const fs = require('fs');

// Função para checar se existe ao menos uma letra maíuscula na string
function checkIfUpperExists(string) {
  // Para cada caractere, verifica se o seu charCode está entre os maiúsculos
  for (let c in string) {
    const charCode = string.charCodeAt(c);
    if (charCode >= 65 && charCode <= 90) return true;
  }
  
  return false;
}

// Realiza a leitura da senha através da entrada padrão
console.log('Entre com a senha (ctrl+d para finalizar a leitura):');
const password = fs.readFileSync('/dev/stdin', 'utf8').replace('\n', '');

let error;
// Realiza as três verificações de segurança necessárias
if (password.length < 8) error = 'Precisa ter no mínimo de 8 caracteres';
else if (!password.match(/^[a-z]+[0-9]+$/i)) error = 'Precisa conter letras e números'
else if (!checkIfUpperExists(password)) error = 'Precisa possuir pelo menos uma letra maiúscula';

// Imprime resultado do diagnóstico
console.log('');
if (error) {
  console.log(`Senha insegura! ${error}.`);
} else {
  console.log('Senha segura! :)');
}
