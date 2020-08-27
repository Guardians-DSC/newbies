const { execSync } = require('child_process');

// Função para simular uma pausa no processo
function sleep(seconds) {
  return new Promise((resolve) => setTimeout(resolve, seconds * 1000));
}

// Função para obter os dados de CPU e MEM de determinado usuário
function getInfo(user) {
  // Executa "ps aux" e obtém o output
  const output = execSync('ps aux').toString();

  // Obtém as linhas do output e faz a filtragem mantendo
  // apenas os do usuário requisitado
  let lines = output.split('\n');
  lines = lines.filter((item) => item.includes(user));

  // Percorre cada linha e obtém o valor total de %CPU e %MEM
  let cpu = 0, mem = 0;
  lines.forEach((line) => {
    let info = line.split(/\s+/);

    cpu += Number(info[2]);
    mem += Number(info[3]);
  });

  return { cpu, mem };
}

// Função Assíncrona do processo principal do script
async function main() {
  // Obtém os valores passados como parâmetro
  const [,, N, S, P_USER] = process.argv;

  // Inicializa os máximos e mínimos
  let maxCpu = -Infinity, minCpu = Infinity;
  let maxMem = -Infinity, minMem = Infinity;

  // A cada S segundos obtém as informações do usuário
  // e atualiza os máximos e mínimos
  for (let i = 0; i < N; i++) {
    await sleep(S);
    const { cpu, mem } = getInfo(P_USER);

    maxCpu = cpu > maxCpu ? cpu : maxCpu;
    minCpu = cpu < minCpu ? cpu : minCpu;

    maxMem = mem > maxMem ? mem : maxMem;
    minMem = mem < minMem ? mem : minMem;
  }

  console.log('Maior valor de %CPU:', maxCpu.toFixed(2));
  console.log('Menor valor de %CPU:', minCpu.toFixed(2));

  console.log('Maior valor de %MEM:', maxMem.toFixed(2));
  console.log('Menor valor de %MEM:', minMem.toFixed(2));
}

main();
