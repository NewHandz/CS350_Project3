
_sh:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  return 0;
}

int
main(void)
{
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	ff 71 fc             	push   -0x4(%ecx)
       a:	55                   	push   %ebp
       b:	89 e5                	mov    %esp,%ebp
       d:	56                   	push   %esi
       e:	53                   	push   %ebx
       f:	51                   	push   %ecx
      10:	83 ec 0c             	sub    $0xc,%esp
  static char buf[100];
  int fd;
   
  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
      13:	eb 0c                	jmp    21 <main+0x21>
      15:	8d 76 00             	lea    0x0(%esi),%esi
    if(fd >= 3){
      18:	83 f8 02             	cmp    $0x2,%eax
      1b:	0f 8f 98 01 00 00    	jg     1b9 <main+0x1b9>
  while((fd = open("console", O_RDWR)) >= 0){
      21:	83 ec 08             	sub    $0x8,%esp
      24:	6a 02                	push   $0x2
      26:	68 76 15 00 00       	push   $0x1576
      2b:	e8 33 10 00 00       	call   1063 <open>
      30:	83 c4 10             	add    $0x10,%esp
      33:	85 c0                	test   %eax,%eax
      35:	79 e1                	jns    18 <main+0x18>
      37:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      3e:	66 90                	xchg   %ax,%ax
  printf(2, "$ ");
      40:	83 ec 08             	sub    $0x8,%esp
      43:	68 c0 14 00 00       	push   $0x14c0
      48:	6a 02                	push   $0x2
      4a:	e8 31 11 00 00       	call   1180 <printf>
  memset(buf, 0, nbuf);
      4f:	83 c4 0c             	add    $0xc,%esp
      52:	6a 64                	push   $0x64
      54:	6a 00                	push   $0x0
      56:	68 00 21 00 00       	push   $0x2100
      5b:	e8 40 0e 00 00       	call   ea0 <memset>
  gets(buf, nbuf);
      60:	58                   	pop    %eax
      61:	5a                   	pop    %edx
      62:	6a 64                	push   $0x64
      64:	68 00 21 00 00       	push   $0x2100
      69:	e8 92 0e 00 00       	call   f00 <gets>
  if(buf[0] == 0) // EOF
      6e:	0f b6 05 00 21 00 00 	movzbl 0x2100,%eax
      75:	83 c4 10             	add    $0x10,%esp
      78:	84 c0                	test   %al,%al
      7a:	0f 84 1f 01 00 00    	je     19f <main+0x19f>
    }
  }

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      80:	3c 63                	cmp    $0x63,%al
      82:	0f 84 98 00 00 00    	je     120 <main+0x120>
      buf[strlen(buf)-1] = 0;  // chop \n
      if(chdir(buf+3) < 0)
        printf(2, "cannot cd %s\n", buf+3);
      continue;
    }
    if (!(buf[0] == 'h' && buf[1] == 'i' && buf[2] == 's' && buf[3] == 't')) {
      88:	3c 68                	cmp    $0x68,%al
      8a:	75 0d                	jne    99 <main+0x99>
      8c:	80 3d 01 21 00 00 69 	cmpb   $0x69,0x2101
      93:	0f 84 e7 00 00 00    	je     180 <main+0x180>
  for (int i = histsize; i >= 0; i--){
      99:	8b 35 80 1c 00 00    	mov    0x1c80,%esi
      9f:	85 f6                	test   %esi,%esi
      a1:	78 6d                	js     110 <main+0x110>
      a3:	6b de 64             	imul   $0x64,%esi,%ebx
      a6:	81 c3 a0 1c 00 00    	add    $0x1ca0,%ebx
      ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    strcpy(cmdlist[i+1], cmdlist[i]);
      b0:	83 ec 08             	sub    $0x8,%esp
      b3:	8d 43 64             	lea    0x64(%ebx),%eax
  for (int i = histsize; i >= 0; i--){
      b6:	83 ee 01             	sub    $0x1,%esi
    strcpy(cmdlist[i+1], cmdlist[i]);
      b9:	53                   	push   %ebx
  for (int i = histsize; i >= 0; i--){
      ba:	83 eb 64             	sub    $0x64,%ebx
    strcpy(cmdlist[i+1], cmdlist[i]);
      bd:	50                   	push   %eax
      be:	e8 1d 0d 00 00       	call   de0 <strcpy>
  for (int i = histsize; i >= 0; i--){
      c3:	83 c4 10             	add    $0x10,%esp
      c6:	83 fe ff             	cmp    $0xffffffff,%esi
      c9:	75 e5                	jne    b0 <main+0xb0>
  if (histsize < 10) {
      cb:	8b 35 80 1c 00 00    	mov    0x1c80,%esi
      d1:	83 fe 09             	cmp    $0x9,%esi
      d4:	7e 3a                	jle    110 <main+0x110>
  strcpy(cmdlist[0], cmd);
      d6:	83 ec 08             	sub    $0x8,%esp
      d9:	68 00 21 00 00       	push   $0x2100
      de:	68 a0 1c 00 00       	push   $0x1ca0
      e3:	e8 f8 0c 00 00       	call   de0 <strcpy>
  return 0;
      e8:	83 c4 10             	add    $0x10,%esp
int
fork1(void)
{
  int pid;

  pid = fork();
      eb:	e8 2b 0f 00 00       	call   101b <fork>
  if(pid == -1)
      f0:	83 f8 ff             	cmp    $0xffffffff,%eax
      f3:	0f 84 d1 00 00 00    	je     1ca <main+0x1ca>
    if(fork1() == 0)
      f9:	85 c0                	test   %eax,%eax
      fb:	0f 84 a3 00 00 00    	je     1a4 <main+0x1a4>
    wait();
     101:	e8 25 0f 00 00       	call   102b <wait>
     106:	e9 35 ff ff ff       	jmp    40 <main+0x40>
     10b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     10f:	90                   	nop
    histsize++;
     110:	83 c6 01             	add    $0x1,%esi
     113:	89 35 80 1c 00 00    	mov    %esi,0x1c80
     119:	eb bb                	jmp    d6 <main+0xd6>
     11b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     11f:	90                   	nop
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
     120:	80 3d 01 21 00 00 64 	cmpb   $0x64,0x2101
     127:	0f 85 6c ff ff ff    	jne    99 <main+0x99>
     12d:	80 3d 02 21 00 00 20 	cmpb   $0x20,0x2102
     134:	0f 85 5f ff ff ff    	jne    99 <main+0x99>
      buf[strlen(buf)-1] = 0;  // chop \n
     13a:	83 ec 0c             	sub    $0xc,%esp
     13d:	68 00 21 00 00       	push   $0x2100
     142:	e8 29 0d 00 00       	call   e70 <strlen>
      if(chdir(buf+3) < 0)
     147:	c7 04 24 03 21 00 00 	movl   $0x2103,(%esp)
      buf[strlen(buf)-1] = 0;  // chop \n
     14e:	c6 80 ff 20 00 00 00 	movb   $0x0,0x20ff(%eax)
      if(chdir(buf+3) < 0)
     155:	e8 39 0f 00 00       	call   1093 <chdir>
     15a:	83 c4 10             	add    $0x10,%esp
     15d:	85 c0                	test   %eax,%eax
     15f:	0f 89 db fe ff ff    	jns    40 <main+0x40>
        printf(2, "cannot cd %s\n", buf+3);
     165:	51                   	push   %ecx
     166:	68 03 21 00 00       	push   $0x2103
     16b:	68 7e 15 00 00       	push   $0x157e
     170:	6a 02                	push   $0x2
     172:	e8 09 10 00 00       	call   1180 <printf>
     177:	83 c4 10             	add    $0x10,%esp
     17a:	e9 c1 fe ff ff       	jmp    40 <main+0x40>
     17f:	90                   	nop
    if (!(buf[0] == 'h' && buf[1] == 'i' && buf[2] == 's' && buf[3] == 't')) {
     180:	80 3d 02 21 00 00 73 	cmpb   $0x73,0x2102
     187:	0f 85 0c ff ff ff    	jne    99 <main+0x99>
     18d:	80 3d 03 21 00 00 74 	cmpb   $0x74,0x2103
     194:	0f 85 ff fe ff ff    	jne    99 <main+0x99>
     19a:	e9 4c ff ff ff       	jmp    eb <main+0xeb>
  exit();
     19f:	e8 7f 0e 00 00       	call   1023 <exit>
      runcmd(parsecmd(buf));
     1a4:	83 ec 0c             	sub    $0xc,%esp
     1a7:	68 00 21 00 00       	push   $0x2100
     1ac:	e8 8f 09 00 00       	call   b40 <parsecmd>
     1b1:	89 04 24             	mov    %eax,(%esp)
     1b4:	e8 f7 09 00 00       	call   bb0 <runcmd>
      close(fd);
     1b9:	83 ec 0c             	sub    $0xc,%esp
     1bc:	50                   	push   %eax
     1bd:	e8 89 0e 00 00       	call   104b <close>
      break;
     1c2:	83 c4 10             	add    $0x10,%esp
     1c5:	e9 76 fe ff ff       	jmp    40 <main+0x40>
    panic("fork");
     1ca:	83 ec 0c             	sub    $0xc,%esp
     1cd:	68 c3 14 00 00       	push   $0x14c3
     1d2:	e8 09 01 00 00       	call   2e0 <panic>
     1d7:	66 90                	xchg   %ax,%ax
     1d9:	66 90                	xchg   %ax,%ax
     1db:	66 90                	xchg   %ax,%ax
     1dd:	66 90                	xchg   %ax,%ax
     1df:	90                   	nop

000001e0 <print_history>:
  for (int i = 0; i < histsize; i++){
     1e0:	a1 80 1c 00 00       	mov    0x1c80,%eax
     1e5:	85 c0                	test   %eax,%eax
     1e7:	7e 37                	jle    220 <print_history+0x40>
{
     1e9:	55                   	push   %ebp
     1ea:	89 e5                	mov    %esp,%ebp
     1ec:	56                   	push   %esi
     1ed:	be a0 1c 00 00       	mov    $0x1ca0,%esi
     1f2:	53                   	push   %ebx
  for (int i = 0; i < histsize; i++){
     1f3:	31 db                	xor    %ebx,%ebx
     1f5:	8d 76 00             	lea    0x0(%esi),%esi
    printf(1, "Previous command %d: %s", i+1, cmdlist[i]);
     1f8:	83 c3 01             	add    $0x1,%ebx
     1fb:	56                   	push   %esi
  for (int i = 0; i < histsize; i++){
     1fc:	83 c6 64             	add    $0x64,%esi
    printf(1, "Previous command %d: %s", i+1, cmdlist[i]);
     1ff:	53                   	push   %ebx
     200:	68 a8 14 00 00       	push   $0x14a8
     205:	6a 01                	push   $0x1
     207:	e8 74 0f 00 00       	call   1180 <printf>
  for (int i = 0; i < histsize; i++){
     20c:	83 c4 10             	add    $0x10,%esp
     20f:	3b 1d 80 1c 00 00    	cmp    0x1c80,%ebx
     215:	7c e1                	jl     1f8 <print_history+0x18>
}
     217:	8d 65 f8             	lea    -0x8(%ebp),%esp
     21a:	31 c0                	xor    %eax,%eax
     21c:	5b                   	pop    %ebx
     21d:	5e                   	pop    %esi
     21e:	5d                   	pop    %ebp
     21f:	c3                   	ret
     220:	31 c0                	xor    %eax,%eax
     222:	c3                   	ret
     223:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     22a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000230 <add_history>:
int add_history(char* cmd){
     230:	55                   	push   %ebp
     231:	89 e5                	mov    %esp,%ebp
     233:	56                   	push   %esi
     234:	53                   	push   %ebx
  for (int i = histsize; i >= 0; i--){
     235:	8b 35 80 1c 00 00    	mov    0x1c80,%esi
     23b:	85 f6                	test   %esi,%esi
     23d:	78 51                	js     290 <add_history+0x60>
     23f:	6b de 64             	imul   $0x64,%esi,%ebx
     242:	81 c3 a0 1c 00 00    	add    $0x1ca0,%ebx
     248:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     24f:	90                   	nop
    strcpy(cmdlist[i+1], cmdlist[i]);
     250:	83 ec 08             	sub    $0x8,%esp
     253:	8d 43 64             	lea    0x64(%ebx),%eax
  for (int i = histsize; i >= 0; i--){
     256:	83 ee 01             	sub    $0x1,%esi
    strcpy(cmdlist[i+1], cmdlist[i]);
     259:	53                   	push   %ebx
  for (int i = histsize; i >= 0; i--){
     25a:	83 eb 64             	sub    $0x64,%ebx
    strcpy(cmdlist[i+1], cmdlist[i]);
     25d:	50                   	push   %eax
     25e:	e8 7d 0b 00 00       	call   de0 <strcpy>
  for (int i = histsize; i >= 0; i--){
     263:	83 c4 10             	add    $0x10,%esp
     266:	83 fe ff             	cmp    $0xffffffff,%esi
     269:	75 e5                	jne    250 <add_history+0x20>
  if (histsize < 10) {
     26b:	8b 35 80 1c 00 00    	mov    0x1c80,%esi
     271:	83 fe 09             	cmp    $0x9,%esi
     274:	7e 1a                	jle    290 <add_history+0x60>
  strcpy(cmdlist[0], cmd);
     276:	83 ec 08             	sub    $0x8,%esp
     279:	ff 75 08             	push   0x8(%ebp)
     27c:	68 a0 1c 00 00       	push   $0x1ca0
     281:	e8 5a 0b 00 00       	call   de0 <strcpy>
}
     286:	8d 65 f8             	lea    -0x8(%ebp),%esp
     289:	31 c0                	xor    %eax,%eax
     28b:	5b                   	pop    %ebx
     28c:	5e                   	pop    %esi
     28d:	5d                   	pop    %ebp
     28e:	c3                   	ret
     28f:	90                   	nop
    histsize++;
     290:	83 c6 01             	add    $0x1,%esi
     293:	89 35 80 1c 00 00    	mov    %esi,0x1c80
     299:	eb db                	jmp    276 <add_history+0x46>
     29b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     29f:	90                   	nop

000002a0 <getcmd>:
{
     2a0:	55                   	push   %ebp
     2a1:	89 e5                	mov    %esp,%ebp
     2a3:	56                   	push   %esi
     2a4:	53                   	push   %ebx
     2a5:	8b 5d 08             	mov    0x8(%ebp),%ebx
     2a8:	8b 75 0c             	mov    0xc(%ebp),%esi
  printf(2, "$ ");
     2ab:	83 ec 08             	sub    $0x8,%esp
     2ae:	68 c0 14 00 00       	push   $0x14c0
     2b3:	6a 02                	push   $0x2
     2b5:	e8 c6 0e 00 00       	call   1180 <printf>
  memset(buf, 0, nbuf);
     2ba:	83 c4 0c             	add    $0xc,%esp
     2bd:	56                   	push   %esi
     2be:	6a 00                	push   $0x0
     2c0:	53                   	push   %ebx
     2c1:	e8 da 0b 00 00       	call   ea0 <memset>
  gets(buf, nbuf);
     2c6:	58                   	pop    %eax
     2c7:	5a                   	pop    %edx
     2c8:	56                   	push   %esi
     2c9:	53                   	push   %ebx
     2ca:	e8 31 0c 00 00       	call   f00 <gets>
  if(buf[0] == 0) // EOF
     2cf:	83 c4 10             	add    $0x10,%esp
     2d2:	80 3b 01             	cmpb   $0x1,(%ebx)
     2d5:	19 c0                	sbb    %eax,%eax
}
     2d7:	8d 65 f8             	lea    -0x8(%ebp),%esp
     2da:	5b                   	pop    %ebx
     2db:	5e                   	pop    %esi
     2dc:	5d                   	pop    %ebp
     2dd:	c3                   	ret
     2de:	66 90                	xchg   %ax,%ax

000002e0 <panic>:
{
     2e0:	55                   	push   %ebp
     2e1:	89 e5                	mov    %esp,%ebp
     2e3:	83 ec 0c             	sub    $0xc,%esp
  printf(2, "%s\n", s);
     2e6:	ff 75 08             	push   0x8(%ebp)
     2e9:	68 31 15 00 00       	push   $0x1531
     2ee:	6a 02                	push   $0x2
     2f0:	e8 8b 0e 00 00       	call   1180 <printf>
  exit();
     2f5:	e8 29 0d 00 00       	call   1023 <exit>
     2fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000300 <fork1>:
{
     300:	55                   	push   %ebp
     301:	89 e5                	mov    %esp,%ebp
     303:	83 ec 08             	sub    $0x8,%esp
  pid = fork();
     306:	e8 10 0d 00 00       	call   101b <fork>
  if(pid == -1)
     30b:	83 f8 ff             	cmp    $0xffffffff,%eax
     30e:	74 02                	je     312 <fork1+0x12>
  return pid;
}
     310:	c9                   	leave
     311:	c3                   	ret
    panic("fork");
     312:	83 ec 0c             	sub    $0xc,%esp
     315:	68 c3 14 00 00       	push   $0x14c3
     31a:	e8 c1 ff ff ff       	call   2e0 <panic>
     31f:	90                   	nop

00000320 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     320:	55                   	push   %ebp
     321:	89 e5                	mov    %esp,%ebp
     323:	53                   	push   %ebx
     324:	83 ec 10             	sub    $0x10,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     327:	6a 54                	push   $0x54
     329:	e8 92 10 00 00       	call   13c0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     32e:	83 c4 0c             	add    $0xc,%esp
     331:	6a 54                	push   $0x54
  cmd = malloc(sizeof(*cmd));
     333:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     335:	6a 00                	push   $0x0
     337:	50                   	push   %eax
     338:	e8 63 0b 00 00       	call   ea0 <memset>
  cmd->type = EXEC;
     33d:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  return (struct cmd*)cmd;
}
     343:	89 d8                	mov    %ebx,%eax
     345:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     348:	c9                   	leave
     349:	c3                   	ret
     34a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000350 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     350:	55                   	push   %ebp
     351:	89 e5                	mov    %esp,%ebp
     353:	53                   	push   %ebx
     354:	83 ec 10             	sub    $0x10,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     357:	6a 18                	push   $0x18
     359:	e8 62 10 00 00       	call   13c0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     35e:	83 c4 0c             	add    $0xc,%esp
     361:	6a 18                	push   $0x18
  cmd = malloc(sizeof(*cmd));
     363:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     365:	6a 00                	push   $0x0
     367:	50                   	push   %eax
     368:	e8 33 0b 00 00       	call   ea0 <memset>
  cmd->type = REDIR;
  cmd->cmd = subcmd;
     36d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = REDIR;
     370:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
  cmd->cmd = subcmd;
     376:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->file = file;
     379:	8b 45 0c             	mov    0xc(%ebp),%eax
     37c:	89 43 08             	mov    %eax,0x8(%ebx)
  cmd->efile = efile;
     37f:	8b 45 10             	mov    0x10(%ebp),%eax
     382:	89 43 0c             	mov    %eax,0xc(%ebx)
  cmd->mode = mode;
     385:	8b 45 14             	mov    0x14(%ebp),%eax
     388:	89 43 10             	mov    %eax,0x10(%ebx)
  cmd->fd = fd;
     38b:	8b 45 18             	mov    0x18(%ebp),%eax
     38e:	89 43 14             	mov    %eax,0x14(%ebx)
  return (struct cmd*)cmd;
}
     391:	89 d8                	mov    %ebx,%eax
     393:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     396:	c9                   	leave
     397:	c3                   	ret
     398:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     39f:	90                   	nop

000003a0 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     3a0:	55                   	push   %ebp
     3a1:	89 e5                	mov    %esp,%ebp
     3a3:	53                   	push   %ebx
     3a4:	83 ec 10             	sub    $0x10,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3a7:	6a 0c                	push   $0xc
     3a9:	e8 12 10 00 00       	call   13c0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     3ae:	83 c4 0c             	add    $0xc,%esp
     3b1:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     3b3:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     3b5:	6a 00                	push   $0x0
     3b7:	50                   	push   %eax
     3b8:	e8 e3 0a 00 00       	call   ea0 <memset>
  cmd->type = PIPE;
  cmd->left = left;
     3bd:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = PIPE;
     3c0:	c7 03 03 00 00 00    	movl   $0x3,(%ebx)
  cmd->left = left;
     3c6:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     3c9:	8b 45 0c             	mov    0xc(%ebp),%eax
     3cc:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     3cf:	89 d8                	mov    %ebx,%eax
     3d1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     3d4:	c9                   	leave
     3d5:	c3                   	ret
     3d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     3dd:	8d 76 00             	lea    0x0(%esi),%esi

000003e0 <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     3e0:	55                   	push   %ebp
     3e1:	89 e5                	mov    %esp,%ebp
     3e3:	53                   	push   %ebx
     3e4:	83 ec 10             	sub    $0x10,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3e7:	6a 0c                	push   $0xc
     3e9:	e8 d2 0f 00 00       	call   13c0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     3ee:	83 c4 0c             	add    $0xc,%esp
     3f1:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     3f3:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     3f5:	6a 00                	push   $0x0
     3f7:	50                   	push   %eax
     3f8:	e8 a3 0a 00 00       	call   ea0 <memset>
  cmd->type = LIST;
  cmd->left = left;
     3fd:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = LIST;
     400:	c7 03 04 00 00 00    	movl   $0x4,(%ebx)
  cmd->left = left;
     406:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     409:	8b 45 0c             	mov    0xc(%ebp),%eax
     40c:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     40f:	89 d8                	mov    %ebx,%eax
     411:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     414:	c9                   	leave
     415:	c3                   	ret
     416:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     41d:	8d 76 00             	lea    0x0(%esi),%esi

00000420 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     420:	55                   	push   %ebp
     421:	89 e5                	mov    %esp,%ebp
     423:	53                   	push   %ebx
     424:	83 ec 10             	sub    $0x10,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     427:	6a 08                	push   $0x8
     429:	e8 92 0f 00 00       	call   13c0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     42e:	83 c4 0c             	add    $0xc,%esp
     431:	6a 08                	push   $0x8
  cmd = malloc(sizeof(*cmd));
     433:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     435:	6a 00                	push   $0x0
     437:	50                   	push   %eax
     438:	e8 63 0a 00 00       	call   ea0 <memset>
  cmd->type = BACK;
  cmd->cmd = subcmd;
     43d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = BACK;
     440:	c7 03 05 00 00 00    	movl   $0x5,(%ebx)
  cmd->cmd = subcmd;
     446:	89 43 04             	mov    %eax,0x4(%ebx)
  return (struct cmd*)cmd;
}
     449:	89 d8                	mov    %ebx,%eax
     44b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     44e:	c9                   	leave
     44f:	c3                   	ret

00000450 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     450:	55                   	push   %ebp
     451:	89 e5                	mov    %esp,%ebp
     453:	57                   	push   %edi
     454:	56                   	push   %esi
     455:	53                   	push   %ebx
     456:	83 ec 0c             	sub    $0xc,%esp
  char *s;
  int ret;

  s = *ps;
     459:	8b 45 08             	mov    0x8(%ebp),%eax
{
     45c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     45f:	8b 75 10             	mov    0x10(%ebp),%esi
  s = *ps;
     462:	8b 38                	mov    (%eax),%edi
  while(s < es && strchr(whitespace, *s))
     464:	39 df                	cmp    %ebx,%edi
     466:	72 0f                	jb     477 <gettoken+0x27>
     468:	eb 25                	jmp    48f <gettoken+0x3f>
     46a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    s++;
     470:	83 c7 01             	add    $0x1,%edi
  while(s < es && strchr(whitespace, *s))
     473:	39 fb                	cmp    %edi,%ebx
     475:	74 18                	je     48f <gettoken+0x3f>
     477:	0f be 07             	movsbl (%edi),%eax
     47a:	83 ec 08             	sub    $0x8,%esp
     47d:	50                   	push   %eax
     47e:	68 64 1c 00 00       	push   $0x1c64
     483:	e8 38 0a 00 00       	call   ec0 <strchr>
     488:	83 c4 10             	add    $0x10,%esp
     48b:	85 c0                	test   %eax,%eax
     48d:	75 e1                	jne    470 <gettoken+0x20>
  if(q)
     48f:	85 f6                	test   %esi,%esi
     491:	74 02                	je     495 <gettoken+0x45>
    *q = s;
     493:	89 3e                	mov    %edi,(%esi)
  ret = *s;
     495:	0f b6 07             	movzbl (%edi),%eax
  switch(*s){
     498:	3c 3c                	cmp    $0x3c,%al
     49a:	0f 8f d0 00 00 00    	jg     570 <gettoken+0x120>
     4a0:	3c 3a                	cmp    $0x3a,%al
     4a2:	0f 8f bc 00 00 00    	jg     564 <gettoken+0x114>
     4a8:	84 c0                	test   %al,%al
     4aa:	75 44                	jne    4f0 <gettoken+0xa0>
     4ac:	31 f6                	xor    %esi,%esi
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     4ae:	8b 4d 14             	mov    0x14(%ebp),%ecx
     4b1:	85 c9                	test   %ecx,%ecx
     4b3:	74 05                	je     4ba <gettoken+0x6a>
    *eq = s;
     4b5:	8b 45 14             	mov    0x14(%ebp),%eax
     4b8:	89 38                	mov    %edi,(%eax)

  while(s < es && strchr(whitespace, *s))
     4ba:	39 df                	cmp    %ebx,%edi
     4bc:	72 09                	jb     4c7 <gettoken+0x77>
     4be:	eb 1f                	jmp    4df <gettoken+0x8f>
    s++;
     4c0:	83 c7 01             	add    $0x1,%edi
  while(s < es && strchr(whitespace, *s))
     4c3:	39 fb                	cmp    %edi,%ebx
     4c5:	74 18                	je     4df <gettoken+0x8f>
     4c7:	0f be 07             	movsbl (%edi),%eax
     4ca:	83 ec 08             	sub    $0x8,%esp
     4cd:	50                   	push   %eax
     4ce:	68 64 1c 00 00       	push   $0x1c64
     4d3:	e8 e8 09 00 00       	call   ec0 <strchr>
     4d8:	83 c4 10             	add    $0x10,%esp
     4db:	85 c0                	test   %eax,%eax
     4dd:	75 e1                	jne    4c0 <gettoken+0x70>
  *ps = s;
     4df:	8b 45 08             	mov    0x8(%ebp),%eax
     4e2:	89 38                	mov    %edi,(%eax)
  return ret;
}
     4e4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     4e7:	89 f0                	mov    %esi,%eax
     4e9:	5b                   	pop    %ebx
     4ea:	5e                   	pop    %esi
     4eb:	5f                   	pop    %edi
     4ec:	5d                   	pop    %ebp
     4ed:	c3                   	ret
     4ee:	66 90                	xchg   %ax,%ax
  switch(*s){
     4f0:	79 66                	jns    558 <gettoken+0x108>
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     4f2:	39 df                	cmp    %ebx,%edi
     4f4:	72 39                	jb     52f <gettoken+0xdf>
  if(eq)
     4f6:	8b 55 14             	mov    0x14(%ebp),%edx
     4f9:	85 d2                	test   %edx,%edx
     4fb:	0f 84 b3 00 00 00    	je     5b4 <gettoken+0x164>
    *eq = s;
     501:	8b 45 14             	mov    0x14(%ebp),%eax
     504:	89 38                	mov    %edi,(%eax)
  while(s < es && strchr(whitespace, *s))
     506:	e9 a9 00 00 00       	jmp    5b4 <gettoken+0x164>
     50b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     50f:	90                   	nop
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     510:	0f be 07             	movsbl (%edi),%eax
     513:	83 ec 08             	sub    $0x8,%esp
     516:	50                   	push   %eax
     517:	68 5c 1c 00 00       	push   $0x1c5c
     51c:	e8 9f 09 00 00       	call   ec0 <strchr>
     521:	83 c4 10             	add    $0x10,%esp
     524:	85 c0                	test   %eax,%eax
     526:	75 1f                	jne    547 <gettoken+0xf7>
      s++;
     528:	83 c7 01             	add    $0x1,%edi
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     52b:	39 fb                	cmp    %edi,%ebx
     52d:	74 77                	je     5a6 <gettoken+0x156>
     52f:	0f be 07             	movsbl (%edi),%eax
     532:	83 ec 08             	sub    $0x8,%esp
     535:	50                   	push   %eax
     536:	68 64 1c 00 00       	push   $0x1c64
     53b:	e8 80 09 00 00       	call   ec0 <strchr>
     540:	83 c4 10             	add    $0x10,%esp
     543:	85 c0                	test   %eax,%eax
     545:	74 c9                	je     510 <gettoken+0xc0>
    ret = 'a';
     547:	be 61 00 00 00       	mov    $0x61,%esi
     54c:	e9 5d ff ff ff       	jmp    4ae <gettoken+0x5e>
     551:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  switch(*s){
     558:	3c 26                	cmp    $0x26,%al
     55a:	74 08                	je     564 <gettoken+0x114>
     55c:	8d 48 d8             	lea    -0x28(%eax),%ecx
     55f:	80 f9 01             	cmp    $0x1,%cl
     562:	77 8e                	ja     4f2 <gettoken+0xa2>
  ret = *s;
     564:	0f be f0             	movsbl %al,%esi
    s++;
     567:	83 c7 01             	add    $0x1,%edi
    break;
     56a:	e9 3f ff ff ff       	jmp    4ae <gettoken+0x5e>
     56f:	90                   	nop
  switch(*s){
     570:	3c 3e                	cmp    $0x3e,%al
     572:	75 1c                	jne    590 <gettoken+0x140>
    if(*s == '>'){
     574:	80 7f 01 3e          	cmpb   $0x3e,0x1(%edi)
     578:	74 1f                	je     599 <gettoken+0x149>
    s++;
     57a:	83 c7 01             	add    $0x1,%edi
  ret = *s;
     57d:	be 3e 00 00 00       	mov    $0x3e,%esi
     582:	e9 27 ff ff ff       	jmp    4ae <gettoken+0x5e>
     587:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     58e:	66 90                	xchg   %ax,%ax
  switch(*s){
     590:	3c 7c                	cmp    $0x7c,%al
     592:	74 d0                	je     564 <gettoken+0x114>
     594:	e9 59 ff ff ff       	jmp    4f2 <gettoken+0xa2>
      s++;
     599:	83 c7 02             	add    $0x2,%edi
      ret = '+';
     59c:	be 2b 00 00 00       	mov    $0x2b,%esi
     5a1:	e9 08 ff ff ff       	jmp    4ae <gettoken+0x5e>
  if(eq)
     5a6:	8b 45 14             	mov    0x14(%ebp),%eax
     5a9:	85 c0                	test   %eax,%eax
     5ab:	74 05                	je     5b2 <gettoken+0x162>
    *eq = s;
     5ad:	8b 45 14             	mov    0x14(%ebp),%eax
     5b0:	89 18                	mov    %ebx,(%eax)
      s++;
     5b2:	89 df                	mov    %ebx,%edi
    ret = 'a';
     5b4:	be 61 00 00 00       	mov    $0x61,%esi
     5b9:	e9 21 ff ff ff       	jmp    4df <gettoken+0x8f>
     5be:	66 90                	xchg   %ax,%ax

000005c0 <peek>:

int
peek(char **ps, char *es, char *toks)
{
     5c0:	55                   	push   %ebp
     5c1:	89 e5                	mov    %esp,%ebp
     5c3:	57                   	push   %edi
     5c4:	56                   	push   %esi
     5c5:	53                   	push   %ebx
     5c6:	83 ec 0c             	sub    $0xc,%esp
     5c9:	8b 7d 08             	mov    0x8(%ebp),%edi
     5cc:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *s;

  s = *ps;
     5cf:	8b 1f                	mov    (%edi),%ebx
  while(s < es && strchr(whitespace, *s))
     5d1:	39 f3                	cmp    %esi,%ebx
     5d3:	72 12                	jb     5e7 <peek+0x27>
     5d5:	eb 28                	jmp    5ff <peek+0x3f>
     5d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     5de:	66 90                	xchg   %ax,%ax
    s++;
     5e0:	83 c3 01             	add    $0x1,%ebx
  while(s < es && strchr(whitespace, *s))
     5e3:	39 de                	cmp    %ebx,%esi
     5e5:	74 18                	je     5ff <peek+0x3f>
     5e7:	0f be 03             	movsbl (%ebx),%eax
     5ea:	83 ec 08             	sub    $0x8,%esp
     5ed:	50                   	push   %eax
     5ee:	68 64 1c 00 00       	push   $0x1c64
     5f3:	e8 c8 08 00 00       	call   ec0 <strchr>
     5f8:	83 c4 10             	add    $0x10,%esp
     5fb:	85 c0                	test   %eax,%eax
     5fd:	75 e1                	jne    5e0 <peek+0x20>
  *ps = s;
     5ff:	89 1f                	mov    %ebx,(%edi)
  return *s && strchr(toks, *s);
     601:	0f be 03             	movsbl (%ebx),%eax
     604:	31 d2                	xor    %edx,%edx
     606:	84 c0                	test   %al,%al
     608:	75 0e                	jne    618 <peek+0x58>
}
     60a:	8d 65 f4             	lea    -0xc(%ebp),%esp
     60d:	89 d0                	mov    %edx,%eax
     60f:	5b                   	pop    %ebx
     610:	5e                   	pop    %esi
     611:	5f                   	pop    %edi
     612:	5d                   	pop    %ebp
     613:	c3                   	ret
     614:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  return *s && strchr(toks, *s);
     618:	83 ec 08             	sub    $0x8,%esp
     61b:	50                   	push   %eax
     61c:	ff 75 10             	push   0x10(%ebp)
     61f:	e8 9c 08 00 00       	call   ec0 <strchr>
     624:	83 c4 10             	add    $0x10,%esp
     627:	31 d2                	xor    %edx,%edx
     629:	85 c0                	test   %eax,%eax
     62b:	0f 95 c2             	setne  %dl
}
     62e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     631:	5b                   	pop    %ebx
     632:	89 d0                	mov    %edx,%eax
     634:	5e                   	pop    %esi
     635:	5f                   	pop    %edi
     636:	5d                   	pop    %ebp
     637:	c3                   	ret
     638:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     63f:	90                   	nop

00000640 <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     640:	55                   	push   %ebp
     641:	89 e5                	mov    %esp,%ebp
     643:	57                   	push   %edi
     644:	56                   	push   %esi
     645:	53                   	push   %ebx
     646:	83 ec 2c             	sub    $0x2c,%esp
     649:	8b 75 0c             	mov    0xc(%ebp),%esi
     64c:	8b 5d 10             	mov    0x10(%ebp),%ebx
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     64f:	90                   	nop
     650:	83 ec 04             	sub    $0x4,%esp
     653:	68 e5 14 00 00       	push   $0x14e5
     658:	53                   	push   %ebx
     659:	56                   	push   %esi
     65a:	e8 61 ff ff ff       	call   5c0 <peek>
     65f:	83 c4 10             	add    $0x10,%esp
     662:	85 c0                	test   %eax,%eax
     664:	0f 84 f6 00 00 00    	je     760 <parseredirs+0x120>
    tok = gettoken(ps, es, 0, 0);
     66a:	6a 00                	push   $0x0
     66c:	6a 00                	push   $0x0
     66e:	53                   	push   %ebx
     66f:	56                   	push   %esi
     670:	e8 db fd ff ff       	call   450 <gettoken>
     675:	89 c7                	mov    %eax,%edi
    if(gettoken(ps, es, &q, &eq) != 'a')
     677:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     67a:	50                   	push   %eax
     67b:	8d 45 e0             	lea    -0x20(%ebp),%eax
     67e:	50                   	push   %eax
     67f:	53                   	push   %ebx
     680:	56                   	push   %esi
     681:	e8 ca fd ff ff       	call   450 <gettoken>
     686:	83 c4 20             	add    $0x20,%esp
     689:	83 f8 61             	cmp    $0x61,%eax
     68c:	0f 85 d9 00 00 00    	jne    76b <parseredirs+0x12b>
      panic("missing file for redirection");
    switch(tok){
     692:	83 ff 3c             	cmp    $0x3c,%edi
     695:	74 69                	je     700 <parseredirs+0xc0>
     697:	83 ff 3e             	cmp    $0x3e,%edi
     69a:	74 05                	je     6a1 <parseredirs+0x61>
     69c:	83 ff 2b             	cmp    $0x2b,%edi
     69f:	75 af                	jne    650 <parseredirs+0x10>
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     6a1:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     6a4:	8b 4d e0             	mov    -0x20(%ebp),%ecx
  cmd = malloc(sizeof(*cmd));
     6a7:	83 ec 0c             	sub    $0xc,%esp
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     6aa:	89 55 d0             	mov    %edx,-0x30(%ebp)
     6ad:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
  cmd = malloc(sizeof(*cmd));
     6b0:	6a 18                	push   $0x18
     6b2:	e8 09 0d 00 00       	call   13c0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     6b7:	83 c4 0c             	add    $0xc,%esp
     6ba:	6a 18                	push   $0x18
  cmd = malloc(sizeof(*cmd));
     6bc:	89 c7                	mov    %eax,%edi
  memset(cmd, 0, sizeof(*cmd));
     6be:	6a 00                	push   $0x0
     6c0:	50                   	push   %eax
     6c1:	e8 da 07 00 00       	call   ea0 <memset>
  cmd->type = REDIR;
     6c6:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
  cmd->cmd = subcmd;
     6cc:	8b 45 08             	mov    0x8(%ebp),%eax
      break;
     6cf:	83 c4 10             	add    $0x10,%esp
  cmd->cmd = subcmd;
     6d2:	89 47 04             	mov    %eax,0x4(%edi)
  cmd->file = file;
     6d5:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
     6d8:	89 4f 08             	mov    %ecx,0x8(%edi)
  cmd->efile = efile;
     6db:	8b 55 d0             	mov    -0x30(%ebp),%edx
  cmd->mode = mode;
     6de:	c7 47 10 01 02 00 00 	movl   $0x201,0x10(%edi)
  cmd->efile = efile;
     6e5:	89 57 0c             	mov    %edx,0xc(%edi)
  cmd->fd = fd;
     6e8:	c7 47 14 01 00 00 00 	movl   $0x1,0x14(%edi)
      break;
     6ef:	89 7d 08             	mov    %edi,0x8(%ebp)
     6f2:	e9 59 ff ff ff       	jmp    650 <parseredirs+0x10>
     6f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     6fe:	66 90                	xchg   %ax,%ax
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     700:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     703:	8b 4d e0             	mov    -0x20(%ebp),%ecx
  cmd = malloc(sizeof(*cmd));
     706:	83 ec 0c             	sub    $0xc,%esp
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     709:	89 55 d0             	mov    %edx,-0x30(%ebp)
     70c:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
  cmd = malloc(sizeof(*cmd));
     70f:	6a 18                	push   $0x18
     711:	e8 aa 0c 00 00       	call   13c0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     716:	83 c4 0c             	add    $0xc,%esp
     719:	6a 18                	push   $0x18
  cmd = malloc(sizeof(*cmd));
     71b:	89 c7                	mov    %eax,%edi
  memset(cmd, 0, sizeof(*cmd));
     71d:	6a 00                	push   $0x0
     71f:	50                   	push   %eax
     720:	e8 7b 07 00 00       	call   ea0 <memset>
  cmd->cmd = subcmd;
     725:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->file = file;
     728:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      break;
     72b:	89 7d 08             	mov    %edi,0x8(%ebp)
  cmd->efile = efile;
     72e:	8b 55 d0             	mov    -0x30(%ebp),%edx
  cmd->type = REDIR;
     731:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
      break;
     737:	83 c4 10             	add    $0x10,%esp
  cmd->cmd = subcmd;
     73a:	89 47 04             	mov    %eax,0x4(%edi)
  cmd->file = file;
     73d:	89 4f 08             	mov    %ecx,0x8(%edi)
  cmd->efile = efile;
     740:	89 57 0c             	mov    %edx,0xc(%edi)
  cmd->mode = mode;
     743:	c7 47 10 00 00 00 00 	movl   $0x0,0x10(%edi)
  cmd->fd = fd;
     74a:	c7 47 14 00 00 00 00 	movl   $0x0,0x14(%edi)
      break;
     751:	e9 fa fe ff ff       	jmp    650 <parseredirs+0x10>
     756:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     75d:	8d 76 00             	lea    0x0(%esi),%esi
    }
  }
  return cmd;
}
     760:	8b 45 08             	mov    0x8(%ebp),%eax
     763:	8d 65 f4             	lea    -0xc(%ebp),%esp
     766:	5b                   	pop    %ebx
     767:	5e                   	pop    %esi
     768:	5f                   	pop    %edi
     769:	5d                   	pop    %ebp
     76a:	c3                   	ret
      panic("missing file for redirection");
     76b:	83 ec 0c             	sub    $0xc,%esp
     76e:	68 c8 14 00 00       	push   $0x14c8
     773:	e8 68 fb ff ff       	call   2e0 <panic>
     778:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     77f:	90                   	nop

00000780 <parseexec>:
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
     780:	55                   	push   %ebp
     781:	89 e5                	mov    %esp,%ebp
     783:	57                   	push   %edi
     784:	56                   	push   %esi
     785:	53                   	push   %ebx
     786:	83 ec 30             	sub    $0x30,%esp
     789:	8b 5d 08             	mov    0x8(%ebp),%ebx
     78c:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
     78f:	68 e8 14 00 00       	push   $0x14e8
     794:	56                   	push   %esi
     795:	53                   	push   %ebx
     796:	e8 25 fe ff ff       	call   5c0 <peek>
     79b:	83 c4 10             	add    $0x10,%esp
     79e:	85 c0                	test   %eax,%eax
     7a0:	0f 85 aa 00 00 00    	jne    850 <parseexec+0xd0>
  cmd = malloc(sizeof(*cmd));
     7a6:	83 ec 0c             	sub    $0xc,%esp
     7a9:	89 c7                	mov    %eax,%edi
     7ab:	6a 54                	push   $0x54
     7ad:	e8 0e 0c 00 00       	call   13c0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     7b2:	83 c4 0c             	add    $0xc,%esp
     7b5:	6a 54                	push   $0x54
     7b7:	6a 00                	push   $0x0
     7b9:	89 45 d0             	mov    %eax,-0x30(%ebp)
     7bc:	50                   	push   %eax
     7bd:	e8 de 06 00 00       	call   ea0 <memset>
  cmd->type = EXEC;
     7c2:	8b 45 d0             	mov    -0x30(%ebp),%eax

  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     7c5:	83 c4 0c             	add    $0xc,%esp
  cmd->type = EXEC;
     7c8:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  ret = parseredirs(ret, ps, es);
     7ce:	56                   	push   %esi
     7cf:	53                   	push   %ebx
     7d0:	50                   	push   %eax
     7d1:	e8 6a fe ff ff       	call   640 <parseredirs>
  while(!peek(ps, es, "|)&;")){
     7d6:	83 c4 10             	add    $0x10,%esp
  ret = parseredirs(ret, ps, es);
     7d9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  while(!peek(ps, es, "|)&;")){
     7dc:	eb 15                	jmp    7f3 <parseexec+0x73>
     7de:	66 90                	xchg   %ax,%ax
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
     7e0:	83 ec 04             	sub    $0x4,%esp
     7e3:	56                   	push   %esi
     7e4:	53                   	push   %ebx
     7e5:	ff 75 d4             	push   -0x2c(%ebp)
     7e8:	e8 53 fe ff ff       	call   640 <parseredirs>
     7ed:	83 c4 10             	add    $0x10,%esp
     7f0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  while(!peek(ps, es, "|)&;")){
     7f3:	83 ec 04             	sub    $0x4,%esp
     7f6:	68 ff 14 00 00       	push   $0x14ff
     7fb:	56                   	push   %esi
     7fc:	53                   	push   %ebx
     7fd:	e8 be fd ff ff       	call   5c0 <peek>
     802:	83 c4 10             	add    $0x10,%esp
     805:	85 c0                	test   %eax,%eax
     807:	75 5f                	jne    868 <parseexec+0xe8>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     809:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     80c:	50                   	push   %eax
     80d:	8d 45 e0             	lea    -0x20(%ebp),%eax
     810:	50                   	push   %eax
     811:	56                   	push   %esi
     812:	53                   	push   %ebx
     813:	e8 38 fc ff ff       	call   450 <gettoken>
     818:	83 c4 10             	add    $0x10,%esp
     81b:	85 c0                	test   %eax,%eax
     81d:	74 49                	je     868 <parseexec+0xe8>
    if(tok != 'a')
     81f:	83 f8 61             	cmp    $0x61,%eax
     822:	75 62                	jne    886 <parseexec+0x106>
    cmd->argv[argc] = q;
     824:	8b 45 e0             	mov    -0x20(%ebp),%eax
     827:	8b 55 d0             	mov    -0x30(%ebp),%edx
     82a:	89 44 ba 04          	mov    %eax,0x4(%edx,%edi,4)
    cmd->eargv[argc] = eq;
     82e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     831:	89 44 ba 2c          	mov    %eax,0x2c(%edx,%edi,4)
    argc++;
     835:	83 c7 01             	add    $0x1,%edi
    if(argc >= MAXARGS)
     838:	83 ff 0a             	cmp    $0xa,%edi
     83b:	75 a3                	jne    7e0 <parseexec+0x60>
      panic("too many args");
     83d:	83 ec 0c             	sub    $0xc,%esp
     840:	68 f1 14 00 00       	push   $0x14f1
     845:	e8 96 fa ff ff       	call   2e0 <panic>
     84a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return parseblock(ps, es);
     850:	89 75 0c             	mov    %esi,0xc(%ebp)
     853:	89 5d 08             	mov    %ebx,0x8(%ebp)
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}
     856:	8d 65 f4             	lea    -0xc(%ebp),%esp
     859:	5b                   	pop    %ebx
     85a:	5e                   	pop    %esi
     85b:	5f                   	pop    %edi
     85c:	5d                   	pop    %ebp
    return parseblock(ps, es);
     85d:	e9 ae 01 00 00       	jmp    a10 <parseblock>
     862:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  cmd->argv[argc] = 0;
     868:	8b 45 d0             	mov    -0x30(%ebp),%eax
     86b:	c7 44 b8 04 00 00 00 	movl   $0x0,0x4(%eax,%edi,4)
     872:	00 
  cmd->eargv[argc] = 0;
     873:	c7 44 b8 2c 00 00 00 	movl   $0x0,0x2c(%eax,%edi,4)
     87a:	00 
}
     87b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     87e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     881:	5b                   	pop    %ebx
     882:	5e                   	pop    %esi
     883:	5f                   	pop    %edi
     884:	5d                   	pop    %ebp
     885:	c3                   	ret
      panic("syntax");
     886:	83 ec 0c             	sub    $0xc,%esp
     889:	68 ea 14 00 00       	push   $0x14ea
     88e:	e8 4d fa ff ff       	call   2e0 <panic>
     893:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     89a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000008a0 <parsepipe>:
{
     8a0:	55                   	push   %ebp
     8a1:	89 e5                	mov    %esp,%ebp
     8a3:	57                   	push   %edi
     8a4:	56                   	push   %esi
     8a5:	53                   	push   %ebx
     8a6:	83 ec 14             	sub    $0x14,%esp
     8a9:	8b 75 08             	mov    0x8(%ebp),%esi
     8ac:	8b 7d 0c             	mov    0xc(%ebp),%edi
  cmd = parseexec(ps, es);
     8af:	57                   	push   %edi
     8b0:	56                   	push   %esi
     8b1:	e8 ca fe ff ff       	call   780 <parseexec>
  if(peek(ps, es, "|")){
     8b6:	83 c4 0c             	add    $0xc,%esp
     8b9:	68 04 15 00 00       	push   $0x1504
  cmd = parseexec(ps, es);
     8be:	89 c3                	mov    %eax,%ebx
  if(peek(ps, es, "|")){
     8c0:	57                   	push   %edi
     8c1:	56                   	push   %esi
     8c2:	e8 f9 fc ff ff       	call   5c0 <peek>
     8c7:	83 c4 10             	add    $0x10,%esp
     8ca:	85 c0                	test   %eax,%eax
     8cc:	75 12                	jne    8e0 <parsepipe+0x40>
}
     8ce:	8d 65 f4             	lea    -0xc(%ebp),%esp
     8d1:	89 d8                	mov    %ebx,%eax
     8d3:	5b                   	pop    %ebx
     8d4:	5e                   	pop    %esi
     8d5:	5f                   	pop    %edi
     8d6:	5d                   	pop    %ebp
     8d7:	c3                   	ret
     8d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     8df:	90                   	nop
    gettoken(ps, es, 0, 0);
     8e0:	6a 00                	push   $0x0
     8e2:	6a 00                	push   $0x0
     8e4:	57                   	push   %edi
     8e5:	56                   	push   %esi
     8e6:	e8 65 fb ff ff       	call   450 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     8eb:	58                   	pop    %eax
     8ec:	5a                   	pop    %edx
     8ed:	57                   	push   %edi
     8ee:	56                   	push   %esi
     8ef:	e8 ac ff ff ff       	call   8a0 <parsepipe>
  cmd = malloc(sizeof(*cmd));
     8f4:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
    cmd = pipecmd(cmd, parsepipe(ps, es));
     8fb:	89 c7                	mov    %eax,%edi
  cmd = malloc(sizeof(*cmd));
     8fd:	e8 be 0a 00 00       	call   13c0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     902:	83 c4 0c             	add    $0xc,%esp
     905:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     907:	89 c6                	mov    %eax,%esi
  memset(cmd, 0, sizeof(*cmd));
     909:	6a 00                	push   $0x0
     90b:	50                   	push   %eax
     90c:	e8 8f 05 00 00       	call   ea0 <memset>
  cmd->left = left;
     911:	89 5e 04             	mov    %ebx,0x4(%esi)
  cmd->right = right;
     914:	83 c4 10             	add    $0x10,%esp
     917:	89 f3                	mov    %esi,%ebx
  cmd->type = PIPE;
     919:	c7 06 03 00 00 00    	movl   $0x3,(%esi)
}
     91f:	89 d8                	mov    %ebx,%eax
  cmd->right = right;
     921:	89 7e 08             	mov    %edi,0x8(%esi)
}
     924:	8d 65 f4             	lea    -0xc(%ebp),%esp
     927:	5b                   	pop    %ebx
     928:	5e                   	pop    %esi
     929:	5f                   	pop    %edi
     92a:	5d                   	pop    %ebp
     92b:	c3                   	ret
     92c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000930 <parseline>:
{
     930:	55                   	push   %ebp
     931:	89 e5                	mov    %esp,%ebp
     933:	57                   	push   %edi
     934:	56                   	push   %esi
     935:	53                   	push   %ebx
     936:	83 ec 24             	sub    $0x24,%esp
     939:	8b 75 08             	mov    0x8(%ebp),%esi
     93c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  cmd = parsepipe(ps, es);
     93f:	57                   	push   %edi
     940:	56                   	push   %esi
     941:	e8 5a ff ff ff       	call   8a0 <parsepipe>
  while(peek(ps, es, "&")){
     946:	83 c4 10             	add    $0x10,%esp
  cmd = parsepipe(ps, es);
     949:	89 c3                	mov    %eax,%ebx
  while(peek(ps, es, "&")){
     94b:	eb 3b                	jmp    988 <parseline+0x58>
     94d:	8d 76 00             	lea    0x0(%esi),%esi
    gettoken(ps, es, 0, 0);
     950:	6a 00                	push   $0x0
     952:	6a 00                	push   $0x0
     954:	57                   	push   %edi
     955:	56                   	push   %esi
     956:	e8 f5 fa ff ff       	call   450 <gettoken>
  cmd = malloc(sizeof(*cmd));
     95b:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
     962:	e8 59 0a 00 00       	call   13c0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     967:	83 c4 0c             	add    $0xc,%esp
     96a:	6a 08                	push   $0x8
     96c:	6a 00                	push   $0x0
     96e:	50                   	push   %eax
     96f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     972:	e8 29 05 00 00       	call   ea0 <memset>
  cmd->type = BACK;
     977:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  cmd->cmd = subcmd;
     97a:	83 c4 10             	add    $0x10,%esp
  cmd->type = BACK;
     97d:	c7 02 05 00 00 00    	movl   $0x5,(%edx)
  cmd->cmd = subcmd;
     983:	89 5a 04             	mov    %ebx,0x4(%edx)
     986:	89 d3                	mov    %edx,%ebx
  while(peek(ps, es, "&")){
     988:	83 ec 04             	sub    $0x4,%esp
     98b:	68 06 15 00 00       	push   $0x1506
     990:	57                   	push   %edi
     991:	56                   	push   %esi
     992:	e8 29 fc ff ff       	call   5c0 <peek>
     997:	83 c4 10             	add    $0x10,%esp
     99a:	85 c0                	test   %eax,%eax
     99c:	75 b2                	jne    950 <parseline+0x20>
  if(peek(ps, es, ";")){
     99e:	83 ec 04             	sub    $0x4,%esp
     9a1:	68 02 15 00 00       	push   $0x1502
     9a6:	57                   	push   %edi
     9a7:	56                   	push   %esi
     9a8:	e8 13 fc ff ff       	call   5c0 <peek>
     9ad:	83 c4 10             	add    $0x10,%esp
     9b0:	85 c0                	test   %eax,%eax
     9b2:	75 0c                	jne    9c0 <parseline+0x90>
}
     9b4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     9b7:	89 d8                	mov    %ebx,%eax
     9b9:	5b                   	pop    %ebx
     9ba:	5e                   	pop    %esi
     9bb:	5f                   	pop    %edi
     9bc:	5d                   	pop    %ebp
     9bd:	c3                   	ret
     9be:	66 90                	xchg   %ax,%ax
    gettoken(ps, es, 0, 0);
     9c0:	6a 00                	push   $0x0
     9c2:	6a 00                	push   $0x0
     9c4:	57                   	push   %edi
     9c5:	56                   	push   %esi
     9c6:	e8 85 fa ff ff       	call   450 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     9cb:	58                   	pop    %eax
     9cc:	5a                   	pop    %edx
     9cd:	57                   	push   %edi
     9ce:	56                   	push   %esi
     9cf:	e8 5c ff ff ff       	call   930 <parseline>
  cmd = malloc(sizeof(*cmd));
     9d4:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
    cmd = listcmd(cmd, parseline(ps, es));
     9db:	89 c7                	mov    %eax,%edi
  cmd = malloc(sizeof(*cmd));
     9dd:	e8 de 09 00 00       	call   13c0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     9e2:	83 c4 0c             	add    $0xc,%esp
     9e5:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     9e7:	89 c6                	mov    %eax,%esi
  memset(cmd, 0, sizeof(*cmd));
     9e9:	6a 00                	push   $0x0
     9eb:	50                   	push   %eax
     9ec:	e8 af 04 00 00       	call   ea0 <memset>
  cmd->left = left;
     9f1:	89 5e 04             	mov    %ebx,0x4(%esi)
  cmd->right = right;
     9f4:	83 c4 10             	add    $0x10,%esp
     9f7:	89 f3                	mov    %esi,%ebx
  cmd->type = LIST;
     9f9:	c7 06 04 00 00 00    	movl   $0x4,(%esi)
}
     9ff:	89 d8                	mov    %ebx,%eax
  cmd->right = right;
     a01:	89 7e 08             	mov    %edi,0x8(%esi)
}
     a04:	8d 65 f4             	lea    -0xc(%ebp),%esp
     a07:	5b                   	pop    %ebx
     a08:	5e                   	pop    %esi
     a09:	5f                   	pop    %edi
     a0a:	5d                   	pop    %ebp
     a0b:	c3                   	ret
     a0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000a10 <parseblock>:
{
     a10:	55                   	push   %ebp
     a11:	89 e5                	mov    %esp,%ebp
     a13:	57                   	push   %edi
     a14:	56                   	push   %esi
     a15:	53                   	push   %ebx
     a16:	83 ec 10             	sub    $0x10,%esp
     a19:	8b 5d 08             	mov    0x8(%ebp),%ebx
     a1c:	8b 75 0c             	mov    0xc(%ebp),%esi
  if(!peek(ps, es, "("))
     a1f:	68 e8 14 00 00       	push   $0x14e8
     a24:	56                   	push   %esi
     a25:	53                   	push   %ebx
     a26:	e8 95 fb ff ff       	call   5c0 <peek>
     a2b:	83 c4 10             	add    $0x10,%esp
     a2e:	85 c0                	test   %eax,%eax
     a30:	74 4a                	je     a7c <parseblock+0x6c>
  gettoken(ps, es, 0, 0);
     a32:	6a 00                	push   $0x0
     a34:	6a 00                	push   $0x0
     a36:	56                   	push   %esi
     a37:	53                   	push   %ebx
     a38:	e8 13 fa ff ff       	call   450 <gettoken>
  cmd = parseline(ps, es);
     a3d:	58                   	pop    %eax
     a3e:	5a                   	pop    %edx
     a3f:	56                   	push   %esi
     a40:	53                   	push   %ebx
     a41:	e8 ea fe ff ff       	call   930 <parseline>
  if(!peek(ps, es, ")"))
     a46:	83 c4 0c             	add    $0xc,%esp
     a49:	68 24 15 00 00       	push   $0x1524
  cmd = parseline(ps, es);
     a4e:	89 c7                	mov    %eax,%edi
  if(!peek(ps, es, ")"))
     a50:	56                   	push   %esi
     a51:	53                   	push   %ebx
     a52:	e8 69 fb ff ff       	call   5c0 <peek>
     a57:	83 c4 10             	add    $0x10,%esp
     a5a:	85 c0                	test   %eax,%eax
     a5c:	74 2b                	je     a89 <parseblock+0x79>
  gettoken(ps, es, 0, 0);
     a5e:	6a 00                	push   $0x0
     a60:	6a 00                	push   $0x0
     a62:	56                   	push   %esi
     a63:	53                   	push   %ebx
     a64:	e8 e7 f9 ff ff       	call   450 <gettoken>
  cmd = parseredirs(cmd, ps, es);
     a69:	83 c4 0c             	add    $0xc,%esp
     a6c:	56                   	push   %esi
     a6d:	53                   	push   %ebx
     a6e:	57                   	push   %edi
     a6f:	e8 cc fb ff ff       	call   640 <parseredirs>
}
     a74:	8d 65 f4             	lea    -0xc(%ebp),%esp
     a77:	5b                   	pop    %ebx
     a78:	5e                   	pop    %esi
     a79:	5f                   	pop    %edi
     a7a:	5d                   	pop    %ebp
     a7b:	c3                   	ret
    panic("parseblock");
     a7c:	83 ec 0c             	sub    $0xc,%esp
     a7f:	68 08 15 00 00       	push   $0x1508
     a84:	e8 57 f8 ff ff       	call   2e0 <panic>
    panic("syntax - missing )");
     a89:	83 ec 0c             	sub    $0xc,%esp
     a8c:	68 13 15 00 00       	push   $0x1513
     a91:	e8 4a f8 ff ff       	call   2e0 <panic>
     a96:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     a9d:	8d 76 00             	lea    0x0(%esi),%esi

00000aa0 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     aa0:	55                   	push   %ebp
     aa1:	89 e5                	mov    %esp,%ebp
     aa3:	53                   	push   %ebx
     aa4:	83 ec 04             	sub    $0x4,%esp
     aa7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     aaa:	85 db                	test   %ebx,%ebx
     aac:	0f 84 7e 00 00 00    	je     b30 <nulterminate+0x90>
    return 0;

  switch(cmd->type){
     ab2:	83 3b 05             	cmpl   $0x5,(%ebx)
     ab5:	77 20                	ja     ad7 <nulterminate+0x37>
     ab7:	8b 03                	mov    (%ebx),%eax
     ab9:	ff 24 85 8c 15 00 00 	jmp    *0x158c(,%eax,4)
    nulterminate(pcmd->right);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    nulterminate(lcmd->left);
     ac0:	83 ec 0c             	sub    $0xc,%esp
     ac3:	ff 73 04             	push   0x4(%ebx)
     ac6:	e8 d5 ff ff ff       	call   aa0 <nulterminate>
    nulterminate(lcmd->right);
     acb:	58                   	pop    %eax
     acc:	ff 73 08             	push   0x8(%ebx)
     acf:	e8 cc ff ff ff       	call   aa0 <nulterminate>
    break;
     ad4:	83 c4 10             	add    $0x10,%esp
    return 0;
     ad7:	89 d8                	mov    %ebx,%eax
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     ad9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     adc:	c9                   	leave
     add:	c3                   	ret
     ade:	66 90                	xchg   %ax,%ax
    nulterminate(bcmd->cmd);
     ae0:	83 ec 0c             	sub    $0xc,%esp
     ae3:	ff 73 04             	push   0x4(%ebx)
     ae6:	e8 b5 ff ff ff       	call   aa0 <nulterminate>
    break;
     aeb:	83 c4 10             	add    $0x10,%esp
     aee:	eb e7                	jmp    ad7 <nulterminate+0x37>
    for(i=0; ecmd->argv[i]; i++)
     af0:	8b 4b 04             	mov    0x4(%ebx),%ecx
     af3:	8d 43 08             	lea    0x8(%ebx),%eax
     af6:	85 c9                	test   %ecx,%ecx
     af8:	74 dd                	je     ad7 <nulterminate+0x37>
     afa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      *ecmd->eargv[i] = 0;
     b00:	8b 50 24             	mov    0x24(%eax),%edx
    for(i=0; ecmd->argv[i]; i++)
     b03:	83 c0 04             	add    $0x4,%eax
      *ecmd->eargv[i] = 0;
     b06:	c6 02 00             	movb   $0x0,(%edx)
    for(i=0; ecmd->argv[i]; i++)
     b09:	8b 50 fc             	mov    -0x4(%eax),%edx
     b0c:	85 d2                	test   %edx,%edx
     b0e:	75 f0                	jne    b00 <nulterminate+0x60>
     b10:	eb c5                	jmp    ad7 <nulterminate+0x37>
     b12:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    nulterminate(rcmd->cmd);
     b18:	83 ec 0c             	sub    $0xc,%esp
     b1b:	ff 73 04             	push   0x4(%ebx)
     b1e:	e8 7d ff ff ff       	call   aa0 <nulterminate>
    *rcmd->efile = 0;
     b23:	8b 43 0c             	mov    0xc(%ebx),%eax
    break;
     b26:	83 c4 10             	add    $0x10,%esp
    *rcmd->efile = 0;
     b29:	c6 00 00             	movb   $0x0,(%eax)
    break;
     b2c:	eb a9                	jmp    ad7 <nulterminate+0x37>
     b2e:	66 90                	xchg   %ax,%ax
    return 0;
     b30:	31 c0                	xor    %eax,%eax
     b32:	eb a5                	jmp    ad9 <nulterminate+0x39>
     b34:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     b3b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     b3f:	90                   	nop

00000b40 <parsecmd>:
{
     b40:	55                   	push   %ebp
     b41:	89 e5                	mov    %esp,%ebp
     b43:	57                   	push   %edi
     b44:	56                   	push   %esi
  cmd = parseline(&s, es);
     b45:	8d 7d 08             	lea    0x8(%ebp),%edi
{
     b48:	53                   	push   %ebx
     b49:	83 ec 18             	sub    $0x18,%esp
  es = s + strlen(s);
     b4c:	8b 5d 08             	mov    0x8(%ebp),%ebx
     b4f:	53                   	push   %ebx
     b50:	e8 1b 03 00 00       	call   e70 <strlen>
  cmd = parseline(&s, es);
     b55:	59                   	pop    %ecx
     b56:	5e                   	pop    %esi
  es = s + strlen(s);
     b57:	01 c3                	add    %eax,%ebx
  cmd = parseline(&s, es);
     b59:	53                   	push   %ebx
     b5a:	57                   	push   %edi
     b5b:	e8 d0 fd ff ff       	call   930 <parseline>
  peek(&s, es, "");
     b60:	83 c4 0c             	add    $0xc,%esp
     b63:	68 56 15 00 00       	push   $0x1556
  cmd = parseline(&s, es);
     b68:	89 c6                	mov    %eax,%esi
  peek(&s, es, "");
     b6a:	53                   	push   %ebx
     b6b:	57                   	push   %edi
     b6c:	e8 4f fa ff ff       	call   5c0 <peek>
  if(s != es){
     b71:	8b 45 08             	mov    0x8(%ebp),%eax
     b74:	83 c4 10             	add    $0x10,%esp
     b77:	39 d8                	cmp    %ebx,%eax
     b79:	75 13                	jne    b8e <parsecmd+0x4e>
  nulterminate(cmd);
     b7b:	83 ec 0c             	sub    $0xc,%esp
     b7e:	56                   	push   %esi
     b7f:	e8 1c ff ff ff       	call   aa0 <nulterminate>
}
     b84:	8d 65 f4             	lea    -0xc(%ebp),%esp
     b87:	89 f0                	mov    %esi,%eax
     b89:	5b                   	pop    %ebx
     b8a:	5e                   	pop    %esi
     b8b:	5f                   	pop    %edi
     b8c:	5d                   	pop    %ebp
     b8d:	c3                   	ret
    printf(2, "leftovers: %s\n", s);
     b8e:	52                   	push   %edx
     b8f:	50                   	push   %eax
     b90:	68 26 15 00 00       	push   $0x1526
     b95:	6a 02                	push   $0x2
     b97:	e8 e4 05 00 00       	call   1180 <printf>
    panic("syntax");
     b9c:	c7 04 24 ea 14 00 00 	movl   $0x14ea,(%esp)
     ba3:	e8 38 f7 ff ff       	call   2e0 <panic>
     ba8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     baf:	90                   	nop

00000bb0 <runcmd>:
{
     bb0:	55                   	push   %ebp
     bb1:	89 e5                	mov    %esp,%ebp
     bb3:	56                   	push   %esi
     bb4:	53                   	push   %ebx
     bb5:	83 ec 10             	sub    $0x10,%esp
     bb8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(cmd == 0)
     bbb:	85 db                	test   %ebx,%ebx
     bbd:	74 21                	je     be0 <runcmd+0x30>
  switch(cmd->type){
     bbf:	83 3b 05             	cmpl   $0x5,(%ebx)
     bc2:	0f 87 17 01 00 00    	ja     cdf <runcmd+0x12f>
     bc8:	8b 03                	mov    (%ebx),%eax
     bca:	ff 24 85 a4 15 00 00 	jmp    *0x15a4(,%eax,4)
    int bpid = fork();
     bd1:	e8 45 04 00 00       	call   101b <fork>
    if (bpid == 0){
     bd6:	85 c0                	test   %eax,%eax
     bd8:	0f 84 f6 00 00 00    	je     cd4 <runcmd+0x124>
     bde:	66 90                	xchg   %ax,%ax
    exit();
     be0:	e8 3e 04 00 00       	call   1023 <exit>
    if(ecmd->argv[0] == 0)
     be5:	8b 43 04             	mov    0x4(%ebx),%eax
     be8:	85 c0                	test   %eax,%eax
     bea:	74 f4                	je     be0 <runcmd+0x30>
    if (strcmp(ecmd->argv[0], "hist") == 0){
     bec:	52                   	push   %edx
     bed:	52                   	push   %edx
     bee:	68 3c 15 00 00       	push   $0x153c
     bf3:	50                   	push   %eax
     bf4:	e8 17 02 00 00       	call   e10 <strcmp>
     bf9:	83 c4 10             	add    $0x10,%esp
     bfc:	85 c0                	test   %eax,%eax
     bfe:	0f 85 f5 00 00 00    	jne    cf9 <runcmd+0x149>
      if (strcmp(ecmd->argv[1], "print") == 0) {
     c04:	50                   	push   %eax
     c05:	50                   	push   %eax
     c06:	68 41 15 00 00       	push   $0x1541
     c0b:	ff 73 08             	push   0x8(%ebx)
     c0e:	e8 fd 01 00 00       	call   e10 <strcmp>
     c13:	83 c4 10             	add    $0x10,%esp
     c16:	85 c0                	test   %eax,%eax
     c18:	0f 85 5f 01 00 00    	jne    d7d <runcmd+0x1cd>
        print_history();
     c1e:	e8 bd f5 ff ff       	call   1e0 <print_history>
        break;
     c23:	eb bb                	jmp    be0 <runcmd+0x30>
    if(pipe(p) < 0)
     c25:	83 ec 0c             	sub    $0xc,%esp
     c28:	8d 45 f0             	lea    -0x10(%ebp),%eax
     c2b:	50                   	push   %eax
     c2c:	e8 02 04 00 00       	call   1033 <pipe>
     c31:	83 c4 10             	add    $0x10,%esp
     c34:	85 c0                	test   %eax,%eax
     c36:	0f 88 b0 00 00 00    	js     cec <runcmd+0x13c>
    if(fork() == 0)
     c3c:	e8 da 03 00 00       	call   101b <fork>
     c41:	85 c0                	test   %eax,%eax
     c43:	0f 84 06 01 00 00    	je     d4f <runcmd+0x19f>
    if(fork() == 0)
     c49:	e8 cd 03 00 00       	call   101b <fork>
     c4e:	85 c0                	test   %eax,%eax
     c50:	0f 84 cb 00 00 00    	je     d21 <runcmd+0x171>
    close(p[0]);
     c56:	83 ec 0c             	sub    $0xc,%esp
     c59:	ff 75 f0             	push   -0x10(%ebp)
     c5c:	e8 ea 03 00 00       	call   104b <close>
    close(p[1]);
     c61:	58                   	pop    %eax
     c62:	ff 75 f4             	push   -0xc(%ebp)
     c65:	e8 e1 03 00 00       	call   104b <close>
    wait();
     c6a:	e8 bc 03 00 00       	call   102b <wait>
    wait();
     c6f:	e8 b7 03 00 00       	call   102b <wait>
    break;
     c74:	83 c4 10             	add    $0x10,%esp
     c77:	e9 64 ff ff ff       	jmp    be0 <runcmd+0x30>
    int pid = fork();
     c7c:	e8 9a 03 00 00       	call   101b <fork>
    if(pid == 0)
     c81:	85 c0                	test   %eax,%eax
     c83:	74 4f                	je     cd4 <runcmd+0x124>
    wait();
     c85:	e8 a1 03 00 00       	call   102b <wait>
    runcmd(lcmd->right);
     c8a:	83 ec 0c             	sub    $0xc,%esp
     c8d:	ff 73 08             	push   0x8(%ebx)
     c90:	e8 1b ff ff ff       	call   bb0 <runcmd>
    int fd = open(rcmd->file, rcmd->mode);
     c95:	56                   	push   %esi
     c96:	56                   	push   %esi
     c97:	ff 73 10             	push   0x10(%ebx)
     c9a:	ff 73 08             	push   0x8(%ebx)
     c9d:	e8 c1 03 00 00       	call   1063 <open>
     ca2:	89 c6                	mov    %eax,%esi
    close(rcmd->fd);
     ca4:	58                   	pop    %eax
     ca5:	ff 73 14             	push   0x14(%ebx)
     ca8:	e8 9e 03 00 00       	call   104b <close>
    if (rcmd->type == '>' || rcmd->type == '<'){
     cad:	8b 03                	mov    (%ebx),%eax
     caf:	83 c4 10             	add    $0x10,%esp
     cb2:	83 e0 fd             	and    $0xfffffffd,%eax
      if(fd < 0){//0666 for rw permissions
     cb5:	83 f8 3c             	cmp    $0x3c,%eax
     cb8:	75 08                	jne    cc2 <runcmd+0x112>
     cba:	85 f6                	test   %esi,%esi
     cbc:	0f 88 e7 00 00 00    	js     da9 <runcmd+0x1f9>
    dup(fd);
     cc2:	83 ec 0c             	sub    $0xc,%esp
     cc5:	56                   	push   %esi
     cc6:	e8 d0 03 00 00       	call   109b <dup>
    runcmd(rcmd->cmd);
     ccb:	5a                   	pop    %edx
     ccc:	ff 73 04             	push   0x4(%ebx)
     ccf:	e8 dc fe ff ff       	call   bb0 <runcmd>
      runcmd(bcmd->cmd);
     cd4:	83 ec 0c             	sub    $0xc,%esp
     cd7:	ff 73 04             	push   0x4(%ebx)
     cda:	e8 d1 fe ff ff       	call   bb0 <runcmd>
    panic("runcmd");
     cdf:	83 ec 0c             	sub    $0xc,%esp
     ce2:	68 35 15 00 00       	push   $0x1535
     ce7:	e8 f4 f5 ff ff       	call   2e0 <panic>
      panic("pipe failed");
     cec:	83 ec 0c             	sub    $0xc,%esp
     cef:	68 6a 15 00 00       	push   $0x156a
     cf4:	e8 e7 f5 ff ff       	call   2e0 <panic>
    exec(ecmd->argv[0], ecmd->argv);
     cf9:	50                   	push   %eax
     cfa:	50                   	push   %eax
     cfb:	8d 43 04             	lea    0x4(%ebx),%eax
     cfe:	50                   	push   %eax
     cff:	ff 73 04             	push   0x4(%ebx)
     d02:	e8 54 03 00 00       	call   105b <exec>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
     d07:	83 c4 0c             	add    $0xc,%esp
     d0a:	ff 73 04             	push   0x4(%ebx)
     d0d:	68 47 15 00 00       	push   $0x1547
     d12:	6a 02                	push   $0x2
     d14:	e8 67 04 00 00       	call   1180 <printf>
    break;
     d19:	83 c4 10             	add    $0x10,%esp
     d1c:	e9 bf fe ff ff       	jmp    be0 <runcmd+0x30>
      close(0);
     d21:	83 ec 0c             	sub    $0xc,%esp
     d24:	6a 00                	push   $0x0
     d26:	e8 20 03 00 00       	call   104b <close>
      dup(p[0]);
     d2b:	5a                   	pop    %edx
     d2c:	ff 75 f0             	push   -0x10(%ebp)
     d2f:	e8 67 03 00 00       	call   109b <dup>
      close(p[0]);
     d34:	59                   	pop    %ecx
     d35:	ff 75 f0             	push   -0x10(%ebp)
     d38:	e8 0e 03 00 00       	call   104b <close>
      close(p[1]);
     d3d:	5e                   	pop    %esi
     d3e:	ff 75 f4             	push   -0xc(%ebp)
     d41:	e8 05 03 00 00       	call   104b <close>
      runcmd(pcmd->right);
     d46:	58                   	pop    %eax
     d47:	ff 73 08             	push   0x8(%ebx)
     d4a:	e8 61 fe ff ff       	call   bb0 <runcmd>
      close(1);
     d4f:	83 ec 0c             	sub    $0xc,%esp
     d52:	6a 01                	push   $0x1
     d54:	e8 f2 02 00 00       	call   104b <close>
      dup(p[1]);
     d59:	58                   	pop    %eax
     d5a:	ff 75 f4             	push   -0xc(%ebp)
     d5d:	e8 39 03 00 00       	call   109b <dup>
      close(p[0]);
     d62:	58                   	pop    %eax
     d63:	ff 75 f0             	push   -0x10(%ebp)
     d66:	e8 e0 02 00 00       	call   104b <close>
      close(p[1]);
     d6b:	58                   	pop    %eax
     d6c:	ff 75 f4             	push   -0xc(%ebp)
     d6f:	e8 d7 02 00 00       	call   104b <close>
      runcmd(pcmd->left);
     d74:	58                   	pop    %eax
     d75:	ff 73 04             	push   0x4(%ebx)
     d78:	e8 33 fe ff ff       	call   bb0 <runcmd>
      int index = atoi(ecmd->argv[1]) - 1;
     d7d:	83 ec 0c             	sub    $0xc,%esp
     d80:	ff 73 08             	push   0x8(%ebx)
     d83:	e8 28 02 00 00       	call   fb0 <atoi>
      if (index > 9 || index < 0){
     d88:	83 c4 10             	add    $0x10,%esp
      int index = atoi(ecmd->argv[1]) - 1;
     d8b:	83 e8 01             	sub    $0x1,%eax
      if (index > 9 || index < 0){
     d8e:	83 f8 09             	cmp    $0x9,%eax
     d91:	76 2b                	jbe    dbe <runcmd+0x20e>
        printf(2, "Number out of bounds, must be between 1 and 10\n");
     d93:	50                   	push   %eax
     d94:	50                   	push   %eax
     d95:	68 bc 15 00 00       	push   $0x15bc
     d9a:	6a 02                	push   $0x2
     d9c:	e8 df 03 00 00       	call   1180 <printf>
        break;
     da1:	83 c4 10             	add    $0x10,%esp
     da4:	e9 37 fe ff ff       	jmp    be0 <runcmd+0x30>
         printf(2, "Could not open %s\n", rcmd->file);
     da9:	51                   	push   %ecx
     daa:	ff 73 08             	push   0x8(%ebx)
     dad:	68 57 15 00 00       	push   $0x1557
     db2:	6a 02                	push   $0x2
     db4:	e8 c7 03 00 00       	call   1180 <printf>
         exit();
     db9:	e8 65 02 00 00       	call   1023 <exit>
      runcmd(parsecmd(cmdlist[index]));
     dbe:	6b c0 64             	imul   $0x64,%eax,%eax
     dc1:	83 ec 0c             	sub    $0xc,%esp
     dc4:	05 a0 1c 00 00       	add    $0x1ca0,%eax
     dc9:	50                   	push   %eax
     dca:	e8 71 fd ff ff       	call   b40 <parsecmd>
     dcf:	89 04 24             	mov    %eax,(%esp)
     dd2:	e8 d9 fd ff ff       	call   bb0 <runcmd>
     dd7:	66 90                	xchg   %ax,%ax
     dd9:	66 90                	xchg   %ax,%ax
     ddb:	66 90                	xchg   %ax,%ax
     ddd:	66 90                	xchg   %ax,%ax
     ddf:	90                   	nop

00000de0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
     de0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     de1:	31 c0                	xor    %eax,%eax
{
     de3:	89 e5                	mov    %esp,%ebp
     de5:	53                   	push   %ebx
     de6:	8b 4d 08             	mov    0x8(%ebp),%ecx
     de9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     dec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
     df0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
     df4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
     df7:	83 c0 01             	add    $0x1,%eax
     dfa:	84 d2                	test   %dl,%dl
     dfc:	75 f2                	jne    df0 <strcpy+0x10>
    ;
  return os;
}
     dfe:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     e01:	89 c8                	mov    %ecx,%eax
     e03:	c9                   	leave
     e04:	c3                   	ret
     e05:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     e0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000e10 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     e10:	55                   	push   %ebp
     e11:	89 e5                	mov    %esp,%ebp
     e13:	53                   	push   %ebx
     e14:	8b 55 08             	mov    0x8(%ebp),%edx
     e17:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
     e1a:	0f b6 02             	movzbl (%edx),%eax
     e1d:	84 c0                	test   %al,%al
     e1f:	75 17                	jne    e38 <strcmp+0x28>
     e21:	eb 3a                	jmp    e5d <strcmp+0x4d>
     e23:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     e27:	90                   	nop
     e28:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
     e2c:	83 c2 01             	add    $0x1,%edx
     e2f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
     e32:	84 c0                	test   %al,%al
     e34:	74 1a                	je     e50 <strcmp+0x40>
    p++, q++;
     e36:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
     e38:	0f b6 19             	movzbl (%ecx),%ebx
     e3b:	38 c3                	cmp    %al,%bl
     e3d:	74 e9                	je     e28 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
     e3f:	29 d8                	sub    %ebx,%eax
}
     e41:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     e44:	c9                   	leave
     e45:	c3                   	ret
     e46:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     e4d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
     e50:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
     e54:	31 c0                	xor    %eax,%eax
     e56:	29 d8                	sub    %ebx,%eax
}
     e58:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     e5b:	c9                   	leave
     e5c:	c3                   	ret
  return (uchar)*p - (uchar)*q;
     e5d:	0f b6 19             	movzbl (%ecx),%ebx
     e60:	31 c0                	xor    %eax,%eax
     e62:	eb db                	jmp    e3f <strcmp+0x2f>
     e64:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     e6b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     e6f:	90                   	nop

00000e70 <strlen>:

uint
strlen(char *s)
{
     e70:	55                   	push   %ebp
     e71:	89 e5                	mov    %esp,%ebp
     e73:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
     e76:	80 3a 00             	cmpb   $0x0,(%edx)
     e79:	74 15                	je     e90 <strlen+0x20>
     e7b:	31 c0                	xor    %eax,%eax
     e7d:	8d 76 00             	lea    0x0(%esi),%esi
     e80:	83 c0 01             	add    $0x1,%eax
     e83:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
     e87:	89 c1                	mov    %eax,%ecx
     e89:	75 f5                	jne    e80 <strlen+0x10>
    ;
  return n;
}
     e8b:	89 c8                	mov    %ecx,%eax
     e8d:	5d                   	pop    %ebp
     e8e:	c3                   	ret
     e8f:	90                   	nop
  for(n = 0; s[n]; n++)
     e90:	31 c9                	xor    %ecx,%ecx
}
     e92:	5d                   	pop    %ebp
     e93:	89 c8                	mov    %ecx,%eax
     e95:	c3                   	ret
     e96:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     e9d:	8d 76 00             	lea    0x0(%esi),%esi

00000ea0 <memset>:

void*
memset(void *dst, int c, uint n)
{
     ea0:	55                   	push   %ebp
     ea1:	89 e5                	mov    %esp,%ebp
     ea3:	57                   	push   %edi
     ea4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     ea7:	8b 4d 10             	mov    0x10(%ebp),%ecx
     eaa:	8b 45 0c             	mov    0xc(%ebp),%eax
     ead:	89 d7                	mov    %edx,%edi
     eaf:	fc                   	cld
     eb0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     eb2:	8b 7d fc             	mov    -0x4(%ebp),%edi
     eb5:	89 d0                	mov    %edx,%eax
     eb7:	c9                   	leave
     eb8:	c3                   	ret
     eb9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000ec0 <strchr>:

char*
strchr(const char *s, char c)
{
     ec0:	55                   	push   %ebp
     ec1:	89 e5                	mov    %esp,%ebp
     ec3:	8b 45 08             	mov    0x8(%ebp),%eax
     ec6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
     eca:	0f b6 10             	movzbl (%eax),%edx
     ecd:	84 d2                	test   %dl,%dl
     ecf:	75 12                	jne    ee3 <strchr+0x23>
     ed1:	eb 1d                	jmp    ef0 <strchr+0x30>
     ed3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     ed7:	90                   	nop
     ed8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
     edc:	83 c0 01             	add    $0x1,%eax
     edf:	84 d2                	test   %dl,%dl
     ee1:	74 0d                	je     ef0 <strchr+0x30>
    if(*s == c)
     ee3:	38 d1                	cmp    %dl,%cl
     ee5:	75 f1                	jne    ed8 <strchr+0x18>
      return (char*)s;
  return 0;
}
     ee7:	5d                   	pop    %ebp
     ee8:	c3                   	ret
     ee9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
     ef0:	31 c0                	xor    %eax,%eax
}
     ef2:	5d                   	pop    %ebp
     ef3:	c3                   	ret
     ef4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     efb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     eff:	90                   	nop

00000f00 <gets>:

char*
gets(char *buf, int max)
{
     f00:	55                   	push   %ebp
     f01:	89 e5                	mov    %esp,%ebp
     f03:	57                   	push   %edi
     f04:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
     f05:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
     f08:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
     f09:	31 db                	xor    %ebx,%ebx
{
     f0b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
     f0e:	eb 27                	jmp    f37 <gets+0x37>
    cc = read(0, &c, 1);
     f10:	83 ec 04             	sub    $0x4,%esp
     f13:	6a 01                	push   $0x1
     f15:	56                   	push   %esi
     f16:	6a 00                	push   $0x0
     f18:	e8 1e 01 00 00       	call   103b <read>
    if(cc < 1)
     f1d:	83 c4 10             	add    $0x10,%esp
     f20:	85 c0                	test   %eax,%eax
     f22:	7e 1d                	jle    f41 <gets+0x41>
      break;
    buf[i++] = c;
     f24:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     f28:	8b 55 08             	mov    0x8(%ebp),%edx
     f2b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
     f2f:	3c 0a                	cmp    $0xa,%al
     f31:	74 10                	je     f43 <gets+0x43>
     f33:	3c 0d                	cmp    $0xd,%al
     f35:	74 0c                	je     f43 <gets+0x43>
  for(i=0; i+1 < max; ){
     f37:	89 df                	mov    %ebx,%edi
     f39:	83 c3 01             	add    $0x1,%ebx
     f3c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     f3f:	7c cf                	jl     f10 <gets+0x10>
     f41:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
     f43:	8b 45 08             	mov    0x8(%ebp),%eax
     f46:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
     f4a:	8d 65 f4             	lea    -0xc(%ebp),%esp
     f4d:	5b                   	pop    %ebx
     f4e:	5e                   	pop    %esi
     f4f:	5f                   	pop    %edi
     f50:	5d                   	pop    %ebp
     f51:	c3                   	ret
     f52:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     f59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000f60 <stat>:

int
stat(char *n, struct stat *st)
{
     f60:	55                   	push   %ebp
     f61:	89 e5                	mov    %esp,%ebp
     f63:	56                   	push   %esi
     f64:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     f65:	83 ec 08             	sub    $0x8,%esp
     f68:	6a 00                	push   $0x0
     f6a:	ff 75 08             	push   0x8(%ebp)
     f6d:	e8 f1 00 00 00       	call   1063 <open>
  if(fd < 0)
     f72:	83 c4 10             	add    $0x10,%esp
     f75:	85 c0                	test   %eax,%eax
     f77:	78 27                	js     fa0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
     f79:	83 ec 08             	sub    $0x8,%esp
     f7c:	ff 75 0c             	push   0xc(%ebp)
     f7f:	89 c3                	mov    %eax,%ebx
     f81:	50                   	push   %eax
     f82:	e8 f4 00 00 00       	call   107b <fstat>
  close(fd);
     f87:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
     f8a:	89 c6                	mov    %eax,%esi
  close(fd);
     f8c:	e8 ba 00 00 00       	call   104b <close>
  return r;
     f91:	83 c4 10             	add    $0x10,%esp
}
     f94:	8d 65 f8             	lea    -0x8(%ebp),%esp
     f97:	89 f0                	mov    %esi,%eax
     f99:	5b                   	pop    %ebx
     f9a:	5e                   	pop    %esi
     f9b:	5d                   	pop    %ebp
     f9c:	c3                   	ret
     f9d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
     fa0:	be ff ff ff ff       	mov    $0xffffffff,%esi
     fa5:	eb ed                	jmp    f94 <stat+0x34>
     fa7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     fae:	66 90                	xchg   %ax,%ax

00000fb0 <atoi>:

int
atoi(const char *s)
{
     fb0:	55                   	push   %ebp
     fb1:	89 e5                	mov    %esp,%ebp
     fb3:	53                   	push   %ebx
     fb4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     fb7:	0f be 02             	movsbl (%edx),%eax
     fba:	8d 48 d0             	lea    -0x30(%eax),%ecx
     fbd:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
     fc0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
     fc5:	77 1e                	ja     fe5 <atoi+0x35>
     fc7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     fce:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
     fd0:	83 c2 01             	add    $0x1,%edx
     fd3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
     fd6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
     fda:	0f be 02             	movsbl (%edx),%eax
     fdd:	8d 58 d0             	lea    -0x30(%eax),%ebx
     fe0:	80 fb 09             	cmp    $0x9,%bl
     fe3:	76 eb                	jbe    fd0 <atoi+0x20>
  return n;
}
     fe5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     fe8:	89 c8                	mov    %ecx,%eax
     fea:	c9                   	leave
     feb:	c3                   	ret
     fec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000ff0 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     ff0:	55                   	push   %ebp
     ff1:	89 e5                	mov    %esp,%ebp
     ff3:	57                   	push   %edi
     ff4:	56                   	push   %esi
     ff5:	8b 45 10             	mov    0x10(%ebp),%eax
     ff8:	8b 55 08             	mov    0x8(%ebp),%edx
     ffb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     ffe:	85 c0                	test   %eax,%eax
    1000:	7e 13                	jle    1015 <memmove+0x25>
    1002:	01 d0                	add    %edx,%eax
  dst = vdst;
    1004:	89 d7                	mov    %edx,%edi
    1006:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    100d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
    1010:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
    1011:	39 f8                	cmp    %edi,%eax
    1013:	75 fb                	jne    1010 <memmove+0x20>
  return vdst;
}
    1015:	5e                   	pop    %esi
    1016:	89 d0                	mov    %edx,%eax
    1018:	5f                   	pop    %edi
    1019:	5d                   	pop    %ebp
    101a:	c3                   	ret

0000101b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    101b:	b8 01 00 00 00       	mov    $0x1,%eax
    1020:	cd 40                	int    $0x40
    1022:	c3                   	ret

00001023 <exit>:
SYSCALL(exit)
    1023:	b8 02 00 00 00       	mov    $0x2,%eax
    1028:	cd 40                	int    $0x40
    102a:	c3                   	ret

0000102b <wait>:
SYSCALL(wait)
    102b:	b8 03 00 00 00       	mov    $0x3,%eax
    1030:	cd 40                	int    $0x40
    1032:	c3                   	ret

00001033 <pipe>:
SYSCALL(pipe)
    1033:	b8 04 00 00 00       	mov    $0x4,%eax
    1038:	cd 40                	int    $0x40
    103a:	c3                   	ret

0000103b <read>:
SYSCALL(read)
    103b:	b8 05 00 00 00       	mov    $0x5,%eax
    1040:	cd 40                	int    $0x40
    1042:	c3                   	ret

00001043 <write>:
SYSCALL(write)
    1043:	b8 10 00 00 00       	mov    $0x10,%eax
    1048:	cd 40                	int    $0x40
    104a:	c3                   	ret

0000104b <close>:
SYSCALL(close)
    104b:	b8 15 00 00 00       	mov    $0x15,%eax
    1050:	cd 40                	int    $0x40
    1052:	c3                   	ret

00001053 <kill>:
SYSCALL(kill)
    1053:	b8 06 00 00 00       	mov    $0x6,%eax
    1058:	cd 40                	int    $0x40
    105a:	c3                   	ret

0000105b <exec>:
SYSCALL(exec)
    105b:	b8 07 00 00 00       	mov    $0x7,%eax
    1060:	cd 40                	int    $0x40
    1062:	c3                   	ret

00001063 <open>:
SYSCALL(open)
    1063:	b8 0f 00 00 00       	mov    $0xf,%eax
    1068:	cd 40                	int    $0x40
    106a:	c3                   	ret

0000106b <mknod>:
SYSCALL(mknod)
    106b:	b8 11 00 00 00       	mov    $0x11,%eax
    1070:	cd 40                	int    $0x40
    1072:	c3                   	ret

00001073 <unlink>:
SYSCALL(unlink)
    1073:	b8 12 00 00 00       	mov    $0x12,%eax
    1078:	cd 40                	int    $0x40
    107a:	c3                   	ret

0000107b <fstat>:
SYSCALL(fstat)
    107b:	b8 08 00 00 00       	mov    $0x8,%eax
    1080:	cd 40                	int    $0x40
    1082:	c3                   	ret

00001083 <link>:
SYSCALL(link)
    1083:	b8 13 00 00 00       	mov    $0x13,%eax
    1088:	cd 40                	int    $0x40
    108a:	c3                   	ret

0000108b <mkdir>:
SYSCALL(mkdir)
    108b:	b8 14 00 00 00       	mov    $0x14,%eax
    1090:	cd 40                	int    $0x40
    1092:	c3                   	ret

00001093 <chdir>:
SYSCALL(chdir)
    1093:	b8 09 00 00 00       	mov    $0x9,%eax
    1098:	cd 40                	int    $0x40
    109a:	c3                   	ret

0000109b <dup>:
SYSCALL(dup)
    109b:	b8 0a 00 00 00       	mov    $0xa,%eax
    10a0:	cd 40                	int    $0x40
    10a2:	c3                   	ret

000010a3 <getpid>:
SYSCALL(getpid)
    10a3:	b8 0b 00 00 00       	mov    $0xb,%eax
    10a8:	cd 40                	int    $0x40
    10aa:	c3                   	ret

000010ab <sbrk>:
SYSCALL(sbrk)
    10ab:	b8 0c 00 00 00       	mov    $0xc,%eax
    10b0:	cd 40                	int    $0x40
    10b2:	c3                   	ret

000010b3 <sleep>:
SYSCALL(sleep)
    10b3:	b8 0d 00 00 00       	mov    $0xd,%eax
    10b8:	cd 40                	int    $0x40
    10ba:	c3                   	ret

000010bb <uptime>:
SYSCALL(uptime)
    10bb:	b8 0e 00 00 00       	mov    $0xe,%eax
    10c0:	cd 40                	int    $0x40
    10c2:	c3                   	ret

000010c3 <shutdown>:
SYSCALL(shutdown)
    10c3:	b8 16 00 00 00       	mov    $0x16,%eax
    10c8:	cd 40                	int    $0x40
    10ca:	c3                   	ret

000010cb <cps>:
SYSCALL(cps)
    10cb:	b8 17 00 00 00       	mov    $0x17,%eax
    10d0:	cd 40                	int    $0x40
    10d2:	c3                   	ret

000010d3 <chpr>:
SYSCALL(chpr)
    10d3:	b8 18 00 00 00       	mov    $0x18,%eax
    10d8:	cd 40                	int    $0x40
    10da:	c3                   	ret
    10db:	66 90                	xchg   %ax,%ax
    10dd:	66 90                	xchg   %ax,%ax
    10df:	90                   	nop

000010e0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    10e0:	55                   	push   %ebp
    10e1:	89 e5                	mov    %esp,%ebp
    10e3:	57                   	push   %edi
    10e4:	56                   	push   %esi
    10e5:	53                   	push   %ebx
    10e6:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    10e8:	89 d1                	mov    %edx,%ecx
{
    10ea:	83 ec 3c             	sub    $0x3c,%esp
    10ed:	89 45 c0             	mov    %eax,-0x40(%ebp)
  if(sgn && xx < 0){
    10f0:	85 d2                	test   %edx,%edx
    10f2:	0f 89 80 00 00 00    	jns    1178 <printint+0x98>
    10f8:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    10fc:	74 7a                	je     1178 <printint+0x98>
    x = -xx;
    10fe:	f7 d9                	neg    %ecx
    neg = 1;
    1100:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
    1105:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    1108:	31 f6                	xor    %esi,%esi
    110a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    1110:	89 c8                	mov    %ecx,%eax
    1112:	31 d2                	xor    %edx,%edx
    1114:	89 f7                	mov    %esi,%edi
    1116:	f7 f3                	div    %ebx
    1118:	8d 76 01             	lea    0x1(%esi),%esi
    111b:	0f b6 92 4c 16 00 00 	movzbl 0x164c(%edx),%edx
    1122:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
    1126:	89 ca                	mov    %ecx,%edx
    1128:	89 c1                	mov    %eax,%ecx
    112a:	39 da                	cmp    %ebx,%edx
    112c:	73 e2                	jae    1110 <printint+0x30>
  if(neg)
    112e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    1131:	85 c0                	test   %eax,%eax
    1133:	74 07                	je     113c <printint+0x5c>
    buf[i++] = '-';
    1135:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)
    buf[i++] = digits[x % base];
    113a:	89 f7                	mov    %esi,%edi
    113c:	8d 5d d8             	lea    -0x28(%ebp),%ebx
    113f:	8b 75 c0             	mov    -0x40(%ebp),%esi
    1142:	01 df                	add    %ebx,%edi
    1144:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  while(--i >= 0)
    putc(fd, buf[i]);
    1148:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
    114b:	83 ec 04             	sub    $0x4,%esp
    114e:	88 45 d7             	mov    %al,-0x29(%ebp)
    1151:	8d 45 d7             	lea    -0x29(%ebp),%eax
    1154:	6a 01                	push   $0x1
    1156:	50                   	push   %eax
    1157:	56                   	push   %esi
    1158:	e8 e6 fe ff ff       	call   1043 <write>
  while(--i >= 0)
    115d:	89 f8                	mov    %edi,%eax
    115f:	83 c4 10             	add    $0x10,%esp
    1162:	83 ef 01             	sub    $0x1,%edi
    1165:	39 d8                	cmp    %ebx,%eax
    1167:	75 df                	jne    1148 <printint+0x68>
}
    1169:	8d 65 f4             	lea    -0xc(%ebp),%esp
    116c:	5b                   	pop    %ebx
    116d:	5e                   	pop    %esi
    116e:	5f                   	pop    %edi
    116f:	5d                   	pop    %ebp
    1170:	c3                   	ret
    1171:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    1178:	31 c0                	xor    %eax,%eax
    117a:	eb 89                	jmp    1105 <printint+0x25>
    117c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001180 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    1180:	55                   	push   %ebp
    1181:	89 e5                	mov    %esp,%ebp
    1183:	57                   	push   %edi
    1184:	56                   	push   %esi
    1185:	53                   	push   %ebx
    1186:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1189:	8b 75 0c             	mov    0xc(%ebp),%esi
{
    118c:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
    118f:	0f b6 1e             	movzbl (%esi),%ebx
    1192:	83 c6 01             	add    $0x1,%esi
    1195:	84 db                	test   %bl,%bl
    1197:	74 67                	je     1200 <printf+0x80>
    1199:	8d 4d 10             	lea    0x10(%ebp),%ecx
    119c:	31 d2                	xor    %edx,%edx
    119e:	89 4d d0             	mov    %ecx,-0x30(%ebp)
    11a1:	eb 34                	jmp    11d7 <printf+0x57>
    11a3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    11a7:	90                   	nop
    11a8:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    11ab:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    11b0:	83 f8 25             	cmp    $0x25,%eax
    11b3:	74 18                	je     11cd <printf+0x4d>
  write(fd, &c, 1);
    11b5:	83 ec 04             	sub    $0x4,%esp
    11b8:	8d 45 e7             	lea    -0x19(%ebp),%eax
    11bb:	88 5d e7             	mov    %bl,-0x19(%ebp)
    11be:	6a 01                	push   $0x1
    11c0:	50                   	push   %eax
    11c1:	57                   	push   %edi
    11c2:	e8 7c fe ff ff       	call   1043 <write>
    11c7:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
    11ca:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    11cd:	0f b6 1e             	movzbl (%esi),%ebx
    11d0:	83 c6 01             	add    $0x1,%esi
    11d3:	84 db                	test   %bl,%bl
    11d5:	74 29                	je     1200 <printf+0x80>
    c = fmt[i] & 0xff;
    11d7:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    11da:	85 d2                	test   %edx,%edx
    11dc:	74 ca                	je     11a8 <printf+0x28>
      }
    } else if(state == '%'){
    11de:	83 fa 25             	cmp    $0x25,%edx
    11e1:	75 ea                	jne    11cd <printf+0x4d>
      if(c == 'd'){
    11e3:	83 f8 25             	cmp    $0x25,%eax
    11e6:	0f 84 24 01 00 00    	je     1310 <printf+0x190>
    11ec:	83 e8 63             	sub    $0x63,%eax
    11ef:	83 f8 15             	cmp    $0x15,%eax
    11f2:	77 1c                	ja     1210 <printf+0x90>
    11f4:	ff 24 85 f4 15 00 00 	jmp    *0x15f4(,%eax,4)
    11fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    11ff:	90                   	nop
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1200:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1203:	5b                   	pop    %ebx
    1204:	5e                   	pop    %esi
    1205:	5f                   	pop    %edi
    1206:	5d                   	pop    %ebp
    1207:	c3                   	ret
    1208:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    120f:	90                   	nop
  write(fd, &c, 1);
    1210:	83 ec 04             	sub    $0x4,%esp
    1213:	8d 55 e7             	lea    -0x19(%ebp),%edx
    1216:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    121a:	6a 01                	push   $0x1
    121c:	52                   	push   %edx
    121d:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    1220:	57                   	push   %edi
    1221:	e8 1d fe ff ff       	call   1043 <write>
    1226:	83 c4 0c             	add    $0xc,%esp
    1229:	88 5d e7             	mov    %bl,-0x19(%ebp)
    122c:	6a 01                	push   $0x1
    122e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    1231:	52                   	push   %edx
    1232:	57                   	push   %edi
    1233:	e8 0b fe ff ff       	call   1043 <write>
        putc(fd, c);
    1238:	83 c4 10             	add    $0x10,%esp
      state = 0;
    123b:	31 d2                	xor    %edx,%edx
    123d:	eb 8e                	jmp    11cd <printf+0x4d>
    123f:	90                   	nop
        printint(fd, *ap, 16, 0);
    1240:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    1243:	83 ec 0c             	sub    $0xc,%esp
    1246:	b9 10 00 00 00       	mov    $0x10,%ecx
    124b:	8b 13                	mov    (%ebx),%edx
    124d:	6a 00                	push   $0x0
    124f:	89 f8                	mov    %edi,%eax
        ap++;
    1251:	83 c3 04             	add    $0x4,%ebx
        printint(fd, *ap, 16, 0);
    1254:	e8 87 fe ff ff       	call   10e0 <printint>
        ap++;
    1259:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    125c:	83 c4 10             	add    $0x10,%esp
      state = 0;
    125f:	31 d2                	xor    %edx,%edx
    1261:	e9 67 ff ff ff       	jmp    11cd <printf+0x4d>
    1266:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    126d:	8d 76 00             	lea    0x0(%esi),%esi
        s = (char*)*ap;
    1270:	8b 45 d0             	mov    -0x30(%ebp),%eax
    1273:	8b 18                	mov    (%eax),%ebx
        ap++;
    1275:	83 c0 04             	add    $0x4,%eax
    1278:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    127b:	85 db                	test   %ebx,%ebx
    127d:	0f 84 9d 00 00 00    	je     1320 <printf+0x1a0>
        while(*s != 0){
    1283:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
    1286:	31 d2                	xor    %edx,%edx
        while(*s != 0){
    1288:	84 c0                	test   %al,%al
    128a:	0f 84 3d ff ff ff    	je     11cd <printf+0x4d>
    1290:	8d 55 e7             	lea    -0x19(%ebp),%edx
    1293:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    1296:	89 de                	mov    %ebx,%esi
    1298:	89 d3                	mov    %edx,%ebx
    129a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  write(fd, &c, 1);
    12a0:	83 ec 04             	sub    $0x4,%esp
    12a3:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
    12a6:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    12a9:	6a 01                	push   $0x1
    12ab:	53                   	push   %ebx
    12ac:	57                   	push   %edi
    12ad:	e8 91 fd ff ff       	call   1043 <write>
        while(*s != 0){
    12b2:	0f b6 06             	movzbl (%esi),%eax
    12b5:	83 c4 10             	add    $0x10,%esp
    12b8:	84 c0                	test   %al,%al
    12ba:	75 e4                	jne    12a0 <printf+0x120>
      state = 0;
    12bc:	8b 75 d4             	mov    -0x2c(%ebp),%esi
    12bf:	31 d2                	xor    %edx,%edx
    12c1:	e9 07 ff ff ff       	jmp    11cd <printf+0x4d>
    12c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    12cd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    12d0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    12d3:	83 ec 0c             	sub    $0xc,%esp
    12d6:	b9 0a 00 00 00       	mov    $0xa,%ecx
    12db:	8b 13                	mov    (%ebx),%edx
    12dd:	6a 01                	push   $0x1
    12df:	e9 6b ff ff ff       	jmp    124f <printf+0xcf>
    12e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    12e8:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
    12eb:	83 ec 04             	sub    $0x4,%esp
    12ee:	8d 55 e7             	lea    -0x19(%ebp),%edx
        putc(fd, *ap);
    12f1:	8b 03                	mov    (%ebx),%eax
        ap++;
    12f3:	83 c3 04             	add    $0x4,%ebx
        putc(fd, *ap);
    12f6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    12f9:	6a 01                	push   $0x1
    12fb:	52                   	push   %edx
    12fc:	57                   	push   %edi
    12fd:	e8 41 fd ff ff       	call   1043 <write>
        ap++;
    1302:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    1305:	83 c4 10             	add    $0x10,%esp
      state = 0;
    1308:	31 d2                	xor    %edx,%edx
    130a:	e9 be fe ff ff       	jmp    11cd <printf+0x4d>
    130f:	90                   	nop
  write(fd, &c, 1);
    1310:	83 ec 04             	sub    $0x4,%esp
    1313:	88 5d e7             	mov    %bl,-0x19(%ebp)
    1316:	8d 55 e7             	lea    -0x19(%ebp),%edx
    1319:	6a 01                	push   $0x1
    131b:	e9 11 ff ff ff       	jmp    1231 <printf+0xb1>
    1320:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
    1325:	bb ec 15 00 00       	mov    $0x15ec,%ebx
    132a:	e9 61 ff ff ff       	jmp    1290 <printf+0x110>
    132f:	90                   	nop

00001330 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1330:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1331:	a1 64 21 00 00       	mov    0x2164,%eax
{
    1336:	89 e5                	mov    %esp,%ebp
    1338:	57                   	push   %edi
    1339:	56                   	push   %esi
    133a:	53                   	push   %ebx
    133b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    133e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1341:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1348:	89 c2                	mov    %eax,%edx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    134a:	8b 00                	mov    (%eax),%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    134c:	39 ca                	cmp    %ecx,%edx
    134e:	73 30                	jae    1380 <free+0x50>
    1350:	39 c1                	cmp    %eax,%ecx
    1352:	72 04                	jb     1358 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1354:	39 c2                	cmp    %eax,%edx
    1356:	72 f0                	jb     1348 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1358:	8b 73 fc             	mov    -0x4(%ebx),%esi
    135b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    135e:	39 f8                	cmp    %edi,%eax
    1360:	74 2e                	je     1390 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
    1362:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    1365:	8b 42 04             	mov    0x4(%edx),%eax
    1368:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    136b:	39 f1                	cmp    %esi,%ecx
    136d:	74 38                	je     13a7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
    136f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
    1371:	5b                   	pop    %ebx
  freep = p;
    1372:	89 15 64 21 00 00    	mov    %edx,0x2164
}
    1378:	5e                   	pop    %esi
    1379:	5f                   	pop    %edi
    137a:	5d                   	pop    %ebp
    137b:	c3                   	ret
    137c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1380:	39 c1                	cmp    %eax,%ecx
    1382:	72 d0                	jb     1354 <free+0x24>
    1384:	eb c2                	jmp    1348 <free+0x18>
    1386:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    138d:	8d 76 00             	lea    0x0(%esi),%esi
    bp->s.size += p->s.ptr->s.size;
    1390:	03 70 04             	add    0x4(%eax),%esi
    1393:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1396:	8b 02                	mov    (%edx),%eax
    1398:	8b 00                	mov    (%eax),%eax
    139a:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
    139d:	8b 42 04             	mov    0x4(%edx),%eax
    13a0:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    13a3:	39 f1                	cmp    %esi,%ecx
    13a5:	75 c8                	jne    136f <free+0x3f>
    p->s.size += bp->s.size;
    13a7:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
    13aa:	89 15 64 21 00 00    	mov    %edx,0x2164
    p->s.size += bp->s.size;
    13b0:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
    13b3:	8b 4b f8             	mov    -0x8(%ebx),%ecx
    13b6:	89 0a                	mov    %ecx,(%edx)
}
    13b8:	5b                   	pop    %ebx
    13b9:	5e                   	pop    %esi
    13ba:	5f                   	pop    %edi
    13bb:	5d                   	pop    %ebp
    13bc:	c3                   	ret
    13bd:	8d 76 00             	lea    0x0(%esi),%esi

000013c0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    13c0:	55                   	push   %ebp
    13c1:	89 e5                	mov    %esp,%ebp
    13c3:	57                   	push   %edi
    13c4:	56                   	push   %esi
    13c5:	53                   	push   %ebx
    13c6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    13c9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    13cc:	8b 15 64 21 00 00    	mov    0x2164,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    13d2:	8d 78 07             	lea    0x7(%eax),%edi
    13d5:	c1 ef 03             	shr    $0x3,%edi
    13d8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    13db:	85 d2                	test   %edx,%edx
    13dd:	0f 84 8d 00 00 00    	je     1470 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    13e3:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    13e5:	8b 48 04             	mov    0x4(%eax),%ecx
    13e8:	39 f9                	cmp    %edi,%ecx
    13ea:	73 64                	jae    1450 <malloc+0x90>
  if(nu < 4096)
    13ec:	bb 00 10 00 00       	mov    $0x1000,%ebx
    13f1:	39 df                	cmp    %ebx,%edi
    13f3:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    13f6:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    13fd:	eb 0a                	jmp    1409 <malloc+0x49>
    13ff:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1400:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    1402:	8b 48 04             	mov    0x4(%eax),%ecx
    1405:	39 f9                	cmp    %edi,%ecx
    1407:	73 47                	jae    1450 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1409:	89 c2                	mov    %eax,%edx
    140b:	39 05 64 21 00 00    	cmp    %eax,0x2164
    1411:	75 ed                	jne    1400 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
    1413:	83 ec 0c             	sub    $0xc,%esp
    1416:	56                   	push   %esi
    1417:	e8 8f fc ff ff       	call   10ab <sbrk>
  if(p == (char*)-1)
    141c:	83 c4 10             	add    $0x10,%esp
    141f:	83 f8 ff             	cmp    $0xffffffff,%eax
    1422:	74 1c                	je     1440 <malloc+0x80>
  hp->s.size = nu;
    1424:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    1427:	83 ec 0c             	sub    $0xc,%esp
    142a:	83 c0 08             	add    $0x8,%eax
    142d:	50                   	push   %eax
    142e:	e8 fd fe ff ff       	call   1330 <free>
  return freep;
    1433:	8b 15 64 21 00 00    	mov    0x2164,%edx
      if((p = morecore(nunits)) == 0)
    1439:	83 c4 10             	add    $0x10,%esp
    143c:	85 d2                	test   %edx,%edx
    143e:	75 c0                	jne    1400 <malloc+0x40>
        return 0;
  }
}
    1440:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    1443:	31 c0                	xor    %eax,%eax
}
    1445:	5b                   	pop    %ebx
    1446:	5e                   	pop    %esi
    1447:	5f                   	pop    %edi
    1448:	5d                   	pop    %ebp
    1449:	c3                   	ret
    144a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    1450:	39 cf                	cmp    %ecx,%edi
    1452:	74 4c                	je     14a0 <malloc+0xe0>
        p->s.size -= nunits;
    1454:	29 f9                	sub    %edi,%ecx
    1456:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1459:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    145c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
    145f:	89 15 64 21 00 00    	mov    %edx,0x2164
}
    1465:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    1468:	83 c0 08             	add    $0x8,%eax
}
    146b:	5b                   	pop    %ebx
    146c:	5e                   	pop    %esi
    146d:	5f                   	pop    %edi
    146e:	5d                   	pop    %ebp
    146f:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
    1470:	c7 05 64 21 00 00 68 	movl   $0x2168,0x2164
    1477:	21 00 00 
    base.s.size = 0;
    147a:	b8 68 21 00 00       	mov    $0x2168,%eax
    base.s.ptr = freep = prevp = &base;
    147f:	c7 05 68 21 00 00 68 	movl   $0x2168,0x2168
    1486:	21 00 00 
    base.s.size = 0;
    1489:	c7 05 6c 21 00 00 00 	movl   $0x0,0x216c
    1490:	00 00 00 
    if(p->s.size >= nunits){
    1493:	e9 54 ff ff ff       	jmp    13ec <malloc+0x2c>
    1498:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    149f:	90                   	nop
        prevp->s.ptr = p->s.ptr;
    14a0:	8b 08                	mov    (%eax),%ecx
    14a2:	89 0a                	mov    %ecx,(%edx)
    14a4:	eb b9                	jmp    145f <malloc+0x9f>
