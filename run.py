import os
import subprocess
import time
import pandas as pd

file = 'all'

if file == 'all':
  files = []
  for file in os.listdir('.'):
    if os.path.splitext(file)[1] == '.asm':
      files.append(file[:file.find('.asm')])

  duration = []
  out = []
  for file in files:
    os.system('nasm -f elf32 ' + file + '.asm -o ' + file + '.o')
    os.system('ld -m elf_i386 ' + file + '.o -o ' + file + '.exe')
    start = time.time_ns()
    x = subprocess.Popen('./' + file + '.exe', shell=True, stdin=None, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    out.append(x.communicate())
    duration.append(time.time_ns() - start)
    os.system('rm ' + file + '.o')
    os.system('rm ' + file + '.exe')
    os.system('clear')

  df = pd.DataFrame([duration, out], index=['duration', 'output'],  columns=files).iloc[:, ::-1]
  open('README.md', 'w').write('# assemblyfun\n' + df.to_html() .replace('border="1" ',''))

else:
  os.system('nasm -f elf32 ' + file + '.asm -o ' + file + '.o')
  os.system('ld -m elf_i386 ' + file + '.o -o ' + file + '.exe')
  start = time.time_ns()
  os.system('./' + file + '.exe')
  print(time.time_ns() - start)