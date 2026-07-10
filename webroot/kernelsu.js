let counter = 0;
export function exec(command, options = {}) {
  return new Promise((resolve, reject) => {
    const name = `redalpha_exec_${Date.now()}_${counter++}`;
    window[name] = (errno, stdout, stderr) => {
      delete window[name];
      resolve({ errno, stdout: stdout || '', stderr: stderr || '' });
    };
    try {
      window.ksu.exec(command, JSON.stringify(options), name);
    } catch (error) {
      delete window[name];
      reject(error);
    }
  });
}
