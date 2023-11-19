#include "types.h"
#include "x86.h"
#include "defs.h"
#include "date.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"

int
sys_fork(void)
{
  return fork();
}

int
sys_exit(void)
{
  exit();
  return 0;  // not reached
}

int
sys_wait(void)
{
  return wait();
}

int
sys_kill(void)
{
  int pid;

  if(argint(0, &pid) < 0)
    return -1;
  return kill(pid);
}

int
sys_getpid(void)
{
  return myproc()->pid;
}

int
sys_sbrk(void)
{
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
  addr = myproc()->sz;
  if(growproc(n) < 0)
    return -1;
  return addr;
}

int
sys_sleep(void)
{
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
  while(ticks - ticks0 < n){
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
  return 0;
}

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
  uint xticks;

  acquire(&tickslock);
  xticks = ticks;
  release(&tickslock);
  return xticks;
}

int sys_shutdown(void)
{
  /* Either of the following will work. Does not harm to put them together. */
  outw(0xB004, 0x0|0x2000); // working for old qemu
  outw(0x604, 0x0|0x2000); // working for newer qemu
  
  return 0;
}

int
sys_cps(void)
{
  return cps();
}

int
sys_chpr(void)
{
  int pid, pr;
  if(argint(0, &pid) < 0)
    return -1;
  if(argint(1, &pr) < 0)
    return -1;

  return chpr(pid, pr);
}

char cmdlist[11][100];
int histsize = 0;

int
sys_hist(void)
{
  int shouldPrint, cmdNum;

  argint(0, &shouldPrint);
  argint(1, &cmdNum);

  if (shouldPrint) {
    for (int i = 0; i < histsize; i++){
      cprintf("Previous command %d: %s", i+1, cmdlist[i]);
    }
  }
  else {
    // execute the command #cmdNum
  }
  
  return 0;
}

int sys_addhist(void) {
  char* cmd;
  argstr(0, &cmd);

  for (int i = histsize; i >= 0; i--){
    strncpy(cmdlist[i+1], cmdlist[i], sizeof(cmdlist[i])-1);
  }
  
  if (histsize < 10) {
    histsize++;
  }
  strncpy(cmdlist[0], cmd, sizeof(cmdlist[0])-1);

  return 0;
}

int
sys_waitpid(void)
{
  int opid, options;
  int status;

  argint(0, &opid);
  argint(2, &options);

  //call waitpid
  return 0;
}
