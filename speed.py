import os
import time
import pandas as pd

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
  out.append(os.popen('./' + file + '.exe').read())
  duration.append(time.time_ns() - start)
  os.system('rm ' + file + '.o')
  os.system('rm ' + file + '.exe')
  os.system('clear')

df = pd.DataFrame([duration, out], index=['duration', 'output'], columns=files).iloc[:, ::-1]
open('README.md', 'w').write('# assemblyfun\n' + df.to_html().replace('border="1" ',''))