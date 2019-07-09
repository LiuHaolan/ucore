
bin/kernel:     file format elf32-i386


Disassembly of section .text:

00100000 <kern_init>:
int kern_init(void) __attribute__((noreturn));
void grade_backtrace(void);
static void lab1_switch_test(void);

int
kern_init(void) {
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 28             	sub    $0x28,%esp
    extern char edata[], end[];
    memset(edata, 0, end - edata);
  100006:	ba 20 fd 10 00       	mov    $0x10fd20,%edx
  10000b:	b8 16 ea 10 00       	mov    $0x10ea16,%eax
  100010:	29 c2                	sub    %eax,%edx
  100012:	89 d0                	mov    %edx,%eax
  100014:	89 44 24 08          	mov    %eax,0x8(%esp)
  100018:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  10001f:	00 
  100020:	c7 04 24 16 ea 10 00 	movl   $0x10ea16,(%esp)
  100027:	e8 d0 30 00 00       	call   1030fc <memset>

    cons_init();                // init the console
  10002c:	e8 f6 14 00 00       	call   101527 <cons_init>

    const char *message = "(THU.CST) os is loading ...";
  100031:	c7 45 f4 a0 32 10 00 	movl   $0x1032a0,-0xc(%ebp)
    cprintf("%s\n\n", message);
  100038:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10003b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10003f:	c7 04 24 bc 32 10 00 	movl   $0x1032bc,(%esp)
  100046:	e8 ae 02 00 00       	call   1002f9 <cprintf>

    print_kerninfo();
  10004b:	e8 dd 07 00 00       	call   10082d <print_kerninfo>

    grade_backtrace();
  100050:	e8 6d 00 00 00       	call   1000c2 <grade_backtrace>
    //LAB1: CAHLLENGE 1 If you try to do it, uncomment lab1_switch_test()
    // user/kernel mode switch test
    //lab1_switch_test();

    /* do nothing */
    while (1);
  100055:	eb fe                	jmp    100055 <kern_init+0x55>

00100057 <grade_backtrace2>:
}

void __attribute__((noinline))
grade_backtrace2(int arg0, int arg1, int arg2, int arg3) {
  100057:	55                   	push   %ebp
  100058:	89 e5                	mov    %esp,%ebp
  10005a:	83 ec 18             	sub    $0x18,%esp
    mon_backtrace(0, NULL, NULL);
  10005d:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  100064:	00 
  100065:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  10006c:	00 
  10006d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100074:	e8 d3 0b 00 00       	call   100c4c <mon_backtrace>
}
  100079:	c9                   	leave  
  10007a:	c3                   	ret    

0010007b <grade_backtrace1>:

void __attribute__((noinline))
grade_backtrace1(int arg0, int arg1) {
  10007b:	55                   	push   %ebp
  10007c:	89 e5                	mov    %esp,%ebp
  10007e:	53                   	push   %ebx
  10007f:	83 ec 14             	sub    $0x14,%esp
    grade_backtrace2(arg0, (int)&arg0, arg1, (int)&arg1);
  100082:	8d 5d 0c             	lea    0xc(%ebp),%ebx
  100085:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  100088:	8d 55 08             	lea    0x8(%ebp),%edx
  10008b:	8b 45 08             	mov    0x8(%ebp),%eax
  10008e:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  100092:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  100096:	89 54 24 04          	mov    %edx,0x4(%esp)
  10009a:	89 04 24             	mov    %eax,(%esp)
  10009d:	e8 b5 ff ff ff       	call   100057 <grade_backtrace2>
}
  1000a2:	83 c4 14             	add    $0x14,%esp
  1000a5:	5b                   	pop    %ebx
  1000a6:	5d                   	pop    %ebp
  1000a7:	c3                   	ret    

001000a8 <grade_backtrace0>:

void __attribute__((noinline))
grade_backtrace0(int arg0, int arg1, int arg2) {
  1000a8:	55                   	push   %ebp
  1000a9:	89 e5                	mov    %esp,%ebp
  1000ab:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace1(arg0, arg2);
  1000ae:	8b 45 10             	mov    0x10(%ebp),%eax
  1000b1:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000b5:	8b 45 08             	mov    0x8(%ebp),%eax
  1000b8:	89 04 24             	mov    %eax,(%esp)
  1000bb:	e8 bb ff ff ff       	call   10007b <grade_backtrace1>
}
  1000c0:	c9                   	leave  
  1000c1:	c3                   	ret    

001000c2 <grade_backtrace>:

void
grade_backtrace(void) {
  1000c2:	55                   	push   %ebp
  1000c3:	89 e5                	mov    %esp,%ebp
  1000c5:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace0(0, (int)kern_init, 0xffff0000);
  1000c8:	b8 00 00 10 00       	mov    $0x100000,%eax
  1000cd:	c7 44 24 08 00 00 ff 	movl   $0xffff0000,0x8(%esp)
  1000d4:	ff 
  1000d5:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000d9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  1000e0:	e8 c3 ff ff ff       	call   1000a8 <grade_backtrace0>
}
  1000e5:	c9                   	leave  
  1000e6:	c3                   	ret    

001000e7 <lab1_print_cur_status>:

static void
lab1_print_cur_status(void) {
  1000e7:	55                   	push   %ebp
  1000e8:	89 e5                	mov    %esp,%ebp
  1000ea:	83 ec 28             	sub    $0x28,%esp
    static int round = 0;
    uint16_t reg1, reg2, reg3, reg4;
    asm volatile (
  1000ed:	8c 4d f6             	mov    %cs,-0xa(%ebp)
  1000f0:	8c 5d f4             	mov    %ds,-0xc(%ebp)
  1000f3:	8c 45 f2             	mov    %es,-0xe(%ebp)
  1000f6:	8c 55 f0             	mov    %ss,-0x10(%ebp)
            "mov %%cs, %0;"
            "mov %%ds, %1;"
            "mov %%es, %2;"
            "mov %%ss, %3;"
            : "=m"(reg1), "=m"(reg2), "=m"(reg3), "=m"(reg4));
    cprintf("%d: @ring %d\n", round, reg1 & 3);
  1000f9:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  1000fd:	0f b7 c0             	movzwl %ax,%eax
  100100:	83 e0 03             	and    $0x3,%eax
  100103:	89 c2                	mov    %eax,%edx
  100105:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  10010a:	89 54 24 08          	mov    %edx,0x8(%esp)
  10010e:	89 44 24 04          	mov    %eax,0x4(%esp)
  100112:	c7 04 24 c1 32 10 00 	movl   $0x1032c1,(%esp)
  100119:	e8 db 01 00 00       	call   1002f9 <cprintf>
    cprintf("%d:  cs = %x\n", round, reg1);
  10011e:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100122:	0f b7 d0             	movzwl %ax,%edx
  100125:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  10012a:	89 54 24 08          	mov    %edx,0x8(%esp)
  10012e:	89 44 24 04          	mov    %eax,0x4(%esp)
  100132:	c7 04 24 cf 32 10 00 	movl   $0x1032cf,(%esp)
  100139:	e8 bb 01 00 00       	call   1002f9 <cprintf>
    cprintf("%d:  ds = %x\n", round, reg2);
  10013e:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  100142:	0f b7 d0             	movzwl %ax,%edx
  100145:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  10014a:	89 54 24 08          	mov    %edx,0x8(%esp)
  10014e:	89 44 24 04          	mov    %eax,0x4(%esp)
  100152:	c7 04 24 dd 32 10 00 	movl   $0x1032dd,(%esp)
  100159:	e8 9b 01 00 00       	call   1002f9 <cprintf>
    cprintf("%d:  es = %x\n", round, reg3);
  10015e:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100162:	0f b7 d0             	movzwl %ax,%edx
  100165:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  10016a:	89 54 24 08          	mov    %edx,0x8(%esp)
  10016e:	89 44 24 04          	mov    %eax,0x4(%esp)
  100172:	c7 04 24 eb 32 10 00 	movl   $0x1032eb,(%esp)
  100179:	e8 7b 01 00 00       	call   1002f9 <cprintf>
    cprintf("%d:  ss = %x\n", round, reg4);
  10017e:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  100182:	0f b7 d0             	movzwl %ax,%edx
  100185:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  10018a:	89 54 24 08          	mov    %edx,0x8(%esp)
  10018e:	89 44 24 04          	mov    %eax,0x4(%esp)
  100192:	c7 04 24 f9 32 10 00 	movl   $0x1032f9,(%esp)
  100199:	e8 5b 01 00 00       	call   1002f9 <cprintf>
    round ++;
  10019e:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  1001a3:	83 c0 01             	add    $0x1,%eax
  1001a6:	a3 20 ea 10 00       	mov    %eax,0x10ea20
}
  1001ab:	c9                   	leave  
  1001ac:	c3                   	ret    

001001ad <lab1_switch_to_user>:

static void
lab1_switch_to_user(void) {
  1001ad:	55                   	push   %ebp
  1001ae:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 : TODO
}
  1001b0:	5d                   	pop    %ebp
  1001b1:	c3                   	ret    

001001b2 <lab1_switch_to_kernel>:

static void
lab1_switch_to_kernel(void) {
  1001b2:	55                   	push   %ebp
  1001b3:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 :  TODO
}
  1001b5:	5d                   	pop    %ebp
  1001b6:	c3                   	ret    

001001b7 <lab1_switch_test>:

static void
lab1_switch_test(void) {
  1001b7:	55                   	push   %ebp
  1001b8:	89 e5                	mov    %esp,%ebp
  1001ba:	83 ec 18             	sub    $0x18,%esp
    lab1_print_cur_status();
  1001bd:	e8 25 ff ff ff       	call   1000e7 <lab1_print_cur_status>
    cprintf("+++ switch to  user  mode +++\n");
  1001c2:	c7 04 24 08 33 10 00 	movl   $0x103308,(%esp)
  1001c9:	e8 2b 01 00 00       	call   1002f9 <cprintf>
    lab1_switch_to_user();
  1001ce:	e8 da ff ff ff       	call   1001ad <lab1_switch_to_user>
    lab1_print_cur_status();
  1001d3:	e8 0f ff ff ff       	call   1000e7 <lab1_print_cur_status>
    cprintf("+++ switch to kernel mode +++\n");
  1001d8:	c7 04 24 28 33 10 00 	movl   $0x103328,(%esp)
  1001df:	e8 15 01 00 00       	call   1002f9 <cprintf>
    lab1_switch_to_kernel();
  1001e4:	e8 c9 ff ff ff       	call   1001b2 <lab1_switch_to_kernel>
    lab1_print_cur_status();
  1001e9:	e8 f9 fe ff ff       	call   1000e7 <lab1_print_cur_status>
}
  1001ee:	c9                   	leave  
  1001ef:	c3                   	ret    

001001f0 <readline>:
 * The readline() function returns the text of the line read. If some errors
 * are happened, NULL is returned. The return value is a global variable,
 * thus it should be copied before it is used.
 * */
char *
readline(const char *prompt) {
  1001f0:	55                   	push   %ebp
  1001f1:	89 e5                	mov    %esp,%ebp
  1001f3:	83 ec 28             	sub    $0x28,%esp
    if (prompt != NULL) {
  1001f6:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  1001fa:	74 13                	je     10020f <readline+0x1f>
        cprintf("%s", prompt);
  1001fc:	8b 45 08             	mov    0x8(%ebp),%eax
  1001ff:	89 44 24 04          	mov    %eax,0x4(%esp)
  100203:	c7 04 24 47 33 10 00 	movl   $0x103347,(%esp)
  10020a:	e8 ea 00 00 00       	call   1002f9 <cprintf>
    }
    int i = 0, c;
  10020f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        c = getchar();
  100216:	e8 66 01 00 00       	call   100381 <getchar>
  10021b:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if (c < 0) {
  10021e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100222:	79 07                	jns    10022b <readline+0x3b>
            return NULL;
  100224:	b8 00 00 00 00       	mov    $0x0,%eax
  100229:	eb 79                	jmp    1002a4 <readline+0xb4>
        }
        else if (c >= ' ' && i < BUFSIZE - 1) {
  10022b:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
  10022f:	7e 28                	jle    100259 <readline+0x69>
  100231:	81 7d f4 fe 03 00 00 	cmpl   $0x3fe,-0xc(%ebp)
  100238:	7f 1f                	jg     100259 <readline+0x69>
            cputchar(c);
  10023a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10023d:	89 04 24             	mov    %eax,(%esp)
  100240:	e8 da 00 00 00       	call   10031f <cputchar>
            buf[i ++] = c;
  100245:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100248:	8d 50 01             	lea    0x1(%eax),%edx
  10024b:	89 55 f4             	mov    %edx,-0xc(%ebp)
  10024e:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100251:	88 90 40 ea 10 00    	mov    %dl,0x10ea40(%eax)
  100257:	eb 46                	jmp    10029f <readline+0xaf>
        }
        else if (c == '\b' && i > 0) {
  100259:	83 7d f0 08          	cmpl   $0x8,-0x10(%ebp)
  10025d:	75 17                	jne    100276 <readline+0x86>
  10025f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100263:	7e 11                	jle    100276 <readline+0x86>
            cputchar(c);
  100265:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100268:	89 04 24             	mov    %eax,(%esp)
  10026b:	e8 af 00 00 00       	call   10031f <cputchar>
            i --;
  100270:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  100274:	eb 29                	jmp    10029f <readline+0xaf>
        }
        else if (c == '\n' || c == '\r') {
  100276:	83 7d f0 0a          	cmpl   $0xa,-0x10(%ebp)
  10027a:	74 06                	je     100282 <readline+0x92>
  10027c:	83 7d f0 0d          	cmpl   $0xd,-0x10(%ebp)
  100280:	75 1d                	jne    10029f <readline+0xaf>
            cputchar(c);
  100282:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100285:	89 04 24             	mov    %eax,(%esp)
  100288:	e8 92 00 00 00       	call   10031f <cputchar>
            buf[i] = '\0';
  10028d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100290:	05 40 ea 10 00       	add    $0x10ea40,%eax
  100295:	c6 00 00             	movb   $0x0,(%eax)
            return buf;
  100298:	b8 40 ea 10 00       	mov    $0x10ea40,%eax
  10029d:	eb 05                	jmp    1002a4 <readline+0xb4>
        }
    }
  10029f:	e9 72 ff ff ff       	jmp    100216 <readline+0x26>
}
  1002a4:	c9                   	leave  
  1002a5:	c3                   	ret    

001002a6 <cputch>:
/* *
 * cputch - writes a single character @c to stdout, and it will
 * increace the value of counter pointed by @cnt.
 * */
static void
cputch(int c, int *cnt) {
  1002a6:	55                   	push   %ebp
  1002a7:	89 e5                	mov    %esp,%ebp
  1002a9:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  1002ac:	8b 45 08             	mov    0x8(%ebp),%eax
  1002af:	89 04 24             	mov    %eax,(%esp)
  1002b2:	e8 9c 12 00 00       	call   101553 <cons_putc>
    (*cnt) ++;
  1002b7:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002ba:	8b 00                	mov    (%eax),%eax
  1002bc:	8d 50 01             	lea    0x1(%eax),%edx
  1002bf:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002c2:	89 10                	mov    %edx,(%eax)
}
  1002c4:	c9                   	leave  
  1002c5:	c3                   	ret    

001002c6 <vcprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want cprintf() instead.
 * */
int
vcprintf(const char *fmt, va_list ap) {
  1002c6:	55                   	push   %ebp
  1002c7:	89 e5                	mov    %esp,%ebp
  1002c9:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  1002cc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    vprintfmt((void*)cputch, &cnt, fmt, ap);
  1002d3:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002d6:	89 44 24 0c          	mov    %eax,0xc(%esp)
  1002da:	8b 45 08             	mov    0x8(%ebp),%eax
  1002dd:	89 44 24 08          	mov    %eax,0x8(%esp)
  1002e1:	8d 45 f4             	lea    -0xc(%ebp),%eax
  1002e4:	89 44 24 04          	mov    %eax,0x4(%esp)
  1002e8:	c7 04 24 a6 02 10 00 	movl   $0x1002a6,(%esp)
  1002ef:	e8 21 26 00 00       	call   102915 <vprintfmt>
    return cnt;
  1002f4:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1002f7:	c9                   	leave  
  1002f8:	c3                   	ret    

001002f9 <cprintf>:
 *
 * The return value is the number of characters which would be
 * written to stdout.
 * */
int
cprintf(const char *fmt, ...) {
  1002f9:	55                   	push   %ebp
  1002fa:	89 e5                	mov    %esp,%ebp
  1002fc:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  1002ff:	8d 45 0c             	lea    0xc(%ebp),%eax
  100302:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vcprintf(fmt, ap);
  100305:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100308:	89 44 24 04          	mov    %eax,0x4(%esp)
  10030c:	8b 45 08             	mov    0x8(%ebp),%eax
  10030f:	89 04 24             	mov    %eax,(%esp)
  100312:	e8 af ff ff ff       	call   1002c6 <vcprintf>
  100317:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  10031a:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10031d:	c9                   	leave  
  10031e:	c3                   	ret    

0010031f <cputchar>:

/* cputchar - writes a single character to stdout */
void
cputchar(int c) {
  10031f:	55                   	push   %ebp
  100320:	89 e5                	mov    %esp,%ebp
  100322:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  100325:	8b 45 08             	mov    0x8(%ebp),%eax
  100328:	89 04 24             	mov    %eax,(%esp)
  10032b:	e8 23 12 00 00       	call   101553 <cons_putc>
}
  100330:	c9                   	leave  
  100331:	c3                   	ret    

00100332 <cputs>:
/* *
 * cputs- writes the string pointed by @str to stdout and
 * appends a newline character.
 * */
int
cputs(const char *str) {
  100332:	55                   	push   %ebp
  100333:	89 e5                	mov    %esp,%ebp
  100335:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  100338:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    char c;
    while ((c = *str ++) != '\0') {
  10033f:	eb 13                	jmp    100354 <cputs+0x22>
        cputch(c, &cnt);
  100341:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  100345:	8d 55 f0             	lea    -0x10(%ebp),%edx
  100348:	89 54 24 04          	mov    %edx,0x4(%esp)
  10034c:	89 04 24             	mov    %eax,(%esp)
  10034f:	e8 52 ff ff ff       	call   1002a6 <cputch>
 * */
int
cputs(const char *str) {
    int cnt = 0;
    char c;
    while ((c = *str ++) != '\0') {
  100354:	8b 45 08             	mov    0x8(%ebp),%eax
  100357:	8d 50 01             	lea    0x1(%eax),%edx
  10035a:	89 55 08             	mov    %edx,0x8(%ebp)
  10035d:	0f b6 00             	movzbl (%eax),%eax
  100360:	88 45 f7             	mov    %al,-0x9(%ebp)
  100363:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
  100367:	75 d8                	jne    100341 <cputs+0xf>
        cputch(c, &cnt);
    }
    cputch('\n', &cnt);
  100369:	8d 45 f0             	lea    -0x10(%ebp),%eax
  10036c:	89 44 24 04          	mov    %eax,0x4(%esp)
  100370:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
  100377:	e8 2a ff ff ff       	call   1002a6 <cputch>
    return cnt;
  10037c:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  10037f:	c9                   	leave  
  100380:	c3                   	ret    

00100381 <getchar>:

/* getchar - reads a single non-zero character from stdin */
int
getchar(void) {
  100381:	55                   	push   %ebp
  100382:	89 e5                	mov    %esp,%ebp
  100384:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = cons_getc()) == 0)
  100387:	e8 f0 11 00 00       	call   10157c <cons_getc>
  10038c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10038f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100393:	74 f2                	je     100387 <getchar+0x6>
        /* do nothing */;
    return c;
  100395:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100398:	c9                   	leave  
  100399:	c3                   	ret    

0010039a <stab_binsearch>:
 *      stab_binsearch(stabs, &left, &right, N_SO, 0xf0100184);
 * will exit setting left = 118, right = 554.
 * */
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
  10039a:	55                   	push   %ebp
  10039b:	89 e5                	mov    %esp,%ebp
  10039d:	83 ec 20             	sub    $0x20,%esp
    int l = *region_left, r = *region_right, any_matches = 0;
  1003a0:	8b 45 0c             	mov    0xc(%ebp),%eax
  1003a3:	8b 00                	mov    (%eax),%eax
  1003a5:	89 45 fc             	mov    %eax,-0x4(%ebp)
  1003a8:	8b 45 10             	mov    0x10(%ebp),%eax
  1003ab:	8b 00                	mov    (%eax),%eax
  1003ad:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1003b0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

    while (l <= r) {
  1003b7:	e9 d2 00 00 00       	jmp    10048e <stab_binsearch+0xf4>
        int true_m = (l + r) / 2, m = true_m;
  1003bc:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1003bf:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1003c2:	01 d0                	add    %edx,%eax
  1003c4:	89 c2                	mov    %eax,%edx
  1003c6:	c1 ea 1f             	shr    $0x1f,%edx
  1003c9:	01 d0                	add    %edx,%eax
  1003cb:	d1 f8                	sar    %eax
  1003cd:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1003d0:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1003d3:	89 45 f0             	mov    %eax,-0x10(%ebp)

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  1003d6:	eb 04                	jmp    1003dc <stab_binsearch+0x42>
            m --;
  1003d8:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)

    while (l <= r) {
        int true_m = (l + r) / 2, m = true_m;

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  1003dc:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1003df:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1003e2:	7c 1f                	jl     100403 <stab_binsearch+0x69>
  1003e4:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1003e7:	89 d0                	mov    %edx,%eax
  1003e9:	01 c0                	add    %eax,%eax
  1003eb:	01 d0                	add    %edx,%eax
  1003ed:	c1 e0 02             	shl    $0x2,%eax
  1003f0:	89 c2                	mov    %eax,%edx
  1003f2:	8b 45 08             	mov    0x8(%ebp),%eax
  1003f5:	01 d0                	add    %edx,%eax
  1003f7:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1003fb:	0f b6 c0             	movzbl %al,%eax
  1003fe:	3b 45 14             	cmp    0x14(%ebp),%eax
  100401:	75 d5                	jne    1003d8 <stab_binsearch+0x3e>
            m --;
        }
        if (m < l) {    // no match in [l, m]
  100403:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100406:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  100409:	7d 0b                	jge    100416 <stab_binsearch+0x7c>
            l = true_m + 1;
  10040b:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10040e:	83 c0 01             	add    $0x1,%eax
  100411:	89 45 fc             	mov    %eax,-0x4(%ebp)
            continue;
  100414:	eb 78                	jmp    10048e <stab_binsearch+0xf4>
        }

        // actual binary search
        any_matches = 1;
  100416:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
        if (stabs[m].n_value < addr) {
  10041d:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100420:	89 d0                	mov    %edx,%eax
  100422:	01 c0                	add    %eax,%eax
  100424:	01 d0                	add    %edx,%eax
  100426:	c1 e0 02             	shl    $0x2,%eax
  100429:	89 c2                	mov    %eax,%edx
  10042b:	8b 45 08             	mov    0x8(%ebp),%eax
  10042e:	01 d0                	add    %edx,%eax
  100430:	8b 40 08             	mov    0x8(%eax),%eax
  100433:	3b 45 18             	cmp    0x18(%ebp),%eax
  100436:	73 13                	jae    10044b <stab_binsearch+0xb1>
            *region_left = m;
  100438:	8b 45 0c             	mov    0xc(%ebp),%eax
  10043b:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10043e:	89 10                	mov    %edx,(%eax)
            l = true_m + 1;
  100440:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100443:	83 c0 01             	add    $0x1,%eax
  100446:	89 45 fc             	mov    %eax,-0x4(%ebp)
  100449:	eb 43                	jmp    10048e <stab_binsearch+0xf4>
        } else if (stabs[m].n_value > addr) {
  10044b:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10044e:	89 d0                	mov    %edx,%eax
  100450:	01 c0                	add    %eax,%eax
  100452:	01 d0                	add    %edx,%eax
  100454:	c1 e0 02             	shl    $0x2,%eax
  100457:	89 c2                	mov    %eax,%edx
  100459:	8b 45 08             	mov    0x8(%ebp),%eax
  10045c:	01 d0                	add    %edx,%eax
  10045e:	8b 40 08             	mov    0x8(%eax),%eax
  100461:	3b 45 18             	cmp    0x18(%ebp),%eax
  100464:	76 16                	jbe    10047c <stab_binsearch+0xe2>
            *region_right = m - 1;
  100466:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100469:	8d 50 ff             	lea    -0x1(%eax),%edx
  10046c:	8b 45 10             	mov    0x10(%ebp),%eax
  10046f:	89 10                	mov    %edx,(%eax)
            r = m - 1;
  100471:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100474:	83 e8 01             	sub    $0x1,%eax
  100477:	89 45 f8             	mov    %eax,-0x8(%ebp)
  10047a:	eb 12                	jmp    10048e <stab_binsearch+0xf4>
        } else {
            // exact match for 'addr', but continue loop to find
            // *region_right
            *region_left = m;
  10047c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10047f:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100482:	89 10                	mov    %edx,(%eax)
            l = m;
  100484:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100487:	89 45 fc             	mov    %eax,-0x4(%ebp)
            addr ++;
  10048a:	83 45 18 01          	addl   $0x1,0x18(%ebp)
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
    int l = *region_left, r = *region_right, any_matches = 0;

    while (l <= r) {
  10048e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100491:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  100494:	0f 8e 22 ff ff ff    	jle    1003bc <stab_binsearch+0x22>
            l = m;
            addr ++;
        }
    }

    if (!any_matches) {
  10049a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10049e:	75 0f                	jne    1004af <stab_binsearch+0x115>
        *region_right = *region_left - 1;
  1004a0:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004a3:	8b 00                	mov    (%eax),%eax
  1004a5:	8d 50 ff             	lea    -0x1(%eax),%edx
  1004a8:	8b 45 10             	mov    0x10(%ebp),%eax
  1004ab:	89 10                	mov    %edx,(%eax)
  1004ad:	eb 3f                	jmp    1004ee <stab_binsearch+0x154>
    }
    else {
        // find rightmost region containing 'addr'
        l = *region_right;
  1004af:	8b 45 10             	mov    0x10(%ebp),%eax
  1004b2:	8b 00                	mov    (%eax),%eax
  1004b4:	89 45 fc             	mov    %eax,-0x4(%ebp)
        for (; l > *region_left && stabs[l].n_type != type; l --)
  1004b7:	eb 04                	jmp    1004bd <stab_binsearch+0x123>
  1004b9:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
  1004bd:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004c0:	8b 00                	mov    (%eax),%eax
  1004c2:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1004c5:	7d 1f                	jge    1004e6 <stab_binsearch+0x14c>
  1004c7:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1004ca:	89 d0                	mov    %edx,%eax
  1004cc:	01 c0                	add    %eax,%eax
  1004ce:	01 d0                	add    %edx,%eax
  1004d0:	c1 e0 02             	shl    $0x2,%eax
  1004d3:	89 c2                	mov    %eax,%edx
  1004d5:	8b 45 08             	mov    0x8(%ebp),%eax
  1004d8:	01 d0                	add    %edx,%eax
  1004da:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1004de:	0f b6 c0             	movzbl %al,%eax
  1004e1:	3b 45 14             	cmp    0x14(%ebp),%eax
  1004e4:	75 d3                	jne    1004b9 <stab_binsearch+0x11f>
            /* do nothing */;
        *region_left = l;
  1004e6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004e9:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1004ec:	89 10                	mov    %edx,(%eax)
    }
}
  1004ee:	c9                   	leave  
  1004ef:	c3                   	ret    

001004f0 <debuginfo_eip>:
 * the specified instruction address, @addr.  Returns 0 if information
 * was found, and negative if not.  But even if it returns negative it
 * has stored some information into '*info'.
 * */
int
debuginfo_eip(uintptr_t addr, struct eipdebuginfo *info) {
  1004f0:	55                   	push   %ebp
  1004f1:	89 e5                	mov    %esp,%ebp
  1004f3:	83 ec 58             	sub    $0x58,%esp
    const struct stab *stabs, *stab_end;
    const char *stabstr, *stabstr_end;

    info->eip_file = "<unknown>";
  1004f6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004f9:	c7 00 4c 33 10 00    	movl   $0x10334c,(%eax)
    info->eip_line = 0;
  1004ff:	8b 45 0c             	mov    0xc(%ebp),%eax
  100502:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    info->eip_fn_name = "<unknown>";
  100509:	8b 45 0c             	mov    0xc(%ebp),%eax
  10050c:	c7 40 08 4c 33 10 00 	movl   $0x10334c,0x8(%eax)
    info->eip_fn_namelen = 9;
  100513:	8b 45 0c             	mov    0xc(%ebp),%eax
  100516:	c7 40 0c 09 00 00 00 	movl   $0x9,0xc(%eax)
    info->eip_fn_addr = addr;
  10051d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100520:	8b 55 08             	mov    0x8(%ebp),%edx
  100523:	89 50 10             	mov    %edx,0x10(%eax)
    info->eip_fn_narg = 0;
  100526:	8b 45 0c             	mov    0xc(%ebp),%eax
  100529:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)

    stabs = __STAB_BEGIN__;
  100530:	c7 45 f4 8c 3b 10 00 	movl   $0x103b8c,-0xc(%ebp)
    stab_end = __STAB_END__;
  100537:	c7 45 f0 94 b1 10 00 	movl   $0x10b194,-0x10(%ebp)
    stabstr = __STABSTR_BEGIN__;
  10053e:	c7 45 ec 95 b1 10 00 	movl   $0x10b195,-0x14(%ebp)
    stabstr_end = __STABSTR_END__;
  100545:	c7 45 e8 96 d1 10 00 	movl   $0x10d196,-0x18(%ebp)

    // String table validity checks
    if (stabstr_end <= stabstr || stabstr_end[-1] != 0) {
  10054c:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10054f:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  100552:	76 0d                	jbe    100561 <debuginfo_eip+0x71>
  100554:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100557:	83 e8 01             	sub    $0x1,%eax
  10055a:	0f b6 00             	movzbl (%eax),%eax
  10055d:	84 c0                	test   %al,%al
  10055f:	74 0a                	je     10056b <debuginfo_eip+0x7b>
        return -1;
  100561:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100566:	e9 c0 02 00 00       	jmp    10082b <debuginfo_eip+0x33b>
    // 'eip'.  First, we find the basic source file containing 'eip'.
    // Then, we look in that source file for the function.  Then we look
    // for the line number.

    // Search the entire set of stabs for the source file (type N_SO).
    int lfile = 0, rfile = (stab_end - stabs) - 1;
  10056b:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  100572:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100575:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100578:	29 c2                	sub    %eax,%edx
  10057a:	89 d0                	mov    %edx,%eax
  10057c:	c1 f8 02             	sar    $0x2,%eax
  10057f:	69 c0 ab aa aa aa    	imul   $0xaaaaaaab,%eax,%eax
  100585:	83 e8 01             	sub    $0x1,%eax
  100588:	89 45 e0             	mov    %eax,-0x20(%ebp)
    stab_binsearch(stabs, &lfile, &rfile, N_SO, addr);
  10058b:	8b 45 08             	mov    0x8(%ebp),%eax
  10058e:	89 44 24 10          	mov    %eax,0x10(%esp)
  100592:	c7 44 24 0c 64 00 00 	movl   $0x64,0xc(%esp)
  100599:	00 
  10059a:	8d 45 e0             	lea    -0x20(%ebp),%eax
  10059d:	89 44 24 08          	mov    %eax,0x8(%esp)
  1005a1:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  1005a4:	89 44 24 04          	mov    %eax,0x4(%esp)
  1005a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1005ab:	89 04 24             	mov    %eax,(%esp)
  1005ae:	e8 e7 fd ff ff       	call   10039a <stab_binsearch>
    if (lfile == 0)
  1005b3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1005b6:	85 c0                	test   %eax,%eax
  1005b8:	75 0a                	jne    1005c4 <debuginfo_eip+0xd4>
        return -1;
  1005ba:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1005bf:	e9 67 02 00 00       	jmp    10082b <debuginfo_eip+0x33b>

    // Search within that file's stabs for the function definition
    // (N_FUN).
    int lfun = lfile, rfun = rfile;
  1005c4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1005c7:	89 45 dc             	mov    %eax,-0x24(%ebp)
  1005ca:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1005cd:	89 45 d8             	mov    %eax,-0x28(%ebp)
    int lline, rline;
    stab_binsearch(stabs, &lfun, &rfun, N_FUN, addr);
  1005d0:	8b 45 08             	mov    0x8(%ebp),%eax
  1005d3:	89 44 24 10          	mov    %eax,0x10(%esp)
  1005d7:	c7 44 24 0c 24 00 00 	movl   $0x24,0xc(%esp)
  1005de:	00 
  1005df:	8d 45 d8             	lea    -0x28(%ebp),%eax
  1005e2:	89 44 24 08          	mov    %eax,0x8(%esp)
  1005e6:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1005e9:	89 44 24 04          	mov    %eax,0x4(%esp)
  1005ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1005f0:	89 04 24             	mov    %eax,(%esp)
  1005f3:	e8 a2 fd ff ff       	call   10039a <stab_binsearch>

    if (lfun <= rfun) {
  1005f8:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1005fb:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1005fe:	39 c2                	cmp    %eax,%edx
  100600:	7f 7c                	jg     10067e <debuginfo_eip+0x18e>
        // stabs[lfun] points to the function name
        // in the string table, but check bounds just in case.
        if (stabs[lfun].n_strx < stabstr_end - stabstr) {
  100602:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100605:	89 c2                	mov    %eax,%edx
  100607:	89 d0                	mov    %edx,%eax
  100609:	01 c0                	add    %eax,%eax
  10060b:	01 d0                	add    %edx,%eax
  10060d:	c1 e0 02             	shl    $0x2,%eax
  100610:	89 c2                	mov    %eax,%edx
  100612:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100615:	01 d0                	add    %edx,%eax
  100617:	8b 10                	mov    (%eax),%edx
  100619:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  10061c:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10061f:	29 c1                	sub    %eax,%ecx
  100621:	89 c8                	mov    %ecx,%eax
  100623:	39 c2                	cmp    %eax,%edx
  100625:	73 22                	jae    100649 <debuginfo_eip+0x159>
            info->eip_fn_name = stabstr + stabs[lfun].n_strx;
  100627:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10062a:	89 c2                	mov    %eax,%edx
  10062c:	89 d0                	mov    %edx,%eax
  10062e:	01 c0                	add    %eax,%eax
  100630:	01 d0                	add    %edx,%eax
  100632:	c1 e0 02             	shl    $0x2,%eax
  100635:	89 c2                	mov    %eax,%edx
  100637:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10063a:	01 d0                	add    %edx,%eax
  10063c:	8b 10                	mov    (%eax),%edx
  10063e:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100641:	01 c2                	add    %eax,%edx
  100643:	8b 45 0c             	mov    0xc(%ebp),%eax
  100646:	89 50 08             	mov    %edx,0x8(%eax)
        }
        info->eip_fn_addr = stabs[lfun].n_value;
  100649:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10064c:	89 c2                	mov    %eax,%edx
  10064e:	89 d0                	mov    %edx,%eax
  100650:	01 c0                	add    %eax,%eax
  100652:	01 d0                	add    %edx,%eax
  100654:	c1 e0 02             	shl    $0x2,%eax
  100657:	89 c2                	mov    %eax,%edx
  100659:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10065c:	01 d0                	add    %edx,%eax
  10065e:	8b 50 08             	mov    0x8(%eax),%edx
  100661:	8b 45 0c             	mov    0xc(%ebp),%eax
  100664:	89 50 10             	mov    %edx,0x10(%eax)
        addr -= info->eip_fn_addr;
  100667:	8b 45 0c             	mov    0xc(%ebp),%eax
  10066a:	8b 40 10             	mov    0x10(%eax),%eax
  10066d:	29 45 08             	sub    %eax,0x8(%ebp)
        // Search within the function definition for the line number.
        lline = lfun;
  100670:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100673:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfun;
  100676:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100679:	89 45 d0             	mov    %eax,-0x30(%ebp)
  10067c:	eb 15                	jmp    100693 <debuginfo_eip+0x1a3>
    } else {
        // Couldn't find function stab!  Maybe we're in an assembly
        // file.  Search the whole file for the line number.
        info->eip_fn_addr = addr;
  10067e:	8b 45 0c             	mov    0xc(%ebp),%eax
  100681:	8b 55 08             	mov    0x8(%ebp),%edx
  100684:	89 50 10             	mov    %edx,0x10(%eax)
        lline = lfile;
  100687:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10068a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfile;
  10068d:	8b 45 e0             	mov    -0x20(%ebp),%eax
  100690:	89 45 d0             	mov    %eax,-0x30(%ebp)
    }
    info->eip_fn_namelen = strfind(info->eip_fn_name, ':') - info->eip_fn_name;
  100693:	8b 45 0c             	mov    0xc(%ebp),%eax
  100696:	8b 40 08             	mov    0x8(%eax),%eax
  100699:	c7 44 24 04 3a 00 00 	movl   $0x3a,0x4(%esp)
  1006a0:	00 
  1006a1:	89 04 24             	mov    %eax,(%esp)
  1006a4:	e8 c7 28 00 00       	call   102f70 <strfind>
  1006a9:	89 c2                	mov    %eax,%edx
  1006ab:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006ae:	8b 40 08             	mov    0x8(%eax),%eax
  1006b1:	29 c2                	sub    %eax,%edx
  1006b3:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006b6:	89 50 0c             	mov    %edx,0xc(%eax)

    // Search within [lline, rline] for the line number stab.
    // If found, set info->eip_line to the right line number.
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
  1006b9:	8b 45 08             	mov    0x8(%ebp),%eax
  1006bc:	89 44 24 10          	mov    %eax,0x10(%esp)
  1006c0:	c7 44 24 0c 44 00 00 	movl   $0x44,0xc(%esp)
  1006c7:	00 
  1006c8:	8d 45 d0             	lea    -0x30(%ebp),%eax
  1006cb:	89 44 24 08          	mov    %eax,0x8(%esp)
  1006cf:	8d 45 d4             	lea    -0x2c(%ebp),%eax
  1006d2:	89 44 24 04          	mov    %eax,0x4(%esp)
  1006d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006d9:	89 04 24             	mov    %eax,(%esp)
  1006dc:	e8 b9 fc ff ff       	call   10039a <stab_binsearch>
    if (lline <= rline) {
  1006e1:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1006e4:	8b 45 d0             	mov    -0x30(%ebp),%eax
  1006e7:	39 c2                	cmp    %eax,%edx
  1006e9:	7f 24                	jg     10070f <debuginfo_eip+0x21f>
        info->eip_line = stabs[rline].n_desc;
  1006eb:	8b 45 d0             	mov    -0x30(%ebp),%eax
  1006ee:	89 c2                	mov    %eax,%edx
  1006f0:	89 d0                	mov    %edx,%eax
  1006f2:	01 c0                	add    %eax,%eax
  1006f4:	01 d0                	add    %edx,%eax
  1006f6:	c1 e0 02             	shl    $0x2,%eax
  1006f9:	89 c2                	mov    %eax,%edx
  1006fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006fe:	01 d0                	add    %edx,%eax
  100700:	0f b7 40 06          	movzwl 0x6(%eax),%eax
  100704:	0f b7 d0             	movzwl %ax,%edx
  100707:	8b 45 0c             	mov    0xc(%ebp),%eax
  10070a:	89 50 04             	mov    %edx,0x4(%eax)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  10070d:	eb 13                	jmp    100722 <debuginfo_eip+0x232>
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
    if (lline <= rline) {
        info->eip_line = stabs[rline].n_desc;
    } else {
        return -1;
  10070f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100714:	e9 12 01 00 00       	jmp    10082b <debuginfo_eip+0x33b>
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
           && stabs[lline].n_type != N_SOL
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
        lline --;
  100719:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10071c:	83 e8 01             	sub    $0x1,%eax
  10071f:	89 45 d4             	mov    %eax,-0x2c(%ebp)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  100722:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100725:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100728:	39 c2                	cmp    %eax,%edx
  10072a:	7c 56                	jl     100782 <debuginfo_eip+0x292>
           && stabs[lline].n_type != N_SOL
  10072c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10072f:	89 c2                	mov    %eax,%edx
  100731:	89 d0                	mov    %edx,%eax
  100733:	01 c0                	add    %eax,%eax
  100735:	01 d0                	add    %edx,%eax
  100737:	c1 e0 02             	shl    $0x2,%eax
  10073a:	89 c2                	mov    %eax,%edx
  10073c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10073f:	01 d0                	add    %edx,%eax
  100741:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100745:	3c 84                	cmp    $0x84,%al
  100747:	74 39                	je     100782 <debuginfo_eip+0x292>
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
  100749:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10074c:	89 c2                	mov    %eax,%edx
  10074e:	89 d0                	mov    %edx,%eax
  100750:	01 c0                	add    %eax,%eax
  100752:	01 d0                	add    %edx,%eax
  100754:	c1 e0 02             	shl    $0x2,%eax
  100757:	89 c2                	mov    %eax,%edx
  100759:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10075c:	01 d0                	add    %edx,%eax
  10075e:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100762:	3c 64                	cmp    $0x64,%al
  100764:	75 b3                	jne    100719 <debuginfo_eip+0x229>
  100766:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100769:	89 c2                	mov    %eax,%edx
  10076b:	89 d0                	mov    %edx,%eax
  10076d:	01 c0                	add    %eax,%eax
  10076f:	01 d0                	add    %edx,%eax
  100771:	c1 e0 02             	shl    $0x2,%eax
  100774:	89 c2                	mov    %eax,%edx
  100776:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100779:	01 d0                	add    %edx,%eax
  10077b:	8b 40 08             	mov    0x8(%eax),%eax
  10077e:	85 c0                	test   %eax,%eax
  100780:	74 97                	je     100719 <debuginfo_eip+0x229>
        lline --;
    }
    if (lline >= lfile && stabs[lline].n_strx < stabstr_end - stabstr) {
  100782:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100785:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100788:	39 c2                	cmp    %eax,%edx
  10078a:	7c 46                	jl     1007d2 <debuginfo_eip+0x2e2>
  10078c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10078f:	89 c2                	mov    %eax,%edx
  100791:	89 d0                	mov    %edx,%eax
  100793:	01 c0                	add    %eax,%eax
  100795:	01 d0                	add    %edx,%eax
  100797:	c1 e0 02             	shl    $0x2,%eax
  10079a:	89 c2                	mov    %eax,%edx
  10079c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10079f:	01 d0                	add    %edx,%eax
  1007a1:	8b 10                	mov    (%eax),%edx
  1007a3:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  1007a6:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1007a9:	29 c1                	sub    %eax,%ecx
  1007ab:	89 c8                	mov    %ecx,%eax
  1007ad:	39 c2                	cmp    %eax,%edx
  1007af:	73 21                	jae    1007d2 <debuginfo_eip+0x2e2>
        info->eip_file = stabstr + stabs[lline].n_strx;
  1007b1:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007b4:	89 c2                	mov    %eax,%edx
  1007b6:	89 d0                	mov    %edx,%eax
  1007b8:	01 c0                	add    %eax,%eax
  1007ba:	01 d0                	add    %edx,%eax
  1007bc:	c1 e0 02             	shl    $0x2,%eax
  1007bf:	89 c2                	mov    %eax,%edx
  1007c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007c4:	01 d0                	add    %edx,%eax
  1007c6:	8b 10                	mov    (%eax),%edx
  1007c8:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1007cb:	01 c2                	add    %eax,%edx
  1007cd:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007d0:	89 10                	mov    %edx,(%eax)
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
  1007d2:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1007d5:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1007d8:	39 c2                	cmp    %eax,%edx
  1007da:	7d 4a                	jge    100826 <debuginfo_eip+0x336>
        for (lline = lfun + 1;
  1007dc:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1007df:	83 c0 01             	add    $0x1,%eax
  1007e2:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  1007e5:	eb 18                	jmp    1007ff <debuginfo_eip+0x30f>
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
            info->eip_fn_narg ++;
  1007e7:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007ea:	8b 40 14             	mov    0x14(%eax),%eax
  1007ed:	8d 50 01             	lea    0x1(%eax),%edx
  1007f0:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007f3:	89 50 14             	mov    %edx,0x14(%eax)
    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
  1007f6:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007f9:	83 c0 01             	add    $0x1,%eax
  1007fc:	89 45 d4             	mov    %eax,-0x2c(%ebp)

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
             lline < rfun && stabs[lline].n_type == N_PSYM;
  1007ff:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100802:	8b 45 d8             	mov    -0x28(%ebp),%eax
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
  100805:	39 c2                	cmp    %eax,%edx
  100807:	7d 1d                	jge    100826 <debuginfo_eip+0x336>
             lline < rfun && stabs[lline].n_type == N_PSYM;
  100809:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10080c:	89 c2                	mov    %eax,%edx
  10080e:	89 d0                	mov    %edx,%eax
  100810:	01 c0                	add    %eax,%eax
  100812:	01 d0                	add    %edx,%eax
  100814:	c1 e0 02             	shl    $0x2,%eax
  100817:	89 c2                	mov    %eax,%edx
  100819:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10081c:	01 d0                	add    %edx,%eax
  10081e:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100822:	3c a0                	cmp    $0xa0,%al
  100824:	74 c1                	je     1007e7 <debuginfo_eip+0x2f7>
             lline ++) {
            info->eip_fn_narg ++;
        }
    }
    return 0;
  100826:	b8 00 00 00 00       	mov    $0x0,%eax
}
  10082b:	c9                   	leave  
  10082c:	c3                   	ret    

0010082d <print_kerninfo>:
 * print_kerninfo - print the information about kernel, including the location
 * of kernel entry, the start addresses of data and text segements, the start
 * address of free memory and how many memory that kernel has used.
 * */
void
print_kerninfo(void) {
  10082d:	55                   	push   %ebp
  10082e:	89 e5                	mov    %esp,%ebp
  100830:	83 ec 18             	sub    $0x18,%esp
    extern char etext[], edata[], end[], kern_init[];
    cprintf("Special kernel symbols:\n");
  100833:	c7 04 24 56 33 10 00 	movl   $0x103356,(%esp)
  10083a:	e8 ba fa ff ff       	call   1002f9 <cprintf>
    cprintf("  entry  0x%08x (phys)\n", kern_init);
  10083f:	c7 44 24 04 00 00 10 	movl   $0x100000,0x4(%esp)
  100846:	00 
  100847:	c7 04 24 6f 33 10 00 	movl   $0x10336f,(%esp)
  10084e:	e8 a6 fa ff ff       	call   1002f9 <cprintf>
    cprintf("  etext  0x%08x (phys)\n", etext);
  100853:	c7 44 24 04 85 32 10 	movl   $0x103285,0x4(%esp)
  10085a:	00 
  10085b:	c7 04 24 87 33 10 00 	movl   $0x103387,(%esp)
  100862:	e8 92 fa ff ff       	call   1002f9 <cprintf>
    cprintf("  edata  0x%08x (phys)\n", edata);
  100867:	c7 44 24 04 16 ea 10 	movl   $0x10ea16,0x4(%esp)
  10086e:	00 
  10086f:	c7 04 24 9f 33 10 00 	movl   $0x10339f,(%esp)
  100876:	e8 7e fa ff ff       	call   1002f9 <cprintf>
    cprintf("  end    0x%08x (phys)\n", end);
  10087b:	c7 44 24 04 20 fd 10 	movl   $0x10fd20,0x4(%esp)
  100882:	00 
  100883:	c7 04 24 b7 33 10 00 	movl   $0x1033b7,(%esp)
  10088a:	e8 6a fa ff ff       	call   1002f9 <cprintf>
    cprintf("Kernel executable memory footprint: %dKB\n", (end - kern_init + 1023)/1024);
  10088f:	b8 20 fd 10 00       	mov    $0x10fd20,%eax
  100894:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  10089a:	b8 00 00 10 00       	mov    $0x100000,%eax
  10089f:	29 c2                	sub    %eax,%edx
  1008a1:	89 d0                	mov    %edx,%eax
  1008a3:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  1008a9:	85 c0                	test   %eax,%eax
  1008ab:	0f 48 c2             	cmovs  %edx,%eax
  1008ae:	c1 f8 0a             	sar    $0xa,%eax
  1008b1:	89 44 24 04          	mov    %eax,0x4(%esp)
  1008b5:	c7 04 24 d0 33 10 00 	movl   $0x1033d0,(%esp)
  1008bc:	e8 38 fa ff ff       	call   1002f9 <cprintf>
}
  1008c1:	c9                   	leave  
  1008c2:	c3                   	ret    

001008c3 <print_debuginfo>:
/* *
 * print_debuginfo - read and print the stat information for the address @eip,
 * and info.eip_fn_addr should be the first address of the related function.
 * */
void
print_debuginfo(uintptr_t eip) {
  1008c3:	55                   	push   %ebp
  1008c4:	89 e5                	mov    %esp,%ebp
  1008c6:	81 ec 48 01 00 00    	sub    $0x148,%esp
    struct eipdebuginfo info;
    if (debuginfo_eip(eip, &info) != 0) {
  1008cc:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1008cf:	89 44 24 04          	mov    %eax,0x4(%esp)
  1008d3:	8b 45 08             	mov    0x8(%ebp),%eax
  1008d6:	89 04 24             	mov    %eax,(%esp)
  1008d9:	e8 12 fc ff ff       	call   1004f0 <debuginfo_eip>
  1008de:	85 c0                	test   %eax,%eax
  1008e0:	74 15                	je     1008f7 <print_debuginfo+0x34>
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
  1008e2:	8b 45 08             	mov    0x8(%ebp),%eax
  1008e5:	89 44 24 04          	mov    %eax,0x4(%esp)
  1008e9:	c7 04 24 fa 33 10 00 	movl   $0x1033fa,(%esp)
  1008f0:	e8 04 fa ff ff       	call   1002f9 <cprintf>
  1008f5:	eb 6d                	jmp    100964 <print_debuginfo+0xa1>
    }
    else {
        char fnname[256];
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  1008f7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1008fe:	eb 1c                	jmp    10091c <print_debuginfo+0x59>
            fnname[j] = info.eip_fn_name[j];
  100900:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  100903:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100906:	01 d0                	add    %edx,%eax
  100908:	0f b6 00             	movzbl (%eax),%eax
  10090b:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  100911:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100914:	01 ca                	add    %ecx,%edx
  100916:	88 02                	mov    %al,(%edx)
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
    }
    else {
        char fnname[256];
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  100918:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  10091c:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10091f:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  100922:	7f dc                	jg     100900 <print_debuginfo+0x3d>
            fnname[j] = info.eip_fn_name[j];
        }
        fnname[j] = '\0';
  100924:	8d 95 dc fe ff ff    	lea    -0x124(%ebp),%edx
  10092a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10092d:	01 d0                	add    %edx,%eax
  10092f:	c6 00 00             	movb   $0x0,(%eax)
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
                fnname, eip - info.eip_fn_addr);
  100932:	8b 45 ec             	mov    -0x14(%ebp),%eax
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
            fnname[j] = info.eip_fn_name[j];
        }
        fnname[j] = '\0';
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
  100935:	8b 55 08             	mov    0x8(%ebp),%edx
  100938:	89 d1                	mov    %edx,%ecx
  10093a:	29 c1                	sub    %eax,%ecx
  10093c:	8b 55 e0             	mov    -0x20(%ebp),%edx
  10093f:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100942:	89 4c 24 10          	mov    %ecx,0x10(%esp)
  100946:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  10094c:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  100950:	89 54 24 08          	mov    %edx,0x8(%esp)
  100954:	89 44 24 04          	mov    %eax,0x4(%esp)
  100958:	c7 04 24 16 34 10 00 	movl   $0x103416,(%esp)
  10095f:	e8 95 f9 ff ff       	call   1002f9 <cprintf>
                fnname, eip - info.eip_fn_addr);
    }
}
  100964:	c9                   	leave  
  100965:	c3                   	ret    

00100966 <read_eip>:

static __noinline uint32_t
read_eip(void) {
  100966:	55                   	push   %ebp
  100967:	89 e5                	mov    %esp,%ebp
  100969:	83 ec 10             	sub    $0x10,%esp
    uint32_t eip;
    asm volatile("movl 4(%%ebp), %0" : "=r" (eip));
  10096c:	8b 45 04             	mov    0x4(%ebp),%eax
  10096f:	89 45 fc             	mov    %eax,-0x4(%ebp)
    return eip;
  100972:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  100975:	c9                   	leave  
  100976:	c3                   	ret    

00100977 <print_stackframe>:
 *
 * Note that, the length of ebp-chain is limited. In boot/bootasm.S, before jumping
 * to the kernel entry, the value of ebp has been set to zero, that's the boundary.
 * */
void
print_stackframe(void) {
  100977:	55                   	push   %ebp
  100978:	89 e5                	mov    %esp,%ebp
  10097a:	83 ec 38             	sub    $0x38,%esp
}

static inline uint32_t
read_ebp(void) {
    uint32_t ebp;
    asm volatile ("movl %%ebp, %0" : "=r" (ebp));
  10097d:	89 e8                	mov    %ebp,%eax
  10097f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    return ebp;
  100982:	8b 45 e4             	mov    -0x1c(%ebp),%eax
      *    (3.4) call print_debuginfo(eip-1) to print the C calling function name and line number, etc.
      *    (3.5) popup a calling stackframe
      *           NOTICE: the calling funciton's return addr eip  = ss:[ebp+4]
      *                   the calling funciton's ebp = ss:[ebp]
      */
	uint32_t ebp_value = read_ebp();
  100985:	89 45 f0             	mov    %eax,-0x10(%ebp)
        // read the value of ebp of last frame, thus value of memory the current ebp point to
	uint32_t eip_value = read_eip();
  100988:	e8 d9 ff ff ff       	call   100966 <read_eip>
  10098d:	89 45 ec             	mov    %eax,-0x14(%ebp)
	// read the value of eip
	
//	for (int i = 0; ebp_value != 0 && i < STACKFRAME_DEPTH; i ++){
		cprintf("ebp:%08x", ebp_value);	
  100990:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100993:	89 44 24 04          	mov    %eax,0x4(%esp)
  100997:	c7 04 24 28 34 10 00 	movl   $0x103428,(%esp)
  10099e:	e8 56 f9 ff ff       	call   1002f9 <cprintf>
		cprintf(" eip:%08x", eip_value);	
  1009a3:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1009a6:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009aa:	c7 04 24 31 34 10 00 	movl   $0x103431,(%esp)
  1009b1:	e8 43 f9 ff ff       	call   1002f9 <cprintf>
		
		cprintf(" args:");
  1009b6:	c7 04 24 3b 34 10 00 	movl   $0x10343b,(%esp)
  1009bd:	e8 37 f9 ff ff       	call   1002f9 <cprintf>
		int j=0;		
  1009c2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
		for(j=0;j<4;j++){
  1009c9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1009d0:	eb 29                	jmp    1009fb <print_stackframe+0x84>
			uint32_t* argu = (uint32_t*)ebp_value + 2*j;
  1009d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009d5:	c1 e0 03             	shl    $0x3,%eax
  1009d8:	89 c2                	mov    %eax,%edx
  1009da:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1009dd:	01 d0                	add    %edx,%eax
  1009df:	89 45 e8             	mov    %eax,-0x18(%ebp)
			cprintf("%08x ", *argu);
  1009e2:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1009e5:	8b 00                	mov    (%eax),%eax
  1009e7:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009eb:	c7 04 24 42 34 10 00 	movl   $0x103442,(%esp)
  1009f2:	e8 02 f9 ff ff       	call   1002f9 <cprintf>
		cprintf("ebp:%08x", ebp_value);	
		cprintf(" eip:%08x", eip_value);	
		
		cprintf(" args:");
		int j=0;		
		for(j=0;j<4;j++){
  1009f7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  1009fb:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
  1009ff:	7e d1                	jle    1009d2 <print_stackframe+0x5b>
			uint32_t* argu = (uint32_t*)ebp_value + 2*j;
			cprintf("%08x ", *argu);
		}

		print_debuginfo(eip_value-1);
  100a01:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100a04:	83 e8 01             	sub    $0x1,%eax
  100a07:	89 04 24             	mov    %eax,(%esp)
  100a0a:	e8 b4 fe ff ff       	call   1008c3 <print_debuginfo>
//	}
	// backup a register like eax and then use the reg to read the memory, and trace again.
//	asm volatile ("movl %%ebp, %%eax" );
}
  100a0f:	c9                   	leave  
  100a10:	c3                   	ret    

00100a11 <parse>:
#define MAXARGS         16
#define WHITESPACE      " \t\n\r"

/* parse - parse the command buffer into whitespace-separated arguments */
static int
parse(char *buf, char **argv) {
  100a11:	55                   	push   %ebp
  100a12:	89 e5                	mov    %esp,%ebp
  100a14:	83 ec 28             	sub    $0x28,%esp
    int argc = 0;
  100a17:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100a1e:	eb 0c                	jmp    100a2c <parse+0x1b>
            *buf ++ = '\0';
  100a20:	8b 45 08             	mov    0x8(%ebp),%eax
  100a23:	8d 50 01             	lea    0x1(%eax),%edx
  100a26:	89 55 08             	mov    %edx,0x8(%ebp)
  100a29:	c6 00 00             	movb   $0x0,(%eax)
static int
parse(char *buf, char **argv) {
    int argc = 0;
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100a2c:	8b 45 08             	mov    0x8(%ebp),%eax
  100a2f:	0f b6 00             	movzbl (%eax),%eax
  100a32:	84 c0                	test   %al,%al
  100a34:	74 1d                	je     100a53 <parse+0x42>
  100a36:	8b 45 08             	mov    0x8(%ebp),%eax
  100a39:	0f b6 00             	movzbl (%eax),%eax
  100a3c:	0f be c0             	movsbl %al,%eax
  100a3f:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a43:	c7 04 24 c8 34 10 00 	movl   $0x1034c8,(%esp)
  100a4a:	e8 ee 24 00 00       	call   102f3d <strchr>
  100a4f:	85 c0                	test   %eax,%eax
  100a51:	75 cd                	jne    100a20 <parse+0xf>
            *buf ++ = '\0';
        }
        if (*buf == '\0') {
  100a53:	8b 45 08             	mov    0x8(%ebp),%eax
  100a56:	0f b6 00             	movzbl (%eax),%eax
  100a59:	84 c0                	test   %al,%al
  100a5b:	75 02                	jne    100a5f <parse+0x4e>
            break;
  100a5d:	eb 67                	jmp    100ac6 <parse+0xb5>
        }

        // save and scan past next arg
        if (argc == MAXARGS - 1) {
  100a5f:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
  100a63:	75 14                	jne    100a79 <parse+0x68>
            cprintf("Too many arguments (max %d).\n", MAXARGS);
  100a65:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
  100a6c:	00 
  100a6d:	c7 04 24 cd 34 10 00 	movl   $0x1034cd,(%esp)
  100a74:	e8 80 f8 ff ff       	call   1002f9 <cprintf>
        }
        argv[argc ++] = buf;
  100a79:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a7c:	8d 50 01             	lea    0x1(%eax),%edx
  100a7f:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100a82:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100a89:	8b 45 0c             	mov    0xc(%ebp),%eax
  100a8c:	01 c2                	add    %eax,%edx
  100a8e:	8b 45 08             	mov    0x8(%ebp),%eax
  100a91:	89 02                	mov    %eax,(%edx)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100a93:	eb 04                	jmp    100a99 <parse+0x88>
            buf ++;
  100a95:	83 45 08 01          	addl   $0x1,0x8(%ebp)
        // save and scan past next arg
        if (argc == MAXARGS - 1) {
            cprintf("Too many arguments (max %d).\n", MAXARGS);
        }
        argv[argc ++] = buf;
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100a99:	8b 45 08             	mov    0x8(%ebp),%eax
  100a9c:	0f b6 00             	movzbl (%eax),%eax
  100a9f:	84 c0                	test   %al,%al
  100aa1:	74 1d                	je     100ac0 <parse+0xaf>
  100aa3:	8b 45 08             	mov    0x8(%ebp),%eax
  100aa6:	0f b6 00             	movzbl (%eax),%eax
  100aa9:	0f be c0             	movsbl %al,%eax
  100aac:	89 44 24 04          	mov    %eax,0x4(%esp)
  100ab0:	c7 04 24 c8 34 10 00 	movl   $0x1034c8,(%esp)
  100ab7:	e8 81 24 00 00       	call   102f3d <strchr>
  100abc:	85 c0                	test   %eax,%eax
  100abe:	74 d5                	je     100a95 <parse+0x84>
            buf ++;
        }
    }
  100ac0:	90                   	nop
static int
parse(char *buf, char **argv) {
    int argc = 0;
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100ac1:	e9 66 ff ff ff       	jmp    100a2c <parse+0x1b>
        argv[argc ++] = buf;
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
            buf ++;
        }
    }
    return argc;
  100ac6:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100ac9:	c9                   	leave  
  100aca:	c3                   	ret    

00100acb <runcmd>:
/* *
 * runcmd - parse the input string, split it into separated arguments
 * and then lookup and invoke some related commands/
 * */
static int
runcmd(char *buf, struct trapframe *tf) {
  100acb:	55                   	push   %ebp
  100acc:	89 e5                	mov    %esp,%ebp
  100ace:	83 ec 68             	sub    $0x68,%esp
    char *argv[MAXARGS];
    int argc = parse(buf, argv);
  100ad1:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100ad4:	89 44 24 04          	mov    %eax,0x4(%esp)
  100ad8:	8b 45 08             	mov    0x8(%ebp),%eax
  100adb:	89 04 24             	mov    %eax,(%esp)
  100ade:	e8 2e ff ff ff       	call   100a11 <parse>
  100ae3:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if (argc == 0) {
  100ae6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100aea:	75 0a                	jne    100af6 <runcmd+0x2b>
        return 0;
  100aec:	b8 00 00 00 00       	mov    $0x0,%eax
  100af1:	e9 85 00 00 00       	jmp    100b7b <runcmd+0xb0>
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100af6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100afd:	eb 5c                	jmp    100b5b <runcmd+0x90>
        if (strcmp(commands[i].name, argv[0]) == 0) {
  100aff:	8b 4d b0             	mov    -0x50(%ebp),%ecx
  100b02:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100b05:	89 d0                	mov    %edx,%eax
  100b07:	01 c0                	add    %eax,%eax
  100b09:	01 d0                	add    %edx,%eax
  100b0b:	c1 e0 02             	shl    $0x2,%eax
  100b0e:	05 00 e0 10 00       	add    $0x10e000,%eax
  100b13:	8b 00                	mov    (%eax),%eax
  100b15:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  100b19:	89 04 24             	mov    %eax,(%esp)
  100b1c:	e8 7d 23 00 00       	call   102e9e <strcmp>
  100b21:	85 c0                	test   %eax,%eax
  100b23:	75 32                	jne    100b57 <runcmd+0x8c>
            return commands[i].func(argc - 1, argv + 1, tf);
  100b25:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100b28:	89 d0                	mov    %edx,%eax
  100b2a:	01 c0                	add    %eax,%eax
  100b2c:	01 d0                	add    %edx,%eax
  100b2e:	c1 e0 02             	shl    $0x2,%eax
  100b31:	05 00 e0 10 00       	add    $0x10e000,%eax
  100b36:	8b 40 08             	mov    0x8(%eax),%eax
  100b39:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100b3c:	8d 4a ff             	lea    -0x1(%edx),%ecx
  100b3f:	8b 55 0c             	mov    0xc(%ebp),%edx
  100b42:	89 54 24 08          	mov    %edx,0x8(%esp)
  100b46:	8d 55 b0             	lea    -0x50(%ebp),%edx
  100b49:	83 c2 04             	add    $0x4,%edx
  100b4c:	89 54 24 04          	mov    %edx,0x4(%esp)
  100b50:	89 0c 24             	mov    %ecx,(%esp)
  100b53:	ff d0                	call   *%eax
  100b55:	eb 24                	jmp    100b7b <runcmd+0xb0>
    int argc = parse(buf, argv);
    if (argc == 0) {
        return 0;
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100b57:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100b5b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b5e:	83 f8 02             	cmp    $0x2,%eax
  100b61:	76 9c                	jbe    100aff <runcmd+0x34>
        if (strcmp(commands[i].name, argv[0]) == 0) {
            return commands[i].func(argc - 1, argv + 1, tf);
        }
    }
    cprintf("Unknown command '%s'\n", argv[0]);
  100b63:	8b 45 b0             	mov    -0x50(%ebp),%eax
  100b66:	89 44 24 04          	mov    %eax,0x4(%esp)
  100b6a:	c7 04 24 eb 34 10 00 	movl   $0x1034eb,(%esp)
  100b71:	e8 83 f7 ff ff       	call   1002f9 <cprintf>
    return 0;
  100b76:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100b7b:	c9                   	leave  
  100b7c:	c3                   	ret    

00100b7d <kmonitor>:

/***** Implementations of basic kernel monitor commands *****/

void
kmonitor(struct trapframe *tf) {
  100b7d:	55                   	push   %ebp
  100b7e:	89 e5                	mov    %esp,%ebp
  100b80:	83 ec 28             	sub    $0x28,%esp
    cprintf("Welcome to the kernel debug monitor!!\n");
  100b83:	c7 04 24 04 35 10 00 	movl   $0x103504,(%esp)
  100b8a:	e8 6a f7 ff ff       	call   1002f9 <cprintf>
    cprintf("Type 'help' for a list of commands.\n");
  100b8f:	c7 04 24 2c 35 10 00 	movl   $0x10352c,(%esp)
  100b96:	e8 5e f7 ff ff       	call   1002f9 <cprintf>

    if (tf != NULL) {
  100b9b:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100b9f:	74 0b                	je     100bac <kmonitor+0x2f>
        print_trapframe(tf);
  100ba1:	8b 45 08             	mov    0x8(%ebp),%eax
  100ba4:	89 04 24             	mov    %eax,(%esp)
  100ba7:	e8 61 0c 00 00       	call   10180d <print_trapframe>
    }

    char *buf;
    while (1) {
        if ((buf = readline("K> ")) != NULL) {
  100bac:	c7 04 24 51 35 10 00 	movl   $0x103551,(%esp)
  100bb3:	e8 38 f6 ff ff       	call   1001f0 <readline>
  100bb8:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100bbb:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100bbf:	74 18                	je     100bd9 <kmonitor+0x5c>
            if (runcmd(buf, tf) < 0) {
  100bc1:	8b 45 08             	mov    0x8(%ebp),%eax
  100bc4:	89 44 24 04          	mov    %eax,0x4(%esp)
  100bc8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100bcb:	89 04 24             	mov    %eax,(%esp)
  100bce:	e8 f8 fe ff ff       	call   100acb <runcmd>
  100bd3:	85 c0                	test   %eax,%eax
  100bd5:	79 02                	jns    100bd9 <kmonitor+0x5c>
                break;
  100bd7:	eb 02                	jmp    100bdb <kmonitor+0x5e>
            }
        }
    }
  100bd9:	eb d1                	jmp    100bac <kmonitor+0x2f>
}
  100bdb:	c9                   	leave  
  100bdc:	c3                   	ret    

00100bdd <mon_help>:

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
  100bdd:	55                   	push   %ebp
  100bde:	89 e5                	mov    %esp,%ebp
  100be0:	83 ec 28             	sub    $0x28,%esp
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100be3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100bea:	eb 3f                	jmp    100c2b <mon_help+0x4e>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
  100bec:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100bef:	89 d0                	mov    %edx,%eax
  100bf1:	01 c0                	add    %eax,%eax
  100bf3:	01 d0                	add    %edx,%eax
  100bf5:	c1 e0 02             	shl    $0x2,%eax
  100bf8:	05 00 e0 10 00       	add    $0x10e000,%eax
  100bfd:	8b 48 04             	mov    0x4(%eax),%ecx
  100c00:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c03:	89 d0                	mov    %edx,%eax
  100c05:	01 c0                	add    %eax,%eax
  100c07:	01 d0                	add    %edx,%eax
  100c09:	c1 e0 02             	shl    $0x2,%eax
  100c0c:	05 00 e0 10 00       	add    $0x10e000,%eax
  100c11:	8b 00                	mov    (%eax),%eax
  100c13:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  100c17:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c1b:	c7 04 24 55 35 10 00 	movl   $0x103555,(%esp)
  100c22:	e8 d2 f6 ff ff       	call   1002f9 <cprintf>

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100c27:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100c2b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c2e:	83 f8 02             	cmp    $0x2,%eax
  100c31:	76 b9                	jbe    100bec <mon_help+0xf>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
    }
    return 0;
  100c33:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c38:	c9                   	leave  
  100c39:	c3                   	ret    

00100c3a <mon_kerninfo>:
/* *
 * mon_kerninfo - call print_kerninfo in kern/debug/kdebug.c to
 * print the memory occupancy in kernel.
 * */
int
mon_kerninfo(int argc, char **argv, struct trapframe *tf) {
  100c3a:	55                   	push   %ebp
  100c3b:	89 e5                	mov    %esp,%ebp
  100c3d:	83 ec 08             	sub    $0x8,%esp
    print_kerninfo();
  100c40:	e8 e8 fb ff ff       	call   10082d <print_kerninfo>
    return 0;
  100c45:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c4a:	c9                   	leave  
  100c4b:	c3                   	ret    

00100c4c <mon_backtrace>:
/* *
 * mon_backtrace - call print_stackframe in kern/debug/kdebug.c to
 * print a backtrace of the stack.
 * */
int
mon_backtrace(int argc, char **argv, struct trapframe *tf) {
  100c4c:	55                   	push   %ebp
  100c4d:	89 e5                	mov    %esp,%ebp
  100c4f:	83 ec 08             	sub    $0x8,%esp
    print_stackframe();
  100c52:	e8 20 fd ff ff       	call   100977 <print_stackframe>
    return 0;
  100c57:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c5c:	c9                   	leave  
  100c5d:	c3                   	ret    

00100c5e <__panic>:
/* *
 * __panic - __panic is called on unresolvable fatal errors. it prints
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
  100c5e:	55                   	push   %ebp
  100c5f:	89 e5                	mov    %esp,%ebp
  100c61:	83 ec 28             	sub    $0x28,%esp
    if (is_panic) {
  100c64:	a1 40 ee 10 00       	mov    0x10ee40,%eax
  100c69:	85 c0                	test   %eax,%eax
  100c6b:	74 02                	je     100c6f <__panic+0x11>
        goto panic_dead;
  100c6d:	eb 48                	jmp    100cb7 <__panic+0x59>
    }
    is_panic = 1;
  100c6f:	c7 05 40 ee 10 00 01 	movl   $0x1,0x10ee40
  100c76:	00 00 00 

    // print the 'message'
    va_list ap;
    va_start(ap, fmt);
  100c79:	8d 45 14             	lea    0x14(%ebp),%eax
  100c7c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel panic at %s:%d:\n    ", file, line);
  100c7f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100c82:	89 44 24 08          	mov    %eax,0x8(%esp)
  100c86:	8b 45 08             	mov    0x8(%ebp),%eax
  100c89:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c8d:	c7 04 24 5e 35 10 00 	movl   $0x10355e,(%esp)
  100c94:	e8 60 f6 ff ff       	call   1002f9 <cprintf>
    vcprintf(fmt, ap);
  100c99:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c9c:	89 44 24 04          	mov    %eax,0x4(%esp)
  100ca0:	8b 45 10             	mov    0x10(%ebp),%eax
  100ca3:	89 04 24             	mov    %eax,(%esp)
  100ca6:	e8 1b f6 ff ff       	call   1002c6 <vcprintf>
    cprintf("\n");
  100cab:	c7 04 24 7a 35 10 00 	movl   $0x10357a,(%esp)
  100cb2:	e8 42 f6 ff ff       	call   1002f9 <cprintf>
    va_end(ap);

panic_dead:
    intr_disable();
  100cb7:	e8 22 09 00 00       	call   1015de <intr_disable>
    while (1) {
        kmonitor(NULL);
  100cbc:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100cc3:	e8 b5 fe ff ff       	call   100b7d <kmonitor>
    }
  100cc8:	eb f2                	jmp    100cbc <__panic+0x5e>

00100cca <__warn>:
}

/* __warn - like panic, but don't */
void
__warn(const char *file, int line, const char *fmt, ...) {
  100cca:	55                   	push   %ebp
  100ccb:	89 e5                	mov    %esp,%ebp
  100ccd:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    va_start(ap, fmt);
  100cd0:	8d 45 14             	lea    0x14(%ebp),%eax
  100cd3:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel warning at %s:%d:\n    ", file, line);
  100cd6:	8b 45 0c             	mov    0xc(%ebp),%eax
  100cd9:	89 44 24 08          	mov    %eax,0x8(%esp)
  100cdd:	8b 45 08             	mov    0x8(%ebp),%eax
  100ce0:	89 44 24 04          	mov    %eax,0x4(%esp)
  100ce4:	c7 04 24 7c 35 10 00 	movl   $0x10357c,(%esp)
  100ceb:	e8 09 f6 ff ff       	call   1002f9 <cprintf>
    vcprintf(fmt, ap);
  100cf0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100cf3:	89 44 24 04          	mov    %eax,0x4(%esp)
  100cf7:	8b 45 10             	mov    0x10(%ebp),%eax
  100cfa:	89 04 24             	mov    %eax,(%esp)
  100cfd:	e8 c4 f5 ff ff       	call   1002c6 <vcprintf>
    cprintf("\n");
  100d02:	c7 04 24 7a 35 10 00 	movl   $0x10357a,(%esp)
  100d09:	e8 eb f5 ff ff       	call   1002f9 <cprintf>
    va_end(ap);
}
  100d0e:	c9                   	leave  
  100d0f:	c3                   	ret    

00100d10 <is_kernel_panic>:

bool
is_kernel_panic(void) {
  100d10:	55                   	push   %ebp
  100d11:	89 e5                	mov    %esp,%ebp
    return is_panic;
  100d13:	a1 40 ee 10 00       	mov    0x10ee40,%eax
}
  100d18:	5d                   	pop    %ebp
  100d19:	c3                   	ret    

00100d1a <clock_init>:
/* *
 * clock_init - initialize 8253 clock to interrupt 100 times per second,
 * and then enable IRQ_TIMER.
 * */
void
clock_init(void) {
  100d1a:	55                   	push   %ebp
  100d1b:	89 e5                	mov    %esp,%ebp
  100d1d:	83 ec 28             	sub    $0x28,%esp
  100d20:	66 c7 45 f6 43 00    	movw   $0x43,-0xa(%ebp)
  100d26:	c6 45 f5 34          	movb   $0x34,-0xb(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100d2a:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100d2e:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100d32:	ee                   	out    %al,(%dx)
  100d33:	66 c7 45 f2 40 00    	movw   $0x40,-0xe(%ebp)
  100d39:	c6 45 f1 9c          	movb   $0x9c,-0xf(%ebp)
  100d3d:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100d41:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100d45:	ee                   	out    %al,(%dx)
  100d46:	66 c7 45 ee 40 00    	movw   $0x40,-0x12(%ebp)
  100d4c:	c6 45 ed 2e          	movb   $0x2e,-0x13(%ebp)
  100d50:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100d54:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100d58:	ee                   	out    %al,(%dx)
    outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
    outb(IO_TIMER1, TIMER_DIV(100) % 256);
    outb(IO_TIMER1, TIMER_DIV(100) / 256);

    // initialize time counter 'ticks' to zero
    ticks = 0;
  100d59:	c7 05 08 f9 10 00 00 	movl   $0x0,0x10f908
  100d60:	00 00 00 

    cprintf("++ setup timer interrupts\n");
  100d63:	c7 04 24 9a 35 10 00 	movl   $0x10359a,(%esp)
  100d6a:	e8 8a f5 ff ff       	call   1002f9 <cprintf>
    pic_enable(IRQ_TIMER);
  100d6f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100d76:	e8 c1 08 00 00       	call   10163c <pic_enable>
}
  100d7b:	c9                   	leave  
  100d7c:	c3                   	ret    

00100d7d <delay>:
#include <picirq.h>
#include <trap.h>

/* stupid I/O delay routine necessitated by historical PC design flaws */
static void
delay(void) {
  100d7d:	55                   	push   %ebp
  100d7e:	89 e5                	mov    %esp,%ebp
  100d80:	83 ec 10             	sub    $0x10,%esp
  100d83:	66 c7 45 fe 84 00    	movw   $0x84,-0x2(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100d89:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  100d8d:	89 c2                	mov    %eax,%edx
  100d8f:	ec                   	in     (%dx),%al
  100d90:	88 45 fd             	mov    %al,-0x3(%ebp)
  100d93:	66 c7 45 fa 84 00    	movw   $0x84,-0x6(%ebp)
  100d99:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100d9d:	89 c2                	mov    %eax,%edx
  100d9f:	ec                   	in     (%dx),%al
  100da0:	88 45 f9             	mov    %al,-0x7(%ebp)
  100da3:	66 c7 45 f6 84 00    	movw   $0x84,-0xa(%ebp)
  100da9:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100dad:	89 c2                	mov    %eax,%edx
  100daf:	ec                   	in     (%dx),%al
  100db0:	88 45 f5             	mov    %al,-0xb(%ebp)
  100db3:	66 c7 45 f2 84 00    	movw   $0x84,-0xe(%ebp)
  100db9:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100dbd:	89 c2                	mov    %eax,%edx
  100dbf:	ec                   	in     (%dx),%al
  100dc0:	88 45 f1             	mov    %al,-0xf(%ebp)
    inb(0x84);
    inb(0x84);
    inb(0x84);
    inb(0x84);
}
  100dc3:	c9                   	leave  
  100dc4:	c3                   	ret    

00100dc5 <cga_init>:
static uint16_t addr_6845;

/* TEXT-mode CGA/VGA display output */

static void
cga_init(void) {
  100dc5:	55                   	push   %ebp
  100dc6:	89 e5                	mov    %esp,%ebp
  100dc8:	83 ec 20             	sub    $0x20,%esp
    volatile uint16_t *cp = (uint16_t *)CGA_BUF;
  100dcb:	c7 45 fc 00 80 0b 00 	movl   $0xb8000,-0x4(%ebp)
    uint16_t was = *cp;
  100dd2:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100dd5:	0f b7 00             	movzwl (%eax),%eax
  100dd8:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
    *cp = (uint16_t) 0xA55A;
  100ddc:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100ddf:	66 c7 00 5a a5       	movw   $0xa55a,(%eax)
    if (*cp != 0xA55A) {
  100de4:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100de7:	0f b7 00             	movzwl (%eax),%eax
  100dea:	66 3d 5a a5          	cmp    $0xa55a,%ax
  100dee:	74 12                	je     100e02 <cga_init+0x3d>
        cp = (uint16_t*)MONO_BUF;
  100df0:	c7 45 fc 00 00 0b 00 	movl   $0xb0000,-0x4(%ebp)
        addr_6845 = MONO_BASE;
  100df7:	66 c7 05 66 ee 10 00 	movw   $0x3b4,0x10ee66
  100dfe:	b4 03 
  100e00:	eb 13                	jmp    100e15 <cga_init+0x50>
    } else {
        *cp = was;
  100e02:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e05:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  100e09:	66 89 10             	mov    %dx,(%eax)
        addr_6845 = CGA_BASE;
  100e0c:	66 c7 05 66 ee 10 00 	movw   $0x3d4,0x10ee66
  100e13:	d4 03 
    }

    // Extract cursor location
    uint32_t pos;
    outb(addr_6845, 14);
  100e15:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e1c:	0f b7 c0             	movzwl %ax,%eax
  100e1f:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
  100e23:	c6 45 f1 0e          	movb   $0xe,-0xf(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100e27:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100e2b:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100e2f:	ee                   	out    %al,(%dx)
    pos = inb(addr_6845 + 1) << 8;
  100e30:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e37:	83 c0 01             	add    $0x1,%eax
  100e3a:	0f b7 c0             	movzwl %ax,%eax
  100e3d:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100e41:	0f b7 45 ee          	movzwl -0x12(%ebp),%eax
  100e45:	89 c2                	mov    %eax,%edx
  100e47:	ec                   	in     (%dx),%al
  100e48:	88 45 ed             	mov    %al,-0x13(%ebp)
    return data;
  100e4b:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100e4f:	0f b6 c0             	movzbl %al,%eax
  100e52:	c1 e0 08             	shl    $0x8,%eax
  100e55:	89 45 f4             	mov    %eax,-0xc(%ebp)
    outb(addr_6845, 15);
  100e58:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e5f:	0f b7 c0             	movzwl %ax,%eax
  100e62:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
  100e66:	c6 45 e9 0f          	movb   $0xf,-0x17(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100e6a:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100e6e:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100e72:	ee                   	out    %al,(%dx)
    pos |= inb(addr_6845 + 1);
  100e73:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e7a:	83 c0 01             	add    $0x1,%eax
  100e7d:	0f b7 c0             	movzwl %ax,%eax
  100e80:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100e84:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
  100e88:	89 c2                	mov    %eax,%edx
  100e8a:	ec                   	in     (%dx),%al
  100e8b:	88 45 e5             	mov    %al,-0x1b(%ebp)
    return data;
  100e8e:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100e92:	0f b6 c0             	movzbl %al,%eax
  100e95:	09 45 f4             	or     %eax,-0xc(%ebp)

    crt_buf = (uint16_t*) cp;
  100e98:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e9b:	a3 60 ee 10 00       	mov    %eax,0x10ee60
    crt_pos = pos;
  100ea0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ea3:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
}
  100ea9:	c9                   	leave  
  100eaa:	c3                   	ret    

00100eab <serial_init>:

static bool serial_exists = 0;

static void
serial_init(void) {
  100eab:	55                   	push   %ebp
  100eac:	89 e5                	mov    %esp,%ebp
  100eae:	83 ec 48             	sub    $0x48,%esp
  100eb1:	66 c7 45 f6 fa 03    	movw   $0x3fa,-0xa(%ebp)
  100eb7:	c6 45 f5 00          	movb   $0x0,-0xb(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100ebb:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100ebf:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100ec3:	ee                   	out    %al,(%dx)
  100ec4:	66 c7 45 f2 fb 03    	movw   $0x3fb,-0xe(%ebp)
  100eca:	c6 45 f1 80          	movb   $0x80,-0xf(%ebp)
  100ece:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100ed2:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100ed6:	ee                   	out    %al,(%dx)
  100ed7:	66 c7 45 ee f8 03    	movw   $0x3f8,-0x12(%ebp)
  100edd:	c6 45 ed 0c          	movb   $0xc,-0x13(%ebp)
  100ee1:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100ee5:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100ee9:	ee                   	out    %al,(%dx)
  100eea:	66 c7 45 ea f9 03    	movw   $0x3f9,-0x16(%ebp)
  100ef0:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
  100ef4:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100ef8:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100efc:	ee                   	out    %al,(%dx)
  100efd:	66 c7 45 e6 fb 03    	movw   $0x3fb,-0x1a(%ebp)
  100f03:	c6 45 e5 03          	movb   $0x3,-0x1b(%ebp)
  100f07:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100f0b:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100f0f:	ee                   	out    %al,(%dx)
  100f10:	66 c7 45 e2 fc 03    	movw   $0x3fc,-0x1e(%ebp)
  100f16:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
  100f1a:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  100f1e:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  100f22:	ee                   	out    %al,(%dx)
  100f23:	66 c7 45 de f9 03    	movw   $0x3f9,-0x22(%ebp)
  100f29:	c6 45 dd 01          	movb   $0x1,-0x23(%ebp)
  100f2d:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  100f31:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  100f35:	ee                   	out    %al,(%dx)
  100f36:	66 c7 45 da fd 03    	movw   $0x3fd,-0x26(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100f3c:	0f b7 45 da          	movzwl -0x26(%ebp),%eax
  100f40:	89 c2                	mov    %eax,%edx
  100f42:	ec                   	in     (%dx),%al
  100f43:	88 45 d9             	mov    %al,-0x27(%ebp)
    return data;
  100f46:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
    // Enable rcv interrupts
    outb(COM1 + COM_IER, COM_IER_RDI);

    // Clear any preexisting overrun indications and interrupts
    // Serial port doesn't exist if COM_LSR returns 0xFF
    serial_exists = (inb(COM1 + COM_LSR) != 0xFF);
  100f4a:	3c ff                	cmp    $0xff,%al
  100f4c:	0f 95 c0             	setne  %al
  100f4f:	0f b6 c0             	movzbl %al,%eax
  100f52:	a3 68 ee 10 00       	mov    %eax,0x10ee68
  100f57:	66 c7 45 d6 fa 03    	movw   $0x3fa,-0x2a(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100f5d:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
  100f61:	89 c2                	mov    %eax,%edx
  100f63:	ec                   	in     (%dx),%al
  100f64:	88 45 d5             	mov    %al,-0x2b(%ebp)
  100f67:	66 c7 45 d2 f8 03    	movw   $0x3f8,-0x2e(%ebp)
  100f6d:	0f b7 45 d2          	movzwl -0x2e(%ebp),%eax
  100f71:	89 c2                	mov    %eax,%edx
  100f73:	ec                   	in     (%dx),%al
  100f74:	88 45 d1             	mov    %al,-0x2f(%ebp)
    (void) inb(COM1+COM_IIR);
    (void) inb(COM1+COM_RX);

    if (serial_exists) {
  100f77:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  100f7c:	85 c0                	test   %eax,%eax
  100f7e:	74 0c                	je     100f8c <serial_init+0xe1>
        pic_enable(IRQ_COM1);
  100f80:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  100f87:	e8 b0 06 00 00       	call   10163c <pic_enable>
    }
}
  100f8c:	c9                   	leave  
  100f8d:	c3                   	ret    

00100f8e <lpt_putc_sub>:

static void
lpt_putc_sub(int c) {
  100f8e:	55                   	push   %ebp
  100f8f:	89 e5                	mov    %esp,%ebp
  100f91:	83 ec 20             	sub    $0x20,%esp
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100f94:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  100f9b:	eb 09                	jmp    100fa6 <lpt_putc_sub+0x18>
        delay();
  100f9d:	e8 db fd ff ff       	call   100d7d <delay>
}

static void
lpt_putc_sub(int c) {
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100fa2:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  100fa6:	66 c7 45 fa 79 03    	movw   $0x379,-0x6(%ebp)
  100fac:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100fb0:	89 c2                	mov    %eax,%edx
  100fb2:	ec                   	in     (%dx),%al
  100fb3:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  100fb6:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  100fba:	84 c0                	test   %al,%al
  100fbc:	78 09                	js     100fc7 <lpt_putc_sub+0x39>
  100fbe:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  100fc5:	7e d6                	jle    100f9d <lpt_putc_sub+0xf>
        delay();
    }
    outb(LPTPORT + 0, c);
  100fc7:	8b 45 08             	mov    0x8(%ebp),%eax
  100fca:	0f b6 c0             	movzbl %al,%eax
  100fcd:	66 c7 45 f6 78 03    	movw   $0x378,-0xa(%ebp)
  100fd3:	88 45 f5             	mov    %al,-0xb(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100fd6:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100fda:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100fde:	ee                   	out    %al,(%dx)
  100fdf:	66 c7 45 f2 7a 03    	movw   $0x37a,-0xe(%ebp)
  100fe5:	c6 45 f1 0d          	movb   $0xd,-0xf(%ebp)
  100fe9:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100fed:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100ff1:	ee                   	out    %al,(%dx)
  100ff2:	66 c7 45 ee 7a 03    	movw   $0x37a,-0x12(%ebp)
  100ff8:	c6 45 ed 08          	movb   $0x8,-0x13(%ebp)
  100ffc:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  101000:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101004:	ee                   	out    %al,(%dx)
    outb(LPTPORT + 2, 0x08 | 0x04 | 0x01);
    outb(LPTPORT + 2, 0x08);
}
  101005:	c9                   	leave  
  101006:	c3                   	ret    

00101007 <lpt_putc>:

/* lpt_putc - copy console output to parallel port */
static void
lpt_putc(int c) {
  101007:	55                   	push   %ebp
  101008:	89 e5                	mov    %esp,%ebp
  10100a:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  10100d:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  101011:	74 0d                	je     101020 <lpt_putc+0x19>
        lpt_putc_sub(c);
  101013:	8b 45 08             	mov    0x8(%ebp),%eax
  101016:	89 04 24             	mov    %eax,(%esp)
  101019:	e8 70 ff ff ff       	call   100f8e <lpt_putc_sub>
  10101e:	eb 24                	jmp    101044 <lpt_putc+0x3d>
    }
    else {
        lpt_putc_sub('\b');
  101020:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101027:	e8 62 ff ff ff       	call   100f8e <lpt_putc_sub>
        lpt_putc_sub(' ');
  10102c:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  101033:	e8 56 ff ff ff       	call   100f8e <lpt_putc_sub>
        lpt_putc_sub('\b');
  101038:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  10103f:	e8 4a ff ff ff       	call   100f8e <lpt_putc_sub>
    }
}
  101044:	c9                   	leave  
  101045:	c3                   	ret    

00101046 <cga_putc>:

/* cga_putc - print character to console */
static void
cga_putc(int c) {
  101046:	55                   	push   %ebp
  101047:	89 e5                	mov    %esp,%ebp
  101049:	53                   	push   %ebx
  10104a:	83 ec 34             	sub    $0x34,%esp
    // set black on white
    if (!(c & ~0xFF)) {
  10104d:	8b 45 08             	mov    0x8(%ebp),%eax
  101050:	b0 00                	mov    $0x0,%al
  101052:	85 c0                	test   %eax,%eax
  101054:	75 07                	jne    10105d <cga_putc+0x17>
        c |= 0x0700;
  101056:	81 4d 08 00 07 00 00 	orl    $0x700,0x8(%ebp)
    }

    switch (c & 0xff) {
  10105d:	8b 45 08             	mov    0x8(%ebp),%eax
  101060:	0f b6 c0             	movzbl %al,%eax
  101063:	83 f8 0a             	cmp    $0xa,%eax
  101066:	74 4c                	je     1010b4 <cga_putc+0x6e>
  101068:	83 f8 0d             	cmp    $0xd,%eax
  10106b:	74 57                	je     1010c4 <cga_putc+0x7e>
  10106d:	83 f8 08             	cmp    $0x8,%eax
  101070:	0f 85 88 00 00 00    	jne    1010fe <cga_putc+0xb8>
    case '\b':
        if (crt_pos > 0) {
  101076:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  10107d:	66 85 c0             	test   %ax,%ax
  101080:	74 30                	je     1010b2 <cga_putc+0x6c>
            crt_pos --;
  101082:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101089:	83 e8 01             	sub    $0x1,%eax
  10108c:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
  101092:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  101097:	0f b7 15 64 ee 10 00 	movzwl 0x10ee64,%edx
  10109e:	0f b7 d2             	movzwl %dx,%edx
  1010a1:	01 d2                	add    %edx,%edx
  1010a3:	01 c2                	add    %eax,%edx
  1010a5:	8b 45 08             	mov    0x8(%ebp),%eax
  1010a8:	b0 00                	mov    $0x0,%al
  1010aa:	83 c8 20             	or     $0x20,%eax
  1010ad:	66 89 02             	mov    %ax,(%edx)
        }
        break;
  1010b0:	eb 72                	jmp    101124 <cga_putc+0xde>
  1010b2:	eb 70                	jmp    101124 <cga_putc+0xde>
    case '\n':
        crt_pos += CRT_COLS;
  1010b4:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1010bb:	83 c0 50             	add    $0x50,%eax
  1010be:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
    case '\r':
        crt_pos -= (crt_pos % CRT_COLS);
  1010c4:	0f b7 1d 64 ee 10 00 	movzwl 0x10ee64,%ebx
  1010cb:	0f b7 0d 64 ee 10 00 	movzwl 0x10ee64,%ecx
  1010d2:	0f b7 c1             	movzwl %cx,%eax
  1010d5:	69 c0 cd cc 00 00    	imul   $0xcccd,%eax,%eax
  1010db:	c1 e8 10             	shr    $0x10,%eax
  1010de:	89 c2                	mov    %eax,%edx
  1010e0:	66 c1 ea 06          	shr    $0x6,%dx
  1010e4:	89 d0                	mov    %edx,%eax
  1010e6:	c1 e0 02             	shl    $0x2,%eax
  1010e9:	01 d0                	add    %edx,%eax
  1010eb:	c1 e0 04             	shl    $0x4,%eax
  1010ee:	29 c1                	sub    %eax,%ecx
  1010f0:	89 ca                	mov    %ecx,%edx
  1010f2:	89 d8                	mov    %ebx,%eax
  1010f4:	29 d0                	sub    %edx,%eax
  1010f6:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
        break;
  1010fc:	eb 26                	jmp    101124 <cga_putc+0xde>
    default:
        crt_buf[crt_pos ++] = c;     // write the character
  1010fe:	8b 0d 60 ee 10 00    	mov    0x10ee60,%ecx
  101104:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  10110b:	8d 50 01             	lea    0x1(%eax),%edx
  10110e:	66 89 15 64 ee 10 00 	mov    %dx,0x10ee64
  101115:	0f b7 c0             	movzwl %ax,%eax
  101118:	01 c0                	add    %eax,%eax
  10111a:	8d 14 01             	lea    (%ecx,%eax,1),%edx
  10111d:	8b 45 08             	mov    0x8(%ebp),%eax
  101120:	66 89 02             	mov    %ax,(%edx)
        break;
  101123:	90                   	nop
    }

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
  101124:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  10112b:	66 3d cf 07          	cmp    $0x7cf,%ax
  10112f:	76 5b                	jbe    10118c <cga_putc+0x146>
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
  101131:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  101136:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  10113c:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  101141:	c7 44 24 08 00 0f 00 	movl   $0xf00,0x8(%esp)
  101148:	00 
  101149:	89 54 24 04          	mov    %edx,0x4(%esp)
  10114d:	89 04 24             	mov    %eax,(%esp)
  101150:	e8 e6 1f 00 00       	call   10313b <memmove>
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  101155:	c7 45 f4 80 07 00 00 	movl   $0x780,-0xc(%ebp)
  10115c:	eb 15                	jmp    101173 <cga_putc+0x12d>
            crt_buf[i] = 0x0700 | ' ';
  10115e:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  101163:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101166:	01 d2                	add    %edx,%edx
  101168:	01 d0                	add    %edx,%eax
  10116a:	66 c7 00 20 07       	movw   $0x720,(%eax)

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  10116f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  101173:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
  10117a:	7e e2                	jle    10115e <cga_putc+0x118>
            crt_buf[i] = 0x0700 | ' ';
        }
        crt_pos -= CRT_COLS;
  10117c:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101183:	83 e8 50             	sub    $0x50,%eax
  101186:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
    }

    // move that little blinky thing
    outb(addr_6845, 14);
  10118c:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  101193:	0f b7 c0             	movzwl %ax,%eax
  101196:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
  10119a:	c6 45 f1 0e          	movb   $0xe,-0xf(%ebp)
  10119e:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  1011a2:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  1011a6:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos >> 8);
  1011a7:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1011ae:	66 c1 e8 08          	shr    $0x8,%ax
  1011b2:	0f b6 c0             	movzbl %al,%eax
  1011b5:	0f b7 15 66 ee 10 00 	movzwl 0x10ee66,%edx
  1011bc:	83 c2 01             	add    $0x1,%edx
  1011bf:	0f b7 d2             	movzwl %dx,%edx
  1011c2:	66 89 55 ee          	mov    %dx,-0x12(%ebp)
  1011c6:	88 45 ed             	mov    %al,-0x13(%ebp)
  1011c9:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  1011cd:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  1011d1:	ee                   	out    %al,(%dx)
    outb(addr_6845, 15);
  1011d2:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  1011d9:	0f b7 c0             	movzwl %ax,%eax
  1011dc:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
  1011e0:	c6 45 e9 0f          	movb   $0xf,-0x17(%ebp)
  1011e4:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  1011e8:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  1011ec:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos);
  1011ed:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1011f4:	0f b6 c0             	movzbl %al,%eax
  1011f7:	0f b7 15 66 ee 10 00 	movzwl 0x10ee66,%edx
  1011fe:	83 c2 01             	add    $0x1,%edx
  101201:	0f b7 d2             	movzwl %dx,%edx
  101204:	66 89 55 e6          	mov    %dx,-0x1a(%ebp)
  101208:	88 45 e5             	mov    %al,-0x1b(%ebp)
  10120b:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  10120f:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  101213:	ee                   	out    %al,(%dx)
}
  101214:	83 c4 34             	add    $0x34,%esp
  101217:	5b                   	pop    %ebx
  101218:	5d                   	pop    %ebp
  101219:	c3                   	ret    

0010121a <serial_putc_sub>:

static void
serial_putc_sub(int c) {
  10121a:	55                   	push   %ebp
  10121b:	89 e5                	mov    %esp,%ebp
  10121d:	83 ec 10             	sub    $0x10,%esp
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  101220:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101227:	eb 09                	jmp    101232 <serial_putc_sub+0x18>
        delay();
  101229:	e8 4f fb ff ff       	call   100d7d <delay>
}

static void
serial_putc_sub(int c) {
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  10122e:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  101232:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101238:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  10123c:	89 c2                	mov    %eax,%edx
  10123e:	ec                   	in     (%dx),%al
  10123f:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  101242:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  101246:	0f b6 c0             	movzbl %al,%eax
  101249:	83 e0 20             	and    $0x20,%eax
  10124c:	85 c0                	test   %eax,%eax
  10124e:	75 09                	jne    101259 <serial_putc_sub+0x3f>
  101250:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  101257:	7e d0                	jle    101229 <serial_putc_sub+0xf>
        delay();
    }
    outb(COM1 + COM_TX, c);
  101259:	8b 45 08             	mov    0x8(%ebp),%eax
  10125c:	0f b6 c0             	movzbl %al,%eax
  10125f:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  101265:	88 45 f5             	mov    %al,-0xb(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101268:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  10126c:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  101270:	ee                   	out    %al,(%dx)
}
  101271:	c9                   	leave  
  101272:	c3                   	ret    

00101273 <serial_putc>:

/* serial_putc - print character to serial port */
static void
serial_putc(int c) {
  101273:	55                   	push   %ebp
  101274:	89 e5                	mov    %esp,%ebp
  101276:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  101279:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  10127d:	74 0d                	je     10128c <serial_putc+0x19>
        serial_putc_sub(c);
  10127f:	8b 45 08             	mov    0x8(%ebp),%eax
  101282:	89 04 24             	mov    %eax,(%esp)
  101285:	e8 90 ff ff ff       	call   10121a <serial_putc_sub>
  10128a:	eb 24                	jmp    1012b0 <serial_putc+0x3d>
    }
    else {
        serial_putc_sub('\b');
  10128c:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101293:	e8 82 ff ff ff       	call   10121a <serial_putc_sub>
        serial_putc_sub(' ');
  101298:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  10129f:	e8 76 ff ff ff       	call   10121a <serial_putc_sub>
        serial_putc_sub('\b');
  1012a4:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  1012ab:	e8 6a ff ff ff       	call   10121a <serial_putc_sub>
    }
}
  1012b0:	c9                   	leave  
  1012b1:	c3                   	ret    

001012b2 <cons_intr>:
/* *
 * cons_intr - called by device interrupt routines to feed input
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
  1012b2:	55                   	push   %ebp
  1012b3:	89 e5                	mov    %esp,%ebp
  1012b5:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = (*proc)()) != -1) {
  1012b8:	eb 33                	jmp    1012ed <cons_intr+0x3b>
        if (c != 0) {
  1012ba:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1012be:	74 2d                	je     1012ed <cons_intr+0x3b>
            cons.buf[cons.wpos ++] = c;
  1012c0:	a1 84 f0 10 00       	mov    0x10f084,%eax
  1012c5:	8d 50 01             	lea    0x1(%eax),%edx
  1012c8:	89 15 84 f0 10 00    	mov    %edx,0x10f084
  1012ce:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1012d1:	88 90 80 ee 10 00    	mov    %dl,0x10ee80(%eax)
            if (cons.wpos == CONSBUFSIZE) {
  1012d7:	a1 84 f0 10 00       	mov    0x10f084,%eax
  1012dc:	3d 00 02 00 00       	cmp    $0x200,%eax
  1012e1:	75 0a                	jne    1012ed <cons_intr+0x3b>
                cons.wpos = 0;
  1012e3:	c7 05 84 f0 10 00 00 	movl   $0x0,0x10f084
  1012ea:	00 00 00 
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
    int c;
    while ((c = (*proc)()) != -1) {
  1012ed:	8b 45 08             	mov    0x8(%ebp),%eax
  1012f0:	ff d0                	call   *%eax
  1012f2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1012f5:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
  1012f9:	75 bf                	jne    1012ba <cons_intr+0x8>
            if (cons.wpos == CONSBUFSIZE) {
                cons.wpos = 0;
            }
        }
    }
}
  1012fb:	c9                   	leave  
  1012fc:	c3                   	ret    

001012fd <serial_proc_data>:

/* serial_proc_data - get data from serial port */
static int
serial_proc_data(void) {
  1012fd:	55                   	push   %ebp
  1012fe:	89 e5                	mov    %esp,%ebp
  101300:	83 ec 10             	sub    $0x10,%esp
  101303:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101309:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  10130d:	89 c2                	mov    %eax,%edx
  10130f:	ec                   	in     (%dx),%al
  101310:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  101313:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
    if (!(inb(COM1 + COM_LSR) & COM_LSR_DATA)) {
  101317:	0f b6 c0             	movzbl %al,%eax
  10131a:	83 e0 01             	and    $0x1,%eax
  10131d:	85 c0                	test   %eax,%eax
  10131f:	75 07                	jne    101328 <serial_proc_data+0x2b>
        return -1;
  101321:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101326:	eb 2a                	jmp    101352 <serial_proc_data+0x55>
  101328:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10132e:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  101332:	89 c2                	mov    %eax,%edx
  101334:	ec                   	in     (%dx),%al
  101335:	88 45 f5             	mov    %al,-0xb(%ebp)
    return data;
  101338:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
    }
    int c = inb(COM1 + COM_RX);
  10133c:	0f b6 c0             	movzbl %al,%eax
  10133f:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if (c == 127) {
  101342:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%ebp)
  101346:	75 07                	jne    10134f <serial_proc_data+0x52>
        c = '\b';
  101348:	c7 45 fc 08 00 00 00 	movl   $0x8,-0x4(%ebp)
    }
    return c;
  10134f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  101352:	c9                   	leave  
  101353:	c3                   	ret    

00101354 <serial_intr>:

/* serial_intr - try to feed input characters from serial port */
void
serial_intr(void) {
  101354:	55                   	push   %ebp
  101355:	89 e5                	mov    %esp,%ebp
  101357:	83 ec 18             	sub    $0x18,%esp
    if (serial_exists) {
  10135a:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  10135f:	85 c0                	test   %eax,%eax
  101361:	74 0c                	je     10136f <serial_intr+0x1b>
        cons_intr(serial_proc_data);
  101363:	c7 04 24 fd 12 10 00 	movl   $0x1012fd,(%esp)
  10136a:	e8 43 ff ff ff       	call   1012b2 <cons_intr>
    }
}
  10136f:	c9                   	leave  
  101370:	c3                   	ret    

00101371 <kbd_proc_data>:
 *
 * The kbd_proc_data() function gets data from the keyboard.
 * If we finish a character, return it, else 0. And return -1 if no data.
 * */
static int
kbd_proc_data(void) {
  101371:	55                   	push   %ebp
  101372:	89 e5                	mov    %esp,%ebp
  101374:	83 ec 38             	sub    $0x38,%esp
  101377:	66 c7 45 f0 64 00    	movw   $0x64,-0x10(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10137d:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  101381:	89 c2                	mov    %eax,%edx
  101383:	ec                   	in     (%dx),%al
  101384:	88 45 ef             	mov    %al,-0x11(%ebp)
    return data;
  101387:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    int c;
    uint8_t data;
    static uint32_t shift;

    if ((inb(KBSTATP) & KBS_DIB) == 0) {
  10138b:	0f b6 c0             	movzbl %al,%eax
  10138e:	83 e0 01             	and    $0x1,%eax
  101391:	85 c0                	test   %eax,%eax
  101393:	75 0a                	jne    10139f <kbd_proc_data+0x2e>
        return -1;
  101395:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10139a:	e9 59 01 00 00       	jmp    1014f8 <kbd_proc_data+0x187>
  10139f:	66 c7 45 ec 60 00    	movw   $0x60,-0x14(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1013a5:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  1013a9:	89 c2                	mov    %eax,%edx
  1013ab:	ec                   	in     (%dx),%al
  1013ac:	88 45 eb             	mov    %al,-0x15(%ebp)
    return data;
  1013af:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
    }

    data = inb(KBDATAP);
  1013b3:	88 45 f3             	mov    %al,-0xd(%ebp)

    if (data == 0xE0) {
  1013b6:	80 7d f3 e0          	cmpb   $0xe0,-0xd(%ebp)
  1013ba:	75 17                	jne    1013d3 <kbd_proc_data+0x62>
        // E0 escape character
        shift |= E0ESC;
  1013bc:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1013c1:	83 c8 40             	or     $0x40,%eax
  1013c4:	a3 88 f0 10 00       	mov    %eax,0x10f088
        return 0;
  1013c9:	b8 00 00 00 00       	mov    $0x0,%eax
  1013ce:	e9 25 01 00 00       	jmp    1014f8 <kbd_proc_data+0x187>
    } else if (data & 0x80) {
  1013d3:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1013d7:	84 c0                	test   %al,%al
  1013d9:	79 47                	jns    101422 <kbd_proc_data+0xb1>
        // Key released
        data = (shift & E0ESC ? data : data & 0x7F);
  1013db:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1013e0:	83 e0 40             	and    $0x40,%eax
  1013e3:	85 c0                	test   %eax,%eax
  1013e5:	75 09                	jne    1013f0 <kbd_proc_data+0x7f>
  1013e7:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1013eb:	83 e0 7f             	and    $0x7f,%eax
  1013ee:	eb 04                	jmp    1013f4 <kbd_proc_data+0x83>
  1013f0:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1013f4:	88 45 f3             	mov    %al,-0xd(%ebp)
        shift &= ~(shiftcode[data] | E0ESC);
  1013f7:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1013fb:	0f b6 80 40 e0 10 00 	movzbl 0x10e040(%eax),%eax
  101402:	83 c8 40             	or     $0x40,%eax
  101405:	0f b6 c0             	movzbl %al,%eax
  101408:	f7 d0                	not    %eax
  10140a:	89 c2                	mov    %eax,%edx
  10140c:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101411:	21 d0                	and    %edx,%eax
  101413:	a3 88 f0 10 00       	mov    %eax,0x10f088
        return 0;
  101418:	b8 00 00 00 00       	mov    $0x0,%eax
  10141d:	e9 d6 00 00 00       	jmp    1014f8 <kbd_proc_data+0x187>
    } else if (shift & E0ESC) {
  101422:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101427:	83 e0 40             	and    $0x40,%eax
  10142a:	85 c0                	test   %eax,%eax
  10142c:	74 11                	je     10143f <kbd_proc_data+0xce>
        // Last character was an E0 escape; or with 0x80
        data |= 0x80;
  10142e:	80 4d f3 80          	orb    $0x80,-0xd(%ebp)
        shift &= ~E0ESC;
  101432:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101437:	83 e0 bf             	and    $0xffffffbf,%eax
  10143a:	a3 88 f0 10 00       	mov    %eax,0x10f088
    }

    shift |= shiftcode[data];
  10143f:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101443:	0f b6 80 40 e0 10 00 	movzbl 0x10e040(%eax),%eax
  10144a:	0f b6 d0             	movzbl %al,%edx
  10144d:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101452:	09 d0                	or     %edx,%eax
  101454:	a3 88 f0 10 00       	mov    %eax,0x10f088
    shift ^= togglecode[data];
  101459:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10145d:	0f b6 80 40 e1 10 00 	movzbl 0x10e140(%eax),%eax
  101464:	0f b6 d0             	movzbl %al,%edx
  101467:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10146c:	31 d0                	xor    %edx,%eax
  10146e:	a3 88 f0 10 00       	mov    %eax,0x10f088

    c = charcode[shift & (CTL | SHIFT)][data];
  101473:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101478:	83 e0 03             	and    $0x3,%eax
  10147b:	8b 14 85 40 e5 10 00 	mov    0x10e540(,%eax,4),%edx
  101482:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101486:	01 d0                	add    %edx,%eax
  101488:	0f b6 00             	movzbl (%eax),%eax
  10148b:	0f b6 c0             	movzbl %al,%eax
  10148e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if (shift & CAPSLOCK) {
  101491:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101496:	83 e0 08             	and    $0x8,%eax
  101499:	85 c0                	test   %eax,%eax
  10149b:	74 22                	je     1014bf <kbd_proc_data+0x14e>
        if ('a' <= c && c <= 'z')
  10149d:	83 7d f4 60          	cmpl   $0x60,-0xc(%ebp)
  1014a1:	7e 0c                	jle    1014af <kbd_proc_data+0x13e>
  1014a3:	83 7d f4 7a          	cmpl   $0x7a,-0xc(%ebp)
  1014a7:	7f 06                	jg     1014af <kbd_proc_data+0x13e>
            c += 'A' - 'a';
  1014a9:	83 6d f4 20          	subl   $0x20,-0xc(%ebp)
  1014ad:	eb 10                	jmp    1014bf <kbd_proc_data+0x14e>
        else if ('A' <= c && c <= 'Z')
  1014af:	83 7d f4 40          	cmpl   $0x40,-0xc(%ebp)
  1014b3:	7e 0a                	jle    1014bf <kbd_proc_data+0x14e>
  1014b5:	83 7d f4 5a          	cmpl   $0x5a,-0xc(%ebp)
  1014b9:	7f 04                	jg     1014bf <kbd_proc_data+0x14e>
            c += 'a' - 'A';
  1014bb:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
    }

    // Process special keys
    // Ctrl-Alt-Del: reboot
    if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
  1014bf:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014c4:	f7 d0                	not    %eax
  1014c6:	83 e0 06             	and    $0x6,%eax
  1014c9:	85 c0                	test   %eax,%eax
  1014cb:	75 28                	jne    1014f5 <kbd_proc_data+0x184>
  1014cd:	81 7d f4 e9 00 00 00 	cmpl   $0xe9,-0xc(%ebp)
  1014d4:	75 1f                	jne    1014f5 <kbd_proc_data+0x184>
        cprintf("Rebooting!\n");
  1014d6:	c7 04 24 b5 35 10 00 	movl   $0x1035b5,(%esp)
  1014dd:	e8 17 ee ff ff       	call   1002f9 <cprintf>
  1014e2:	66 c7 45 e8 92 00    	movw   $0x92,-0x18(%ebp)
  1014e8:	c6 45 e7 03          	movb   $0x3,-0x19(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1014ec:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  1014f0:	0f b7 55 e8          	movzwl -0x18(%ebp),%edx
  1014f4:	ee                   	out    %al,(%dx)
        outb(0x92, 0x3); // courtesy of Chris Frost
    }
    return c;
  1014f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1014f8:	c9                   	leave  
  1014f9:	c3                   	ret    

001014fa <kbd_intr>:

/* kbd_intr - try to feed input characters from keyboard */
static void
kbd_intr(void) {
  1014fa:	55                   	push   %ebp
  1014fb:	89 e5                	mov    %esp,%ebp
  1014fd:	83 ec 18             	sub    $0x18,%esp
    cons_intr(kbd_proc_data);
  101500:	c7 04 24 71 13 10 00 	movl   $0x101371,(%esp)
  101507:	e8 a6 fd ff ff       	call   1012b2 <cons_intr>
}
  10150c:	c9                   	leave  
  10150d:	c3                   	ret    

0010150e <kbd_init>:

static void
kbd_init(void) {
  10150e:	55                   	push   %ebp
  10150f:	89 e5                	mov    %esp,%ebp
  101511:	83 ec 18             	sub    $0x18,%esp
    // drain the kbd buffer
    kbd_intr();
  101514:	e8 e1 ff ff ff       	call   1014fa <kbd_intr>
    pic_enable(IRQ_KBD);
  101519:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  101520:	e8 17 01 00 00       	call   10163c <pic_enable>
}
  101525:	c9                   	leave  
  101526:	c3                   	ret    

00101527 <cons_init>:

/* cons_init - initializes the console devices */
void
cons_init(void) {
  101527:	55                   	push   %ebp
  101528:	89 e5                	mov    %esp,%ebp
  10152a:	83 ec 18             	sub    $0x18,%esp
    cga_init();
  10152d:	e8 93 f8 ff ff       	call   100dc5 <cga_init>
    serial_init();
  101532:	e8 74 f9 ff ff       	call   100eab <serial_init>
    kbd_init();
  101537:	e8 d2 ff ff ff       	call   10150e <kbd_init>
    if (!serial_exists) {
  10153c:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  101541:	85 c0                	test   %eax,%eax
  101543:	75 0c                	jne    101551 <cons_init+0x2a>
        cprintf("serial port does not exist!!\n");
  101545:	c7 04 24 c1 35 10 00 	movl   $0x1035c1,(%esp)
  10154c:	e8 a8 ed ff ff       	call   1002f9 <cprintf>
    }
}
  101551:	c9                   	leave  
  101552:	c3                   	ret    

00101553 <cons_putc>:

/* cons_putc - print a single character @c to console devices */
void
cons_putc(int c) {
  101553:	55                   	push   %ebp
  101554:	89 e5                	mov    %esp,%ebp
  101556:	83 ec 18             	sub    $0x18,%esp
    lpt_putc(c);
  101559:	8b 45 08             	mov    0x8(%ebp),%eax
  10155c:	89 04 24             	mov    %eax,(%esp)
  10155f:	e8 a3 fa ff ff       	call   101007 <lpt_putc>
    cga_putc(c);
  101564:	8b 45 08             	mov    0x8(%ebp),%eax
  101567:	89 04 24             	mov    %eax,(%esp)
  10156a:	e8 d7 fa ff ff       	call   101046 <cga_putc>
    serial_putc(c);
  10156f:	8b 45 08             	mov    0x8(%ebp),%eax
  101572:	89 04 24             	mov    %eax,(%esp)
  101575:	e8 f9 fc ff ff       	call   101273 <serial_putc>
}
  10157a:	c9                   	leave  
  10157b:	c3                   	ret    

0010157c <cons_getc>:
/* *
 * cons_getc - return the next input character from console,
 * or 0 if none waiting.
 * */
int
cons_getc(void) {
  10157c:	55                   	push   %ebp
  10157d:	89 e5                	mov    %esp,%ebp
  10157f:	83 ec 18             	sub    $0x18,%esp
    int c;

    // poll for any pending input characters,
    // so that this function works even when interrupts are disabled
    // (e.g., when called from the kernel monitor).
    serial_intr();
  101582:	e8 cd fd ff ff       	call   101354 <serial_intr>
    kbd_intr();
  101587:	e8 6e ff ff ff       	call   1014fa <kbd_intr>

    // grab the next character from the input buffer.
    if (cons.rpos != cons.wpos) {
  10158c:	8b 15 80 f0 10 00    	mov    0x10f080,%edx
  101592:	a1 84 f0 10 00       	mov    0x10f084,%eax
  101597:	39 c2                	cmp    %eax,%edx
  101599:	74 36                	je     1015d1 <cons_getc+0x55>
        c = cons.buf[cons.rpos ++];
  10159b:	a1 80 f0 10 00       	mov    0x10f080,%eax
  1015a0:	8d 50 01             	lea    0x1(%eax),%edx
  1015a3:	89 15 80 f0 10 00    	mov    %edx,0x10f080
  1015a9:	0f b6 80 80 ee 10 00 	movzbl 0x10ee80(%eax),%eax
  1015b0:	0f b6 c0             	movzbl %al,%eax
  1015b3:	89 45 f4             	mov    %eax,-0xc(%ebp)
        if (cons.rpos == CONSBUFSIZE) {
  1015b6:	a1 80 f0 10 00       	mov    0x10f080,%eax
  1015bb:	3d 00 02 00 00       	cmp    $0x200,%eax
  1015c0:	75 0a                	jne    1015cc <cons_getc+0x50>
            cons.rpos = 0;
  1015c2:	c7 05 80 f0 10 00 00 	movl   $0x0,0x10f080
  1015c9:	00 00 00 
        }
        return c;
  1015cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1015cf:	eb 05                	jmp    1015d6 <cons_getc+0x5a>
    }
    return 0;
  1015d1:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1015d6:	c9                   	leave  
  1015d7:	c3                   	ret    

001015d8 <intr_enable>:
#include <x86.h>
#include <intr.h>

/* intr_enable - enable irq interrupt */
void
intr_enable(void) {
  1015d8:	55                   	push   %ebp
  1015d9:	89 e5                	mov    %esp,%ebp
    asm volatile ("lidt (%0)" :: "r" (pd));
}

static inline void
sti(void) {
    asm volatile ("sti");
  1015db:	fb                   	sti    
    sti();
}
  1015dc:	5d                   	pop    %ebp
  1015dd:	c3                   	ret    

001015de <intr_disable>:

/* intr_disable - disable irq interrupt */
void
intr_disable(void) {
  1015de:	55                   	push   %ebp
  1015df:	89 e5                	mov    %esp,%ebp
}

static inline void
cli(void) {
    asm volatile ("cli");
  1015e1:	fa                   	cli    
    cli();
}
  1015e2:	5d                   	pop    %ebp
  1015e3:	c3                   	ret    

001015e4 <pic_setmask>:
// Initial IRQ mask has interrupt 2 enabled (for slave 8259A).
static uint16_t irq_mask = 0xFFFF & ~(1 << IRQ_SLAVE);
static bool did_init = 0;

static void
pic_setmask(uint16_t mask) {
  1015e4:	55                   	push   %ebp
  1015e5:	89 e5                	mov    %esp,%ebp
  1015e7:	83 ec 14             	sub    $0x14,%esp
  1015ea:	8b 45 08             	mov    0x8(%ebp),%eax
  1015ed:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    irq_mask = mask;
  1015f1:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  1015f5:	66 a3 50 e5 10 00    	mov    %ax,0x10e550
    if (did_init) {
  1015fb:	a1 8c f0 10 00       	mov    0x10f08c,%eax
  101600:	85 c0                	test   %eax,%eax
  101602:	74 36                	je     10163a <pic_setmask+0x56>
        outb(IO_PIC1 + 1, mask);
  101604:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101608:	0f b6 c0             	movzbl %al,%eax
  10160b:	66 c7 45 fe 21 00    	movw   $0x21,-0x2(%ebp)
  101611:	88 45 fd             	mov    %al,-0x3(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101614:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  101618:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  10161c:	ee                   	out    %al,(%dx)
        outb(IO_PIC2 + 1, mask >> 8);
  10161d:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101621:	66 c1 e8 08          	shr    $0x8,%ax
  101625:	0f b6 c0             	movzbl %al,%eax
  101628:	66 c7 45 fa a1 00    	movw   $0xa1,-0x6(%ebp)
  10162e:	88 45 f9             	mov    %al,-0x7(%ebp)
  101631:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  101635:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  101639:	ee                   	out    %al,(%dx)
    }
}
  10163a:	c9                   	leave  
  10163b:	c3                   	ret    

0010163c <pic_enable>:

void
pic_enable(unsigned int irq) {
  10163c:	55                   	push   %ebp
  10163d:	89 e5                	mov    %esp,%ebp
  10163f:	83 ec 04             	sub    $0x4,%esp
    pic_setmask(irq_mask & ~(1 << irq));
  101642:	8b 45 08             	mov    0x8(%ebp),%eax
  101645:	ba 01 00 00 00       	mov    $0x1,%edx
  10164a:	89 c1                	mov    %eax,%ecx
  10164c:	d3 e2                	shl    %cl,%edx
  10164e:	89 d0                	mov    %edx,%eax
  101650:	f7 d0                	not    %eax
  101652:	89 c2                	mov    %eax,%edx
  101654:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  10165b:	21 d0                	and    %edx,%eax
  10165d:	0f b7 c0             	movzwl %ax,%eax
  101660:	89 04 24             	mov    %eax,(%esp)
  101663:	e8 7c ff ff ff       	call   1015e4 <pic_setmask>
}
  101668:	c9                   	leave  
  101669:	c3                   	ret    

0010166a <pic_init>:

/* pic_init - initialize the 8259A interrupt controllers */
void
pic_init(void) {
  10166a:	55                   	push   %ebp
  10166b:	89 e5                	mov    %esp,%ebp
  10166d:	83 ec 44             	sub    $0x44,%esp
    did_init = 1;
  101670:	c7 05 8c f0 10 00 01 	movl   $0x1,0x10f08c
  101677:	00 00 00 
  10167a:	66 c7 45 fe 21 00    	movw   $0x21,-0x2(%ebp)
  101680:	c6 45 fd ff          	movb   $0xff,-0x3(%ebp)
  101684:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  101688:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  10168c:	ee                   	out    %al,(%dx)
  10168d:	66 c7 45 fa a1 00    	movw   $0xa1,-0x6(%ebp)
  101693:	c6 45 f9 ff          	movb   $0xff,-0x7(%ebp)
  101697:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  10169b:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  10169f:	ee                   	out    %al,(%dx)
  1016a0:	66 c7 45 f6 20 00    	movw   $0x20,-0xa(%ebp)
  1016a6:	c6 45 f5 11          	movb   $0x11,-0xb(%ebp)
  1016aa:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  1016ae:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  1016b2:	ee                   	out    %al,(%dx)
  1016b3:	66 c7 45 f2 21 00    	movw   $0x21,-0xe(%ebp)
  1016b9:	c6 45 f1 20          	movb   $0x20,-0xf(%ebp)
  1016bd:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  1016c1:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  1016c5:	ee                   	out    %al,(%dx)
  1016c6:	66 c7 45 ee 21 00    	movw   $0x21,-0x12(%ebp)
  1016cc:	c6 45 ed 04          	movb   $0x4,-0x13(%ebp)
  1016d0:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  1016d4:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  1016d8:	ee                   	out    %al,(%dx)
  1016d9:	66 c7 45 ea 21 00    	movw   $0x21,-0x16(%ebp)
  1016df:	c6 45 e9 03          	movb   $0x3,-0x17(%ebp)
  1016e3:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  1016e7:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  1016eb:	ee                   	out    %al,(%dx)
  1016ec:	66 c7 45 e6 a0 00    	movw   $0xa0,-0x1a(%ebp)
  1016f2:	c6 45 e5 11          	movb   $0x11,-0x1b(%ebp)
  1016f6:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  1016fa:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  1016fe:	ee                   	out    %al,(%dx)
  1016ff:	66 c7 45 e2 a1 00    	movw   $0xa1,-0x1e(%ebp)
  101705:	c6 45 e1 28          	movb   $0x28,-0x1f(%ebp)
  101709:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  10170d:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  101711:	ee                   	out    %al,(%dx)
  101712:	66 c7 45 de a1 00    	movw   $0xa1,-0x22(%ebp)
  101718:	c6 45 dd 02          	movb   $0x2,-0x23(%ebp)
  10171c:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  101720:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  101724:	ee                   	out    %al,(%dx)
  101725:	66 c7 45 da a1 00    	movw   $0xa1,-0x26(%ebp)
  10172b:	c6 45 d9 03          	movb   $0x3,-0x27(%ebp)
  10172f:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  101733:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  101737:	ee                   	out    %al,(%dx)
  101738:	66 c7 45 d6 20 00    	movw   $0x20,-0x2a(%ebp)
  10173e:	c6 45 d5 68          	movb   $0x68,-0x2b(%ebp)
  101742:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  101746:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  10174a:	ee                   	out    %al,(%dx)
  10174b:	66 c7 45 d2 20 00    	movw   $0x20,-0x2e(%ebp)
  101751:	c6 45 d1 0a          	movb   $0xa,-0x2f(%ebp)
  101755:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  101759:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  10175d:	ee                   	out    %al,(%dx)
  10175e:	66 c7 45 ce a0 00    	movw   $0xa0,-0x32(%ebp)
  101764:	c6 45 cd 68          	movb   $0x68,-0x33(%ebp)
  101768:	0f b6 45 cd          	movzbl -0x33(%ebp),%eax
  10176c:	0f b7 55 ce          	movzwl -0x32(%ebp),%edx
  101770:	ee                   	out    %al,(%dx)
  101771:	66 c7 45 ca a0 00    	movw   $0xa0,-0x36(%ebp)
  101777:	c6 45 c9 0a          	movb   $0xa,-0x37(%ebp)
  10177b:	0f b6 45 c9          	movzbl -0x37(%ebp),%eax
  10177f:	0f b7 55 ca          	movzwl -0x36(%ebp),%edx
  101783:	ee                   	out    %al,(%dx)
    outb(IO_PIC1, 0x0a);    // read IRR by default

    outb(IO_PIC2, 0x68);    // OCW3
    outb(IO_PIC2, 0x0a);    // OCW3

    if (irq_mask != 0xFFFF) {
  101784:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  10178b:	66 83 f8 ff          	cmp    $0xffff,%ax
  10178f:	74 12                	je     1017a3 <pic_init+0x139>
        pic_setmask(irq_mask);
  101791:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  101798:	0f b7 c0             	movzwl %ax,%eax
  10179b:	89 04 24             	mov    %eax,(%esp)
  10179e:	e8 41 fe ff ff       	call   1015e4 <pic_setmask>
    }
}
  1017a3:	c9                   	leave  
  1017a4:	c3                   	ret    

001017a5 <print_ticks>:
#include <console.h>
#include <kdebug.h>

#define TICK_NUM 100

static void print_ticks() {
  1017a5:	55                   	push   %ebp
  1017a6:	89 e5                	mov    %esp,%ebp
  1017a8:	83 ec 18             	sub    $0x18,%esp
    cprintf("%d ticks\n",TICK_NUM);
  1017ab:	c7 44 24 04 64 00 00 	movl   $0x64,0x4(%esp)
  1017b2:	00 
  1017b3:	c7 04 24 e0 35 10 00 	movl   $0x1035e0,(%esp)
  1017ba:	e8 3a eb ff ff       	call   1002f9 <cprintf>
#ifdef DEBUG_GRADE
    cprintf("End of Test.\n");
    panic("EOT: kernel seems ok.");
#endif
}
  1017bf:	c9                   	leave  
  1017c0:	c3                   	ret    

001017c1 <idt_init>:
    sizeof(idt) - 1, (uintptr_t)idt
};

/* idt_init - initialize IDT to each of the entry points in kern/trap/vectors.S */
void
idt_init(void) {
  1017c1:	55                   	push   %ebp
  1017c2:	89 e5                	mov    %esp,%ebp
      *     Can you see idt[256] in this file? Yes, it's IDT! you can use SETGATE macro to setup each item of IDT
      * (3) After setup the contents of IDT, you will let CPU know where is the IDT by using 'lidt' instruction.
      *     You don't know the meaning of this instruction? just google it! and check the libs/x86.h to know more.
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
}
  1017c4:	5d                   	pop    %ebp
  1017c5:	c3                   	ret    

001017c6 <trapname>:

static const char *
trapname(int trapno) {
  1017c6:	55                   	push   %ebp
  1017c7:	89 e5                	mov    %esp,%ebp
        "Alignment Check",
        "Machine-Check",
        "SIMD Floating-Point Exception"
    };

    if (trapno < sizeof(excnames)/sizeof(const char * const)) {
  1017c9:	8b 45 08             	mov    0x8(%ebp),%eax
  1017cc:	83 f8 13             	cmp    $0x13,%eax
  1017cf:	77 0c                	ja     1017dd <trapname+0x17>
        return excnames[trapno];
  1017d1:	8b 45 08             	mov    0x8(%ebp),%eax
  1017d4:	8b 04 85 40 39 10 00 	mov    0x103940(,%eax,4),%eax
  1017db:	eb 18                	jmp    1017f5 <trapname+0x2f>
    }
    if (trapno >= IRQ_OFFSET && trapno < IRQ_OFFSET + 16) {
  1017dd:	83 7d 08 1f          	cmpl   $0x1f,0x8(%ebp)
  1017e1:	7e 0d                	jle    1017f0 <trapname+0x2a>
  1017e3:	83 7d 08 2f          	cmpl   $0x2f,0x8(%ebp)
  1017e7:	7f 07                	jg     1017f0 <trapname+0x2a>
        return "Hardware Interrupt";
  1017e9:	b8 ea 35 10 00       	mov    $0x1035ea,%eax
  1017ee:	eb 05                	jmp    1017f5 <trapname+0x2f>
    }
    return "(unknown trap)";
  1017f0:	b8 fd 35 10 00       	mov    $0x1035fd,%eax
}
  1017f5:	5d                   	pop    %ebp
  1017f6:	c3                   	ret    

001017f7 <trap_in_kernel>:

/* trap_in_kernel - test if trap happened in kernel */
bool
trap_in_kernel(struct trapframe *tf) {
  1017f7:	55                   	push   %ebp
  1017f8:	89 e5                	mov    %esp,%ebp
    return (tf->tf_cs == (uint16_t)KERNEL_CS);
  1017fa:	8b 45 08             	mov    0x8(%ebp),%eax
  1017fd:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101801:	66 83 f8 08          	cmp    $0x8,%ax
  101805:	0f 94 c0             	sete   %al
  101808:	0f b6 c0             	movzbl %al,%eax
}
  10180b:	5d                   	pop    %ebp
  10180c:	c3                   	ret    

0010180d <print_trapframe>:
    "TF", "IF", "DF", "OF", NULL, NULL, "NT", NULL,
    "RF", "VM", "AC", "VIF", "VIP", "ID", NULL, NULL,
};

void
print_trapframe(struct trapframe *tf) {
  10180d:	55                   	push   %ebp
  10180e:	89 e5                	mov    %esp,%ebp
  101810:	83 ec 28             	sub    $0x28,%esp
    cprintf("trapframe at %p\n", tf);
  101813:	8b 45 08             	mov    0x8(%ebp),%eax
  101816:	89 44 24 04          	mov    %eax,0x4(%esp)
  10181a:	c7 04 24 3e 36 10 00 	movl   $0x10363e,(%esp)
  101821:	e8 d3 ea ff ff       	call   1002f9 <cprintf>
    print_regs(&tf->tf_regs);
  101826:	8b 45 08             	mov    0x8(%ebp),%eax
  101829:	89 04 24             	mov    %eax,(%esp)
  10182c:	e8 a1 01 00 00       	call   1019d2 <print_regs>
    cprintf("  ds   0x----%04x\n", tf->tf_ds);
  101831:	8b 45 08             	mov    0x8(%ebp),%eax
  101834:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
  101838:	0f b7 c0             	movzwl %ax,%eax
  10183b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10183f:	c7 04 24 4f 36 10 00 	movl   $0x10364f,(%esp)
  101846:	e8 ae ea ff ff       	call   1002f9 <cprintf>
    cprintf("  es   0x----%04x\n", tf->tf_es);
  10184b:	8b 45 08             	mov    0x8(%ebp),%eax
  10184e:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  101852:	0f b7 c0             	movzwl %ax,%eax
  101855:	89 44 24 04          	mov    %eax,0x4(%esp)
  101859:	c7 04 24 62 36 10 00 	movl   $0x103662,(%esp)
  101860:	e8 94 ea ff ff       	call   1002f9 <cprintf>
    cprintf("  fs   0x----%04x\n", tf->tf_fs);
  101865:	8b 45 08             	mov    0x8(%ebp),%eax
  101868:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  10186c:	0f b7 c0             	movzwl %ax,%eax
  10186f:	89 44 24 04          	mov    %eax,0x4(%esp)
  101873:	c7 04 24 75 36 10 00 	movl   $0x103675,(%esp)
  10187a:	e8 7a ea ff ff       	call   1002f9 <cprintf>
    cprintf("  gs   0x----%04x\n", tf->tf_gs);
  10187f:	8b 45 08             	mov    0x8(%ebp),%eax
  101882:	0f b7 40 20          	movzwl 0x20(%eax),%eax
  101886:	0f b7 c0             	movzwl %ax,%eax
  101889:	89 44 24 04          	mov    %eax,0x4(%esp)
  10188d:	c7 04 24 88 36 10 00 	movl   $0x103688,(%esp)
  101894:	e8 60 ea ff ff       	call   1002f9 <cprintf>
    cprintf("  trap 0x%08x %s\n", tf->tf_trapno, trapname(tf->tf_trapno));
  101899:	8b 45 08             	mov    0x8(%ebp),%eax
  10189c:	8b 40 30             	mov    0x30(%eax),%eax
  10189f:	89 04 24             	mov    %eax,(%esp)
  1018a2:	e8 1f ff ff ff       	call   1017c6 <trapname>
  1018a7:	8b 55 08             	mov    0x8(%ebp),%edx
  1018aa:	8b 52 30             	mov    0x30(%edx),%edx
  1018ad:	89 44 24 08          	mov    %eax,0x8(%esp)
  1018b1:	89 54 24 04          	mov    %edx,0x4(%esp)
  1018b5:	c7 04 24 9b 36 10 00 	movl   $0x10369b,(%esp)
  1018bc:	e8 38 ea ff ff       	call   1002f9 <cprintf>
    cprintf("  err  0x%08x\n", tf->tf_err);
  1018c1:	8b 45 08             	mov    0x8(%ebp),%eax
  1018c4:	8b 40 34             	mov    0x34(%eax),%eax
  1018c7:	89 44 24 04          	mov    %eax,0x4(%esp)
  1018cb:	c7 04 24 ad 36 10 00 	movl   $0x1036ad,(%esp)
  1018d2:	e8 22 ea ff ff       	call   1002f9 <cprintf>
    cprintf("  eip  0x%08x\n", tf->tf_eip);
  1018d7:	8b 45 08             	mov    0x8(%ebp),%eax
  1018da:	8b 40 38             	mov    0x38(%eax),%eax
  1018dd:	89 44 24 04          	mov    %eax,0x4(%esp)
  1018e1:	c7 04 24 bc 36 10 00 	movl   $0x1036bc,(%esp)
  1018e8:	e8 0c ea ff ff       	call   1002f9 <cprintf>
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
  1018ed:	8b 45 08             	mov    0x8(%ebp),%eax
  1018f0:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  1018f4:	0f b7 c0             	movzwl %ax,%eax
  1018f7:	89 44 24 04          	mov    %eax,0x4(%esp)
  1018fb:	c7 04 24 cb 36 10 00 	movl   $0x1036cb,(%esp)
  101902:	e8 f2 e9 ff ff       	call   1002f9 <cprintf>
    cprintf("  flag 0x%08x ", tf->tf_eflags);
  101907:	8b 45 08             	mov    0x8(%ebp),%eax
  10190a:	8b 40 40             	mov    0x40(%eax),%eax
  10190d:	89 44 24 04          	mov    %eax,0x4(%esp)
  101911:	c7 04 24 de 36 10 00 	movl   $0x1036de,(%esp)
  101918:	e8 dc e9 ff ff       	call   1002f9 <cprintf>

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  10191d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101924:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  10192b:	eb 3e                	jmp    10196b <print_trapframe+0x15e>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
  10192d:	8b 45 08             	mov    0x8(%ebp),%eax
  101930:	8b 50 40             	mov    0x40(%eax),%edx
  101933:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101936:	21 d0                	and    %edx,%eax
  101938:	85 c0                	test   %eax,%eax
  10193a:	74 28                	je     101964 <print_trapframe+0x157>
  10193c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10193f:	8b 04 85 80 e5 10 00 	mov    0x10e580(,%eax,4),%eax
  101946:	85 c0                	test   %eax,%eax
  101948:	74 1a                	je     101964 <print_trapframe+0x157>
            cprintf("%s,", IA32flags[i]);
  10194a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10194d:	8b 04 85 80 e5 10 00 	mov    0x10e580(,%eax,4),%eax
  101954:	89 44 24 04          	mov    %eax,0x4(%esp)
  101958:	c7 04 24 ed 36 10 00 	movl   $0x1036ed,(%esp)
  10195f:	e8 95 e9 ff ff       	call   1002f9 <cprintf>
    cprintf("  eip  0x%08x\n", tf->tf_eip);
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
    cprintf("  flag 0x%08x ", tf->tf_eflags);

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101964:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  101968:	d1 65 f0             	shll   -0x10(%ebp)
  10196b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10196e:	83 f8 17             	cmp    $0x17,%eax
  101971:	76 ba                	jbe    10192d <print_trapframe+0x120>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
            cprintf("%s,", IA32flags[i]);
        }
    }
    cprintf("IOPL=%d\n", (tf->tf_eflags & FL_IOPL_MASK) >> 12);
  101973:	8b 45 08             	mov    0x8(%ebp),%eax
  101976:	8b 40 40             	mov    0x40(%eax),%eax
  101979:	25 00 30 00 00       	and    $0x3000,%eax
  10197e:	c1 e8 0c             	shr    $0xc,%eax
  101981:	89 44 24 04          	mov    %eax,0x4(%esp)
  101985:	c7 04 24 f1 36 10 00 	movl   $0x1036f1,(%esp)
  10198c:	e8 68 e9 ff ff       	call   1002f9 <cprintf>

    if (!trap_in_kernel(tf)) {
  101991:	8b 45 08             	mov    0x8(%ebp),%eax
  101994:	89 04 24             	mov    %eax,(%esp)
  101997:	e8 5b fe ff ff       	call   1017f7 <trap_in_kernel>
  10199c:	85 c0                	test   %eax,%eax
  10199e:	75 30                	jne    1019d0 <print_trapframe+0x1c3>
        cprintf("  esp  0x%08x\n", tf->tf_esp);
  1019a0:	8b 45 08             	mov    0x8(%ebp),%eax
  1019a3:	8b 40 44             	mov    0x44(%eax),%eax
  1019a6:	89 44 24 04          	mov    %eax,0x4(%esp)
  1019aa:	c7 04 24 fa 36 10 00 	movl   $0x1036fa,(%esp)
  1019b1:	e8 43 e9 ff ff       	call   1002f9 <cprintf>
        cprintf("  ss   0x----%04x\n", tf->tf_ss);
  1019b6:	8b 45 08             	mov    0x8(%ebp),%eax
  1019b9:	0f b7 40 48          	movzwl 0x48(%eax),%eax
  1019bd:	0f b7 c0             	movzwl %ax,%eax
  1019c0:	89 44 24 04          	mov    %eax,0x4(%esp)
  1019c4:	c7 04 24 09 37 10 00 	movl   $0x103709,(%esp)
  1019cb:	e8 29 e9 ff ff       	call   1002f9 <cprintf>
    }
}
  1019d0:	c9                   	leave  
  1019d1:	c3                   	ret    

001019d2 <print_regs>:

void
print_regs(struct pushregs *regs) {
  1019d2:	55                   	push   %ebp
  1019d3:	89 e5                	mov    %esp,%ebp
  1019d5:	83 ec 18             	sub    $0x18,%esp
    cprintf("  edi  0x%08x\n", regs->reg_edi);
  1019d8:	8b 45 08             	mov    0x8(%ebp),%eax
  1019db:	8b 00                	mov    (%eax),%eax
  1019dd:	89 44 24 04          	mov    %eax,0x4(%esp)
  1019e1:	c7 04 24 1c 37 10 00 	movl   $0x10371c,(%esp)
  1019e8:	e8 0c e9 ff ff       	call   1002f9 <cprintf>
    cprintf("  esi  0x%08x\n", regs->reg_esi);
  1019ed:	8b 45 08             	mov    0x8(%ebp),%eax
  1019f0:	8b 40 04             	mov    0x4(%eax),%eax
  1019f3:	89 44 24 04          	mov    %eax,0x4(%esp)
  1019f7:	c7 04 24 2b 37 10 00 	movl   $0x10372b,(%esp)
  1019fe:	e8 f6 e8 ff ff       	call   1002f9 <cprintf>
    cprintf("  ebp  0x%08x\n", regs->reg_ebp);
  101a03:	8b 45 08             	mov    0x8(%ebp),%eax
  101a06:	8b 40 08             	mov    0x8(%eax),%eax
  101a09:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a0d:	c7 04 24 3a 37 10 00 	movl   $0x10373a,(%esp)
  101a14:	e8 e0 e8 ff ff       	call   1002f9 <cprintf>
    cprintf("  oesp 0x%08x\n", regs->reg_oesp);
  101a19:	8b 45 08             	mov    0x8(%ebp),%eax
  101a1c:	8b 40 0c             	mov    0xc(%eax),%eax
  101a1f:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a23:	c7 04 24 49 37 10 00 	movl   $0x103749,(%esp)
  101a2a:	e8 ca e8 ff ff       	call   1002f9 <cprintf>
    cprintf("  ebx  0x%08x\n", regs->reg_ebx);
  101a2f:	8b 45 08             	mov    0x8(%ebp),%eax
  101a32:	8b 40 10             	mov    0x10(%eax),%eax
  101a35:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a39:	c7 04 24 58 37 10 00 	movl   $0x103758,(%esp)
  101a40:	e8 b4 e8 ff ff       	call   1002f9 <cprintf>
    cprintf("  edx  0x%08x\n", regs->reg_edx);
  101a45:	8b 45 08             	mov    0x8(%ebp),%eax
  101a48:	8b 40 14             	mov    0x14(%eax),%eax
  101a4b:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a4f:	c7 04 24 67 37 10 00 	movl   $0x103767,(%esp)
  101a56:	e8 9e e8 ff ff       	call   1002f9 <cprintf>
    cprintf("  ecx  0x%08x\n", regs->reg_ecx);
  101a5b:	8b 45 08             	mov    0x8(%ebp),%eax
  101a5e:	8b 40 18             	mov    0x18(%eax),%eax
  101a61:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a65:	c7 04 24 76 37 10 00 	movl   $0x103776,(%esp)
  101a6c:	e8 88 e8 ff ff       	call   1002f9 <cprintf>
    cprintf("  eax  0x%08x\n", regs->reg_eax);
  101a71:	8b 45 08             	mov    0x8(%ebp),%eax
  101a74:	8b 40 1c             	mov    0x1c(%eax),%eax
  101a77:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a7b:	c7 04 24 85 37 10 00 	movl   $0x103785,(%esp)
  101a82:	e8 72 e8 ff ff       	call   1002f9 <cprintf>
}
  101a87:	c9                   	leave  
  101a88:	c3                   	ret    

00101a89 <trap_dispatch>:

/* trap_dispatch - dispatch based on what type of trap occurred */
static void
trap_dispatch(struct trapframe *tf) {
  101a89:	55                   	push   %ebp
  101a8a:	89 e5                	mov    %esp,%ebp
  101a8c:	83 ec 28             	sub    $0x28,%esp
    char c;

    switch (tf->tf_trapno) {
  101a8f:	8b 45 08             	mov    0x8(%ebp),%eax
  101a92:	8b 40 30             	mov    0x30(%eax),%eax
  101a95:	83 f8 2f             	cmp    $0x2f,%eax
  101a98:	77 1e                	ja     101ab8 <trap_dispatch+0x2f>
  101a9a:	83 f8 2e             	cmp    $0x2e,%eax
  101a9d:	0f 83 bf 00 00 00    	jae    101b62 <trap_dispatch+0xd9>
  101aa3:	83 f8 21             	cmp    $0x21,%eax
  101aa6:	74 40                	je     101ae8 <trap_dispatch+0x5f>
  101aa8:	83 f8 24             	cmp    $0x24,%eax
  101aab:	74 15                	je     101ac2 <trap_dispatch+0x39>
  101aad:	83 f8 20             	cmp    $0x20,%eax
  101ab0:	0f 84 af 00 00 00    	je     101b65 <trap_dispatch+0xdc>
  101ab6:	eb 72                	jmp    101b2a <trap_dispatch+0xa1>
  101ab8:	83 e8 78             	sub    $0x78,%eax
  101abb:	83 f8 01             	cmp    $0x1,%eax
  101abe:	77 6a                	ja     101b2a <trap_dispatch+0xa1>
  101ac0:	eb 4c                	jmp    101b0e <trap_dispatch+0x85>
         * (2) Every TICK_NUM cycle, you can print some info using a funciton, such as print_ticks().
         * (3) Too Simple? Yes, I think so!
         */
        break;
    case IRQ_OFFSET + IRQ_COM1:
        c = cons_getc();
  101ac2:	e8 b5 fa ff ff       	call   10157c <cons_getc>
  101ac7:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("serial [%03d] %c\n", c, c);
  101aca:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101ace:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101ad2:	89 54 24 08          	mov    %edx,0x8(%esp)
  101ad6:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ada:	c7 04 24 94 37 10 00 	movl   $0x103794,(%esp)
  101ae1:	e8 13 e8 ff ff       	call   1002f9 <cprintf>
        break;
  101ae6:	eb 7e                	jmp    101b66 <trap_dispatch+0xdd>
    case IRQ_OFFSET + IRQ_KBD:
        c = cons_getc();
  101ae8:	e8 8f fa ff ff       	call   10157c <cons_getc>
  101aed:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("kbd [%03d] %c\n", c, c);
  101af0:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101af4:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101af8:	89 54 24 08          	mov    %edx,0x8(%esp)
  101afc:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b00:	c7 04 24 a6 37 10 00 	movl   $0x1037a6,(%esp)
  101b07:	e8 ed e7 ff ff       	call   1002f9 <cprintf>
        break;
  101b0c:	eb 58                	jmp    101b66 <trap_dispatch+0xdd>
    //LAB1 CHALLENGE 1 : YOUR CODE you should modify below codes.
    case T_SWITCH_TOU:
    case T_SWITCH_TOK:
        panic("T_SWITCH_** ??\n");
  101b0e:	c7 44 24 08 b5 37 10 	movl   $0x1037b5,0x8(%esp)
  101b15:	00 
  101b16:	c7 44 24 04 a2 00 00 	movl   $0xa2,0x4(%esp)
  101b1d:	00 
  101b1e:	c7 04 24 c5 37 10 00 	movl   $0x1037c5,(%esp)
  101b25:	e8 34 f1 ff ff       	call   100c5e <__panic>
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
    default:
        // in kernel, it must be a mistake
        if ((tf->tf_cs & 3) == 0) {
  101b2a:	8b 45 08             	mov    0x8(%ebp),%eax
  101b2d:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101b31:	0f b7 c0             	movzwl %ax,%eax
  101b34:	83 e0 03             	and    $0x3,%eax
  101b37:	85 c0                	test   %eax,%eax
  101b39:	75 2b                	jne    101b66 <trap_dispatch+0xdd>
            print_trapframe(tf);
  101b3b:	8b 45 08             	mov    0x8(%ebp),%eax
  101b3e:	89 04 24             	mov    %eax,(%esp)
  101b41:	e8 c7 fc ff ff       	call   10180d <print_trapframe>
            panic("unexpected trap in kernel.\n");
  101b46:	c7 44 24 08 d6 37 10 	movl   $0x1037d6,0x8(%esp)
  101b4d:	00 
  101b4e:	c7 44 24 04 ac 00 00 	movl   $0xac,0x4(%esp)
  101b55:	00 
  101b56:	c7 04 24 c5 37 10 00 	movl   $0x1037c5,(%esp)
  101b5d:	e8 fc f0 ff ff       	call   100c5e <__panic>
        panic("T_SWITCH_** ??\n");
        break;
    case IRQ_OFFSET + IRQ_IDE1:
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
  101b62:	90                   	nop
  101b63:	eb 01                	jmp    101b66 <trap_dispatch+0xdd>
        /* handle the timer interrupt */
        /* (1) After a timer interrupt, you should record this event using a global variable (increase it), such as ticks in kern/driver/clock.c
         * (2) Every TICK_NUM cycle, you can print some info using a funciton, such as print_ticks().
         * (3) Too Simple? Yes, I think so!
         */
        break;
  101b65:	90                   	nop
        if ((tf->tf_cs & 3) == 0) {
            print_trapframe(tf);
            panic("unexpected trap in kernel.\n");
        }
    }
}
  101b66:	c9                   	leave  
  101b67:	c3                   	ret    

00101b68 <trap>:
 * trap - handles or dispatches an exception/interrupt. if and when trap() returns,
 * the code in kern/trap/trapentry.S restores the old CPU state saved in the
 * trapframe and then uses the iret instruction to return from the exception.
 * */
void
trap(struct trapframe *tf) {
  101b68:	55                   	push   %ebp
  101b69:	89 e5                	mov    %esp,%ebp
  101b6b:	83 ec 18             	sub    $0x18,%esp
    // dispatch based on what type of trap occurred
    trap_dispatch(tf);
  101b6e:	8b 45 08             	mov    0x8(%ebp),%eax
  101b71:	89 04 24             	mov    %eax,(%esp)
  101b74:	e8 10 ff ff ff       	call   101a89 <trap_dispatch>
}
  101b79:	c9                   	leave  
  101b7a:	c3                   	ret    

00101b7b <__alltraps>:
.text
.globl __alltraps
__alltraps:
    # push registers to build a trap frame
    # therefore make the stack look like a struct trapframe
    pushl %ds
  101b7b:	1e                   	push   %ds
    pushl %es
  101b7c:	06                   	push   %es
    pushl %fs
  101b7d:	0f a0                	push   %fs
    pushl %gs
  101b7f:	0f a8                	push   %gs
    pushal
  101b81:	60                   	pusha  

    # load GD_KDATA into %ds and %es to set up data segments for kernel
    movl $GD_KDATA, %eax
  101b82:	b8 10 00 00 00       	mov    $0x10,%eax
    movw %ax, %ds
  101b87:	8e d8                	mov    %eax,%ds
    movw %ax, %es
  101b89:	8e c0                	mov    %eax,%es

    # push %esp to pass a pointer to the trapframe as an argument to trap()
    pushl %esp
  101b8b:	54                   	push   %esp

    # call trap(tf), where tf=%esp
    call trap
  101b8c:	e8 d7 ff ff ff       	call   101b68 <trap>

    # pop the pushed stack pointer
    popl %esp
  101b91:	5c                   	pop    %esp

00101b92 <__trapret>:

    # return falls through to trapret...
.globl __trapret
__trapret:
    # restore registers from stack
    popal
  101b92:	61                   	popa   

    # restore %ds, %es, %fs and %gs
    popl %gs
  101b93:	0f a9                	pop    %gs
    popl %fs
  101b95:	0f a1                	pop    %fs
    popl %es
  101b97:	07                   	pop    %es
    popl %ds
  101b98:	1f                   	pop    %ds

    # get rid of the trap number and error code
    addl $0x8, %esp
  101b99:	83 c4 08             	add    $0x8,%esp
    iret
  101b9c:	cf                   	iret   

00101b9d <vector0>:
# handler
.text
.globl __alltraps
.globl vector0
vector0:
  pushl $0
  101b9d:	6a 00                	push   $0x0
  pushl $0
  101b9f:	6a 00                	push   $0x0
  jmp __alltraps
  101ba1:	e9 d5 ff ff ff       	jmp    101b7b <__alltraps>

00101ba6 <vector1>:
.globl vector1
vector1:
  pushl $0
  101ba6:	6a 00                	push   $0x0
  pushl $1
  101ba8:	6a 01                	push   $0x1
  jmp __alltraps
  101baa:	e9 cc ff ff ff       	jmp    101b7b <__alltraps>

00101baf <vector2>:
.globl vector2
vector2:
  pushl $0
  101baf:	6a 00                	push   $0x0
  pushl $2
  101bb1:	6a 02                	push   $0x2
  jmp __alltraps
  101bb3:	e9 c3 ff ff ff       	jmp    101b7b <__alltraps>

00101bb8 <vector3>:
.globl vector3
vector3:
  pushl $0
  101bb8:	6a 00                	push   $0x0
  pushl $3
  101bba:	6a 03                	push   $0x3
  jmp __alltraps
  101bbc:	e9 ba ff ff ff       	jmp    101b7b <__alltraps>

00101bc1 <vector4>:
.globl vector4
vector4:
  pushl $0
  101bc1:	6a 00                	push   $0x0
  pushl $4
  101bc3:	6a 04                	push   $0x4
  jmp __alltraps
  101bc5:	e9 b1 ff ff ff       	jmp    101b7b <__alltraps>

00101bca <vector5>:
.globl vector5
vector5:
  pushl $0
  101bca:	6a 00                	push   $0x0
  pushl $5
  101bcc:	6a 05                	push   $0x5
  jmp __alltraps
  101bce:	e9 a8 ff ff ff       	jmp    101b7b <__alltraps>

00101bd3 <vector6>:
.globl vector6
vector6:
  pushl $0
  101bd3:	6a 00                	push   $0x0
  pushl $6
  101bd5:	6a 06                	push   $0x6
  jmp __alltraps
  101bd7:	e9 9f ff ff ff       	jmp    101b7b <__alltraps>

00101bdc <vector7>:
.globl vector7
vector7:
  pushl $0
  101bdc:	6a 00                	push   $0x0
  pushl $7
  101bde:	6a 07                	push   $0x7
  jmp __alltraps
  101be0:	e9 96 ff ff ff       	jmp    101b7b <__alltraps>

00101be5 <vector8>:
.globl vector8
vector8:
  pushl $8
  101be5:	6a 08                	push   $0x8
  jmp __alltraps
  101be7:	e9 8f ff ff ff       	jmp    101b7b <__alltraps>

00101bec <vector9>:
.globl vector9
vector9:
  pushl $9
  101bec:	6a 09                	push   $0x9
  jmp __alltraps
  101bee:	e9 88 ff ff ff       	jmp    101b7b <__alltraps>

00101bf3 <vector10>:
.globl vector10
vector10:
  pushl $10
  101bf3:	6a 0a                	push   $0xa
  jmp __alltraps
  101bf5:	e9 81 ff ff ff       	jmp    101b7b <__alltraps>

00101bfa <vector11>:
.globl vector11
vector11:
  pushl $11
  101bfa:	6a 0b                	push   $0xb
  jmp __alltraps
  101bfc:	e9 7a ff ff ff       	jmp    101b7b <__alltraps>

00101c01 <vector12>:
.globl vector12
vector12:
  pushl $12
  101c01:	6a 0c                	push   $0xc
  jmp __alltraps
  101c03:	e9 73 ff ff ff       	jmp    101b7b <__alltraps>

00101c08 <vector13>:
.globl vector13
vector13:
  pushl $13
  101c08:	6a 0d                	push   $0xd
  jmp __alltraps
  101c0a:	e9 6c ff ff ff       	jmp    101b7b <__alltraps>

00101c0f <vector14>:
.globl vector14
vector14:
  pushl $14
  101c0f:	6a 0e                	push   $0xe
  jmp __alltraps
  101c11:	e9 65 ff ff ff       	jmp    101b7b <__alltraps>

00101c16 <vector15>:
.globl vector15
vector15:
  pushl $0
  101c16:	6a 00                	push   $0x0
  pushl $15
  101c18:	6a 0f                	push   $0xf
  jmp __alltraps
  101c1a:	e9 5c ff ff ff       	jmp    101b7b <__alltraps>

00101c1f <vector16>:
.globl vector16
vector16:
  pushl $0
  101c1f:	6a 00                	push   $0x0
  pushl $16
  101c21:	6a 10                	push   $0x10
  jmp __alltraps
  101c23:	e9 53 ff ff ff       	jmp    101b7b <__alltraps>

00101c28 <vector17>:
.globl vector17
vector17:
  pushl $17
  101c28:	6a 11                	push   $0x11
  jmp __alltraps
  101c2a:	e9 4c ff ff ff       	jmp    101b7b <__alltraps>

00101c2f <vector18>:
.globl vector18
vector18:
  pushl $0
  101c2f:	6a 00                	push   $0x0
  pushl $18
  101c31:	6a 12                	push   $0x12
  jmp __alltraps
  101c33:	e9 43 ff ff ff       	jmp    101b7b <__alltraps>

00101c38 <vector19>:
.globl vector19
vector19:
  pushl $0
  101c38:	6a 00                	push   $0x0
  pushl $19
  101c3a:	6a 13                	push   $0x13
  jmp __alltraps
  101c3c:	e9 3a ff ff ff       	jmp    101b7b <__alltraps>

00101c41 <vector20>:
.globl vector20
vector20:
  pushl $0
  101c41:	6a 00                	push   $0x0
  pushl $20
  101c43:	6a 14                	push   $0x14
  jmp __alltraps
  101c45:	e9 31 ff ff ff       	jmp    101b7b <__alltraps>

00101c4a <vector21>:
.globl vector21
vector21:
  pushl $0
  101c4a:	6a 00                	push   $0x0
  pushl $21
  101c4c:	6a 15                	push   $0x15
  jmp __alltraps
  101c4e:	e9 28 ff ff ff       	jmp    101b7b <__alltraps>

00101c53 <vector22>:
.globl vector22
vector22:
  pushl $0
  101c53:	6a 00                	push   $0x0
  pushl $22
  101c55:	6a 16                	push   $0x16
  jmp __alltraps
  101c57:	e9 1f ff ff ff       	jmp    101b7b <__alltraps>

00101c5c <vector23>:
.globl vector23
vector23:
  pushl $0
  101c5c:	6a 00                	push   $0x0
  pushl $23
  101c5e:	6a 17                	push   $0x17
  jmp __alltraps
  101c60:	e9 16 ff ff ff       	jmp    101b7b <__alltraps>

00101c65 <vector24>:
.globl vector24
vector24:
  pushl $0
  101c65:	6a 00                	push   $0x0
  pushl $24
  101c67:	6a 18                	push   $0x18
  jmp __alltraps
  101c69:	e9 0d ff ff ff       	jmp    101b7b <__alltraps>

00101c6e <vector25>:
.globl vector25
vector25:
  pushl $0
  101c6e:	6a 00                	push   $0x0
  pushl $25
  101c70:	6a 19                	push   $0x19
  jmp __alltraps
  101c72:	e9 04 ff ff ff       	jmp    101b7b <__alltraps>

00101c77 <vector26>:
.globl vector26
vector26:
  pushl $0
  101c77:	6a 00                	push   $0x0
  pushl $26
  101c79:	6a 1a                	push   $0x1a
  jmp __alltraps
  101c7b:	e9 fb fe ff ff       	jmp    101b7b <__alltraps>

00101c80 <vector27>:
.globl vector27
vector27:
  pushl $0
  101c80:	6a 00                	push   $0x0
  pushl $27
  101c82:	6a 1b                	push   $0x1b
  jmp __alltraps
  101c84:	e9 f2 fe ff ff       	jmp    101b7b <__alltraps>

00101c89 <vector28>:
.globl vector28
vector28:
  pushl $0
  101c89:	6a 00                	push   $0x0
  pushl $28
  101c8b:	6a 1c                	push   $0x1c
  jmp __alltraps
  101c8d:	e9 e9 fe ff ff       	jmp    101b7b <__alltraps>

00101c92 <vector29>:
.globl vector29
vector29:
  pushl $0
  101c92:	6a 00                	push   $0x0
  pushl $29
  101c94:	6a 1d                	push   $0x1d
  jmp __alltraps
  101c96:	e9 e0 fe ff ff       	jmp    101b7b <__alltraps>

00101c9b <vector30>:
.globl vector30
vector30:
  pushl $0
  101c9b:	6a 00                	push   $0x0
  pushl $30
  101c9d:	6a 1e                	push   $0x1e
  jmp __alltraps
  101c9f:	e9 d7 fe ff ff       	jmp    101b7b <__alltraps>

00101ca4 <vector31>:
.globl vector31
vector31:
  pushl $0
  101ca4:	6a 00                	push   $0x0
  pushl $31
  101ca6:	6a 1f                	push   $0x1f
  jmp __alltraps
  101ca8:	e9 ce fe ff ff       	jmp    101b7b <__alltraps>

00101cad <vector32>:
.globl vector32
vector32:
  pushl $0
  101cad:	6a 00                	push   $0x0
  pushl $32
  101caf:	6a 20                	push   $0x20
  jmp __alltraps
  101cb1:	e9 c5 fe ff ff       	jmp    101b7b <__alltraps>

00101cb6 <vector33>:
.globl vector33
vector33:
  pushl $0
  101cb6:	6a 00                	push   $0x0
  pushl $33
  101cb8:	6a 21                	push   $0x21
  jmp __alltraps
  101cba:	e9 bc fe ff ff       	jmp    101b7b <__alltraps>

00101cbf <vector34>:
.globl vector34
vector34:
  pushl $0
  101cbf:	6a 00                	push   $0x0
  pushl $34
  101cc1:	6a 22                	push   $0x22
  jmp __alltraps
  101cc3:	e9 b3 fe ff ff       	jmp    101b7b <__alltraps>

00101cc8 <vector35>:
.globl vector35
vector35:
  pushl $0
  101cc8:	6a 00                	push   $0x0
  pushl $35
  101cca:	6a 23                	push   $0x23
  jmp __alltraps
  101ccc:	e9 aa fe ff ff       	jmp    101b7b <__alltraps>

00101cd1 <vector36>:
.globl vector36
vector36:
  pushl $0
  101cd1:	6a 00                	push   $0x0
  pushl $36
  101cd3:	6a 24                	push   $0x24
  jmp __alltraps
  101cd5:	e9 a1 fe ff ff       	jmp    101b7b <__alltraps>

00101cda <vector37>:
.globl vector37
vector37:
  pushl $0
  101cda:	6a 00                	push   $0x0
  pushl $37
  101cdc:	6a 25                	push   $0x25
  jmp __alltraps
  101cde:	e9 98 fe ff ff       	jmp    101b7b <__alltraps>

00101ce3 <vector38>:
.globl vector38
vector38:
  pushl $0
  101ce3:	6a 00                	push   $0x0
  pushl $38
  101ce5:	6a 26                	push   $0x26
  jmp __alltraps
  101ce7:	e9 8f fe ff ff       	jmp    101b7b <__alltraps>

00101cec <vector39>:
.globl vector39
vector39:
  pushl $0
  101cec:	6a 00                	push   $0x0
  pushl $39
  101cee:	6a 27                	push   $0x27
  jmp __alltraps
  101cf0:	e9 86 fe ff ff       	jmp    101b7b <__alltraps>

00101cf5 <vector40>:
.globl vector40
vector40:
  pushl $0
  101cf5:	6a 00                	push   $0x0
  pushl $40
  101cf7:	6a 28                	push   $0x28
  jmp __alltraps
  101cf9:	e9 7d fe ff ff       	jmp    101b7b <__alltraps>

00101cfe <vector41>:
.globl vector41
vector41:
  pushl $0
  101cfe:	6a 00                	push   $0x0
  pushl $41
  101d00:	6a 29                	push   $0x29
  jmp __alltraps
  101d02:	e9 74 fe ff ff       	jmp    101b7b <__alltraps>

00101d07 <vector42>:
.globl vector42
vector42:
  pushl $0
  101d07:	6a 00                	push   $0x0
  pushl $42
  101d09:	6a 2a                	push   $0x2a
  jmp __alltraps
  101d0b:	e9 6b fe ff ff       	jmp    101b7b <__alltraps>

00101d10 <vector43>:
.globl vector43
vector43:
  pushl $0
  101d10:	6a 00                	push   $0x0
  pushl $43
  101d12:	6a 2b                	push   $0x2b
  jmp __alltraps
  101d14:	e9 62 fe ff ff       	jmp    101b7b <__alltraps>

00101d19 <vector44>:
.globl vector44
vector44:
  pushl $0
  101d19:	6a 00                	push   $0x0
  pushl $44
  101d1b:	6a 2c                	push   $0x2c
  jmp __alltraps
  101d1d:	e9 59 fe ff ff       	jmp    101b7b <__alltraps>

00101d22 <vector45>:
.globl vector45
vector45:
  pushl $0
  101d22:	6a 00                	push   $0x0
  pushl $45
  101d24:	6a 2d                	push   $0x2d
  jmp __alltraps
  101d26:	e9 50 fe ff ff       	jmp    101b7b <__alltraps>

00101d2b <vector46>:
.globl vector46
vector46:
  pushl $0
  101d2b:	6a 00                	push   $0x0
  pushl $46
  101d2d:	6a 2e                	push   $0x2e
  jmp __alltraps
  101d2f:	e9 47 fe ff ff       	jmp    101b7b <__alltraps>

00101d34 <vector47>:
.globl vector47
vector47:
  pushl $0
  101d34:	6a 00                	push   $0x0
  pushl $47
  101d36:	6a 2f                	push   $0x2f
  jmp __alltraps
  101d38:	e9 3e fe ff ff       	jmp    101b7b <__alltraps>

00101d3d <vector48>:
.globl vector48
vector48:
  pushl $0
  101d3d:	6a 00                	push   $0x0
  pushl $48
  101d3f:	6a 30                	push   $0x30
  jmp __alltraps
  101d41:	e9 35 fe ff ff       	jmp    101b7b <__alltraps>

00101d46 <vector49>:
.globl vector49
vector49:
  pushl $0
  101d46:	6a 00                	push   $0x0
  pushl $49
  101d48:	6a 31                	push   $0x31
  jmp __alltraps
  101d4a:	e9 2c fe ff ff       	jmp    101b7b <__alltraps>

00101d4f <vector50>:
.globl vector50
vector50:
  pushl $0
  101d4f:	6a 00                	push   $0x0
  pushl $50
  101d51:	6a 32                	push   $0x32
  jmp __alltraps
  101d53:	e9 23 fe ff ff       	jmp    101b7b <__alltraps>

00101d58 <vector51>:
.globl vector51
vector51:
  pushl $0
  101d58:	6a 00                	push   $0x0
  pushl $51
  101d5a:	6a 33                	push   $0x33
  jmp __alltraps
  101d5c:	e9 1a fe ff ff       	jmp    101b7b <__alltraps>

00101d61 <vector52>:
.globl vector52
vector52:
  pushl $0
  101d61:	6a 00                	push   $0x0
  pushl $52
  101d63:	6a 34                	push   $0x34
  jmp __alltraps
  101d65:	e9 11 fe ff ff       	jmp    101b7b <__alltraps>

00101d6a <vector53>:
.globl vector53
vector53:
  pushl $0
  101d6a:	6a 00                	push   $0x0
  pushl $53
  101d6c:	6a 35                	push   $0x35
  jmp __alltraps
  101d6e:	e9 08 fe ff ff       	jmp    101b7b <__alltraps>

00101d73 <vector54>:
.globl vector54
vector54:
  pushl $0
  101d73:	6a 00                	push   $0x0
  pushl $54
  101d75:	6a 36                	push   $0x36
  jmp __alltraps
  101d77:	e9 ff fd ff ff       	jmp    101b7b <__alltraps>

00101d7c <vector55>:
.globl vector55
vector55:
  pushl $0
  101d7c:	6a 00                	push   $0x0
  pushl $55
  101d7e:	6a 37                	push   $0x37
  jmp __alltraps
  101d80:	e9 f6 fd ff ff       	jmp    101b7b <__alltraps>

00101d85 <vector56>:
.globl vector56
vector56:
  pushl $0
  101d85:	6a 00                	push   $0x0
  pushl $56
  101d87:	6a 38                	push   $0x38
  jmp __alltraps
  101d89:	e9 ed fd ff ff       	jmp    101b7b <__alltraps>

00101d8e <vector57>:
.globl vector57
vector57:
  pushl $0
  101d8e:	6a 00                	push   $0x0
  pushl $57
  101d90:	6a 39                	push   $0x39
  jmp __alltraps
  101d92:	e9 e4 fd ff ff       	jmp    101b7b <__alltraps>

00101d97 <vector58>:
.globl vector58
vector58:
  pushl $0
  101d97:	6a 00                	push   $0x0
  pushl $58
  101d99:	6a 3a                	push   $0x3a
  jmp __alltraps
  101d9b:	e9 db fd ff ff       	jmp    101b7b <__alltraps>

00101da0 <vector59>:
.globl vector59
vector59:
  pushl $0
  101da0:	6a 00                	push   $0x0
  pushl $59
  101da2:	6a 3b                	push   $0x3b
  jmp __alltraps
  101da4:	e9 d2 fd ff ff       	jmp    101b7b <__alltraps>

00101da9 <vector60>:
.globl vector60
vector60:
  pushl $0
  101da9:	6a 00                	push   $0x0
  pushl $60
  101dab:	6a 3c                	push   $0x3c
  jmp __alltraps
  101dad:	e9 c9 fd ff ff       	jmp    101b7b <__alltraps>

00101db2 <vector61>:
.globl vector61
vector61:
  pushl $0
  101db2:	6a 00                	push   $0x0
  pushl $61
  101db4:	6a 3d                	push   $0x3d
  jmp __alltraps
  101db6:	e9 c0 fd ff ff       	jmp    101b7b <__alltraps>

00101dbb <vector62>:
.globl vector62
vector62:
  pushl $0
  101dbb:	6a 00                	push   $0x0
  pushl $62
  101dbd:	6a 3e                	push   $0x3e
  jmp __alltraps
  101dbf:	e9 b7 fd ff ff       	jmp    101b7b <__alltraps>

00101dc4 <vector63>:
.globl vector63
vector63:
  pushl $0
  101dc4:	6a 00                	push   $0x0
  pushl $63
  101dc6:	6a 3f                	push   $0x3f
  jmp __alltraps
  101dc8:	e9 ae fd ff ff       	jmp    101b7b <__alltraps>

00101dcd <vector64>:
.globl vector64
vector64:
  pushl $0
  101dcd:	6a 00                	push   $0x0
  pushl $64
  101dcf:	6a 40                	push   $0x40
  jmp __alltraps
  101dd1:	e9 a5 fd ff ff       	jmp    101b7b <__alltraps>

00101dd6 <vector65>:
.globl vector65
vector65:
  pushl $0
  101dd6:	6a 00                	push   $0x0
  pushl $65
  101dd8:	6a 41                	push   $0x41
  jmp __alltraps
  101dda:	e9 9c fd ff ff       	jmp    101b7b <__alltraps>

00101ddf <vector66>:
.globl vector66
vector66:
  pushl $0
  101ddf:	6a 00                	push   $0x0
  pushl $66
  101de1:	6a 42                	push   $0x42
  jmp __alltraps
  101de3:	e9 93 fd ff ff       	jmp    101b7b <__alltraps>

00101de8 <vector67>:
.globl vector67
vector67:
  pushl $0
  101de8:	6a 00                	push   $0x0
  pushl $67
  101dea:	6a 43                	push   $0x43
  jmp __alltraps
  101dec:	e9 8a fd ff ff       	jmp    101b7b <__alltraps>

00101df1 <vector68>:
.globl vector68
vector68:
  pushl $0
  101df1:	6a 00                	push   $0x0
  pushl $68
  101df3:	6a 44                	push   $0x44
  jmp __alltraps
  101df5:	e9 81 fd ff ff       	jmp    101b7b <__alltraps>

00101dfa <vector69>:
.globl vector69
vector69:
  pushl $0
  101dfa:	6a 00                	push   $0x0
  pushl $69
  101dfc:	6a 45                	push   $0x45
  jmp __alltraps
  101dfe:	e9 78 fd ff ff       	jmp    101b7b <__alltraps>

00101e03 <vector70>:
.globl vector70
vector70:
  pushl $0
  101e03:	6a 00                	push   $0x0
  pushl $70
  101e05:	6a 46                	push   $0x46
  jmp __alltraps
  101e07:	e9 6f fd ff ff       	jmp    101b7b <__alltraps>

00101e0c <vector71>:
.globl vector71
vector71:
  pushl $0
  101e0c:	6a 00                	push   $0x0
  pushl $71
  101e0e:	6a 47                	push   $0x47
  jmp __alltraps
  101e10:	e9 66 fd ff ff       	jmp    101b7b <__alltraps>

00101e15 <vector72>:
.globl vector72
vector72:
  pushl $0
  101e15:	6a 00                	push   $0x0
  pushl $72
  101e17:	6a 48                	push   $0x48
  jmp __alltraps
  101e19:	e9 5d fd ff ff       	jmp    101b7b <__alltraps>

00101e1e <vector73>:
.globl vector73
vector73:
  pushl $0
  101e1e:	6a 00                	push   $0x0
  pushl $73
  101e20:	6a 49                	push   $0x49
  jmp __alltraps
  101e22:	e9 54 fd ff ff       	jmp    101b7b <__alltraps>

00101e27 <vector74>:
.globl vector74
vector74:
  pushl $0
  101e27:	6a 00                	push   $0x0
  pushl $74
  101e29:	6a 4a                	push   $0x4a
  jmp __alltraps
  101e2b:	e9 4b fd ff ff       	jmp    101b7b <__alltraps>

00101e30 <vector75>:
.globl vector75
vector75:
  pushl $0
  101e30:	6a 00                	push   $0x0
  pushl $75
  101e32:	6a 4b                	push   $0x4b
  jmp __alltraps
  101e34:	e9 42 fd ff ff       	jmp    101b7b <__alltraps>

00101e39 <vector76>:
.globl vector76
vector76:
  pushl $0
  101e39:	6a 00                	push   $0x0
  pushl $76
  101e3b:	6a 4c                	push   $0x4c
  jmp __alltraps
  101e3d:	e9 39 fd ff ff       	jmp    101b7b <__alltraps>

00101e42 <vector77>:
.globl vector77
vector77:
  pushl $0
  101e42:	6a 00                	push   $0x0
  pushl $77
  101e44:	6a 4d                	push   $0x4d
  jmp __alltraps
  101e46:	e9 30 fd ff ff       	jmp    101b7b <__alltraps>

00101e4b <vector78>:
.globl vector78
vector78:
  pushl $0
  101e4b:	6a 00                	push   $0x0
  pushl $78
  101e4d:	6a 4e                	push   $0x4e
  jmp __alltraps
  101e4f:	e9 27 fd ff ff       	jmp    101b7b <__alltraps>

00101e54 <vector79>:
.globl vector79
vector79:
  pushl $0
  101e54:	6a 00                	push   $0x0
  pushl $79
  101e56:	6a 4f                	push   $0x4f
  jmp __alltraps
  101e58:	e9 1e fd ff ff       	jmp    101b7b <__alltraps>

00101e5d <vector80>:
.globl vector80
vector80:
  pushl $0
  101e5d:	6a 00                	push   $0x0
  pushl $80
  101e5f:	6a 50                	push   $0x50
  jmp __alltraps
  101e61:	e9 15 fd ff ff       	jmp    101b7b <__alltraps>

00101e66 <vector81>:
.globl vector81
vector81:
  pushl $0
  101e66:	6a 00                	push   $0x0
  pushl $81
  101e68:	6a 51                	push   $0x51
  jmp __alltraps
  101e6a:	e9 0c fd ff ff       	jmp    101b7b <__alltraps>

00101e6f <vector82>:
.globl vector82
vector82:
  pushl $0
  101e6f:	6a 00                	push   $0x0
  pushl $82
  101e71:	6a 52                	push   $0x52
  jmp __alltraps
  101e73:	e9 03 fd ff ff       	jmp    101b7b <__alltraps>

00101e78 <vector83>:
.globl vector83
vector83:
  pushl $0
  101e78:	6a 00                	push   $0x0
  pushl $83
  101e7a:	6a 53                	push   $0x53
  jmp __alltraps
  101e7c:	e9 fa fc ff ff       	jmp    101b7b <__alltraps>

00101e81 <vector84>:
.globl vector84
vector84:
  pushl $0
  101e81:	6a 00                	push   $0x0
  pushl $84
  101e83:	6a 54                	push   $0x54
  jmp __alltraps
  101e85:	e9 f1 fc ff ff       	jmp    101b7b <__alltraps>

00101e8a <vector85>:
.globl vector85
vector85:
  pushl $0
  101e8a:	6a 00                	push   $0x0
  pushl $85
  101e8c:	6a 55                	push   $0x55
  jmp __alltraps
  101e8e:	e9 e8 fc ff ff       	jmp    101b7b <__alltraps>

00101e93 <vector86>:
.globl vector86
vector86:
  pushl $0
  101e93:	6a 00                	push   $0x0
  pushl $86
  101e95:	6a 56                	push   $0x56
  jmp __alltraps
  101e97:	e9 df fc ff ff       	jmp    101b7b <__alltraps>

00101e9c <vector87>:
.globl vector87
vector87:
  pushl $0
  101e9c:	6a 00                	push   $0x0
  pushl $87
  101e9e:	6a 57                	push   $0x57
  jmp __alltraps
  101ea0:	e9 d6 fc ff ff       	jmp    101b7b <__alltraps>

00101ea5 <vector88>:
.globl vector88
vector88:
  pushl $0
  101ea5:	6a 00                	push   $0x0
  pushl $88
  101ea7:	6a 58                	push   $0x58
  jmp __alltraps
  101ea9:	e9 cd fc ff ff       	jmp    101b7b <__alltraps>

00101eae <vector89>:
.globl vector89
vector89:
  pushl $0
  101eae:	6a 00                	push   $0x0
  pushl $89
  101eb0:	6a 59                	push   $0x59
  jmp __alltraps
  101eb2:	e9 c4 fc ff ff       	jmp    101b7b <__alltraps>

00101eb7 <vector90>:
.globl vector90
vector90:
  pushl $0
  101eb7:	6a 00                	push   $0x0
  pushl $90
  101eb9:	6a 5a                	push   $0x5a
  jmp __alltraps
  101ebb:	e9 bb fc ff ff       	jmp    101b7b <__alltraps>

00101ec0 <vector91>:
.globl vector91
vector91:
  pushl $0
  101ec0:	6a 00                	push   $0x0
  pushl $91
  101ec2:	6a 5b                	push   $0x5b
  jmp __alltraps
  101ec4:	e9 b2 fc ff ff       	jmp    101b7b <__alltraps>

00101ec9 <vector92>:
.globl vector92
vector92:
  pushl $0
  101ec9:	6a 00                	push   $0x0
  pushl $92
  101ecb:	6a 5c                	push   $0x5c
  jmp __alltraps
  101ecd:	e9 a9 fc ff ff       	jmp    101b7b <__alltraps>

00101ed2 <vector93>:
.globl vector93
vector93:
  pushl $0
  101ed2:	6a 00                	push   $0x0
  pushl $93
  101ed4:	6a 5d                	push   $0x5d
  jmp __alltraps
  101ed6:	e9 a0 fc ff ff       	jmp    101b7b <__alltraps>

00101edb <vector94>:
.globl vector94
vector94:
  pushl $0
  101edb:	6a 00                	push   $0x0
  pushl $94
  101edd:	6a 5e                	push   $0x5e
  jmp __alltraps
  101edf:	e9 97 fc ff ff       	jmp    101b7b <__alltraps>

00101ee4 <vector95>:
.globl vector95
vector95:
  pushl $0
  101ee4:	6a 00                	push   $0x0
  pushl $95
  101ee6:	6a 5f                	push   $0x5f
  jmp __alltraps
  101ee8:	e9 8e fc ff ff       	jmp    101b7b <__alltraps>

00101eed <vector96>:
.globl vector96
vector96:
  pushl $0
  101eed:	6a 00                	push   $0x0
  pushl $96
  101eef:	6a 60                	push   $0x60
  jmp __alltraps
  101ef1:	e9 85 fc ff ff       	jmp    101b7b <__alltraps>

00101ef6 <vector97>:
.globl vector97
vector97:
  pushl $0
  101ef6:	6a 00                	push   $0x0
  pushl $97
  101ef8:	6a 61                	push   $0x61
  jmp __alltraps
  101efa:	e9 7c fc ff ff       	jmp    101b7b <__alltraps>

00101eff <vector98>:
.globl vector98
vector98:
  pushl $0
  101eff:	6a 00                	push   $0x0
  pushl $98
  101f01:	6a 62                	push   $0x62
  jmp __alltraps
  101f03:	e9 73 fc ff ff       	jmp    101b7b <__alltraps>

00101f08 <vector99>:
.globl vector99
vector99:
  pushl $0
  101f08:	6a 00                	push   $0x0
  pushl $99
  101f0a:	6a 63                	push   $0x63
  jmp __alltraps
  101f0c:	e9 6a fc ff ff       	jmp    101b7b <__alltraps>

00101f11 <vector100>:
.globl vector100
vector100:
  pushl $0
  101f11:	6a 00                	push   $0x0
  pushl $100
  101f13:	6a 64                	push   $0x64
  jmp __alltraps
  101f15:	e9 61 fc ff ff       	jmp    101b7b <__alltraps>

00101f1a <vector101>:
.globl vector101
vector101:
  pushl $0
  101f1a:	6a 00                	push   $0x0
  pushl $101
  101f1c:	6a 65                	push   $0x65
  jmp __alltraps
  101f1e:	e9 58 fc ff ff       	jmp    101b7b <__alltraps>

00101f23 <vector102>:
.globl vector102
vector102:
  pushl $0
  101f23:	6a 00                	push   $0x0
  pushl $102
  101f25:	6a 66                	push   $0x66
  jmp __alltraps
  101f27:	e9 4f fc ff ff       	jmp    101b7b <__alltraps>

00101f2c <vector103>:
.globl vector103
vector103:
  pushl $0
  101f2c:	6a 00                	push   $0x0
  pushl $103
  101f2e:	6a 67                	push   $0x67
  jmp __alltraps
  101f30:	e9 46 fc ff ff       	jmp    101b7b <__alltraps>

00101f35 <vector104>:
.globl vector104
vector104:
  pushl $0
  101f35:	6a 00                	push   $0x0
  pushl $104
  101f37:	6a 68                	push   $0x68
  jmp __alltraps
  101f39:	e9 3d fc ff ff       	jmp    101b7b <__alltraps>

00101f3e <vector105>:
.globl vector105
vector105:
  pushl $0
  101f3e:	6a 00                	push   $0x0
  pushl $105
  101f40:	6a 69                	push   $0x69
  jmp __alltraps
  101f42:	e9 34 fc ff ff       	jmp    101b7b <__alltraps>

00101f47 <vector106>:
.globl vector106
vector106:
  pushl $0
  101f47:	6a 00                	push   $0x0
  pushl $106
  101f49:	6a 6a                	push   $0x6a
  jmp __alltraps
  101f4b:	e9 2b fc ff ff       	jmp    101b7b <__alltraps>

00101f50 <vector107>:
.globl vector107
vector107:
  pushl $0
  101f50:	6a 00                	push   $0x0
  pushl $107
  101f52:	6a 6b                	push   $0x6b
  jmp __alltraps
  101f54:	e9 22 fc ff ff       	jmp    101b7b <__alltraps>

00101f59 <vector108>:
.globl vector108
vector108:
  pushl $0
  101f59:	6a 00                	push   $0x0
  pushl $108
  101f5b:	6a 6c                	push   $0x6c
  jmp __alltraps
  101f5d:	e9 19 fc ff ff       	jmp    101b7b <__alltraps>

00101f62 <vector109>:
.globl vector109
vector109:
  pushl $0
  101f62:	6a 00                	push   $0x0
  pushl $109
  101f64:	6a 6d                	push   $0x6d
  jmp __alltraps
  101f66:	e9 10 fc ff ff       	jmp    101b7b <__alltraps>

00101f6b <vector110>:
.globl vector110
vector110:
  pushl $0
  101f6b:	6a 00                	push   $0x0
  pushl $110
  101f6d:	6a 6e                	push   $0x6e
  jmp __alltraps
  101f6f:	e9 07 fc ff ff       	jmp    101b7b <__alltraps>

00101f74 <vector111>:
.globl vector111
vector111:
  pushl $0
  101f74:	6a 00                	push   $0x0
  pushl $111
  101f76:	6a 6f                	push   $0x6f
  jmp __alltraps
  101f78:	e9 fe fb ff ff       	jmp    101b7b <__alltraps>

00101f7d <vector112>:
.globl vector112
vector112:
  pushl $0
  101f7d:	6a 00                	push   $0x0
  pushl $112
  101f7f:	6a 70                	push   $0x70
  jmp __alltraps
  101f81:	e9 f5 fb ff ff       	jmp    101b7b <__alltraps>

00101f86 <vector113>:
.globl vector113
vector113:
  pushl $0
  101f86:	6a 00                	push   $0x0
  pushl $113
  101f88:	6a 71                	push   $0x71
  jmp __alltraps
  101f8a:	e9 ec fb ff ff       	jmp    101b7b <__alltraps>

00101f8f <vector114>:
.globl vector114
vector114:
  pushl $0
  101f8f:	6a 00                	push   $0x0
  pushl $114
  101f91:	6a 72                	push   $0x72
  jmp __alltraps
  101f93:	e9 e3 fb ff ff       	jmp    101b7b <__alltraps>

00101f98 <vector115>:
.globl vector115
vector115:
  pushl $0
  101f98:	6a 00                	push   $0x0
  pushl $115
  101f9a:	6a 73                	push   $0x73
  jmp __alltraps
  101f9c:	e9 da fb ff ff       	jmp    101b7b <__alltraps>

00101fa1 <vector116>:
.globl vector116
vector116:
  pushl $0
  101fa1:	6a 00                	push   $0x0
  pushl $116
  101fa3:	6a 74                	push   $0x74
  jmp __alltraps
  101fa5:	e9 d1 fb ff ff       	jmp    101b7b <__alltraps>

00101faa <vector117>:
.globl vector117
vector117:
  pushl $0
  101faa:	6a 00                	push   $0x0
  pushl $117
  101fac:	6a 75                	push   $0x75
  jmp __alltraps
  101fae:	e9 c8 fb ff ff       	jmp    101b7b <__alltraps>

00101fb3 <vector118>:
.globl vector118
vector118:
  pushl $0
  101fb3:	6a 00                	push   $0x0
  pushl $118
  101fb5:	6a 76                	push   $0x76
  jmp __alltraps
  101fb7:	e9 bf fb ff ff       	jmp    101b7b <__alltraps>

00101fbc <vector119>:
.globl vector119
vector119:
  pushl $0
  101fbc:	6a 00                	push   $0x0
  pushl $119
  101fbe:	6a 77                	push   $0x77
  jmp __alltraps
  101fc0:	e9 b6 fb ff ff       	jmp    101b7b <__alltraps>

00101fc5 <vector120>:
.globl vector120
vector120:
  pushl $0
  101fc5:	6a 00                	push   $0x0
  pushl $120
  101fc7:	6a 78                	push   $0x78
  jmp __alltraps
  101fc9:	e9 ad fb ff ff       	jmp    101b7b <__alltraps>

00101fce <vector121>:
.globl vector121
vector121:
  pushl $0
  101fce:	6a 00                	push   $0x0
  pushl $121
  101fd0:	6a 79                	push   $0x79
  jmp __alltraps
  101fd2:	e9 a4 fb ff ff       	jmp    101b7b <__alltraps>

00101fd7 <vector122>:
.globl vector122
vector122:
  pushl $0
  101fd7:	6a 00                	push   $0x0
  pushl $122
  101fd9:	6a 7a                	push   $0x7a
  jmp __alltraps
  101fdb:	e9 9b fb ff ff       	jmp    101b7b <__alltraps>

00101fe0 <vector123>:
.globl vector123
vector123:
  pushl $0
  101fe0:	6a 00                	push   $0x0
  pushl $123
  101fe2:	6a 7b                	push   $0x7b
  jmp __alltraps
  101fe4:	e9 92 fb ff ff       	jmp    101b7b <__alltraps>

00101fe9 <vector124>:
.globl vector124
vector124:
  pushl $0
  101fe9:	6a 00                	push   $0x0
  pushl $124
  101feb:	6a 7c                	push   $0x7c
  jmp __alltraps
  101fed:	e9 89 fb ff ff       	jmp    101b7b <__alltraps>

00101ff2 <vector125>:
.globl vector125
vector125:
  pushl $0
  101ff2:	6a 00                	push   $0x0
  pushl $125
  101ff4:	6a 7d                	push   $0x7d
  jmp __alltraps
  101ff6:	e9 80 fb ff ff       	jmp    101b7b <__alltraps>

00101ffb <vector126>:
.globl vector126
vector126:
  pushl $0
  101ffb:	6a 00                	push   $0x0
  pushl $126
  101ffd:	6a 7e                	push   $0x7e
  jmp __alltraps
  101fff:	e9 77 fb ff ff       	jmp    101b7b <__alltraps>

00102004 <vector127>:
.globl vector127
vector127:
  pushl $0
  102004:	6a 00                	push   $0x0
  pushl $127
  102006:	6a 7f                	push   $0x7f
  jmp __alltraps
  102008:	e9 6e fb ff ff       	jmp    101b7b <__alltraps>

0010200d <vector128>:
.globl vector128
vector128:
  pushl $0
  10200d:	6a 00                	push   $0x0
  pushl $128
  10200f:	68 80 00 00 00       	push   $0x80
  jmp __alltraps
  102014:	e9 62 fb ff ff       	jmp    101b7b <__alltraps>

00102019 <vector129>:
.globl vector129
vector129:
  pushl $0
  102019:	6a 00                	push   $0x0
  pushl $129
  10201b:	68 81 00 00 00       	push   $0x81
  jmp __alltraps
  102020:	e9 56 fb ff ff       	jmp    101b7b <__alltraps>

00102025 <vector130>:
.globl vector130
vector130:
  pushl $0
  102025:	6a 00                	push   $0x0
  pushl $130
  102027:	68 82 00 00 00       	push   $0x82
  jmp __alltraps
  10202c:	e9 4a fb ff ff       	jmp    101b7b <__alltraps>

00102031 <vector131>:
.globl vector131
vector131:
  pushl $0
  102031:	6a 00                	push   $0x0
  pushl $131
  102033:	68 83 00 00 00       	push   $0x83
  jmp __alltraps
  102038:	e9 3e fb ff ff       	jmp    101b7b <__alltraps>

0010203d <vector132>:
.globl vector132
vector132:
  pushl $0
  10203d:	6a 00                	push   $0x0
  pushl $132
  10203f:	68 84 00 00 00       	push   $0x84
  jmp __alltraps
  102044:	e9 32 fb ff ff       	jmp    101b7b <__alltraps>

00102049 <vector133>:
.globl vector133
vector133:
  pushl $0
  102049:	6a 00                	push   $0x0
  pushl $133
  10204b:	68 85 00 00 00       	push   $0x85
  jmp __alltraps
  102050:	e9 26 fb ff ff       	jmp    101b7b <__alltraps>

00102055 <vector134>:
.globl vector134
vector134:
  pushl $0
  102055:	6a 00                	push   $0x0
  pushl $134
  102057:	68 86 00 00 00       	push   $0x86
  jmp __alltraps
  10205c:	e9 1a fb ff ff       	jmp    101b7b <__alltraps>

00102061 <vector135>:
.globl vector135
vector135:
  pushl $0
  102061:	6a 00                	push   $0x0
  pushl $135
  102063:	68 87 00 00 00       	push   $0x87
  jmp __alltraps
  102068:	e9 0e fb ff ff       	jmp    101b7b <__alltraps>

0010206d <vector136>:
.globl vector136
vector136:
  pushl $0
  10206d:	6a 00                	push   $0x0
  pushl $136
  10206f:	68 88 00 00 00       	push   $0x88
  jmp __alltraps
  102074:	e9 02 fb ff ff       	jmp    101b7b <__alltraps>

00102079 <vector137>:
.globl vector137
vector137:
  pushl $0
  102079:	6a 00                	push   $0x0
  pushl $137
  10207b:	68 89 00 00 00       	push   $0x89
  jmp __alltraps
  102080:	e9 f6 fa ff ff       	jmp    101b7b <__alltraps>

00102085 <vector138>:
.globl vector138
vector138:
  pushl $0
  102085:	6a 00                	push   $0x0
  pushl $138
  102087:	68 8a 00 00 00       	push   $0x8a
  jmp __alltraps
  10208c:	e9 ea fa ff ff       	jmp    101b7b <__alltraps>

00102091 <vector139>:
.globl vector139
vector139:
  pushl $0
  102091:	6a 00                	push   $0x0
  pushl $139
  102093:	68 8b 00 00 00       	push   $0x8b
  jmp __alltraps
  102098:	e9 de fa ff ff       	jmp    101b7b <__alltraps>

0010209d <vector140>:
.globl vector140
vector140:
  pushl $0
  10209d:	6a 00                	push   $0x0
  pushl $140
  10209f:	68 8c 00 00 00       	push   $0x8c
  jmp __alltraps
  1020a4:	e9 d2 fa ff ff       	jmp    101b7b <__alltraps>

001020a9 <vector141>:
.globl vector141
vector141:
  pushl $0
  1020a9:	6a 00                	push   $0x0
  pushl $141
  1020ab:	68 8d 00 00 00       	push   $0x8d
  jmp __alltraps
  1020b0:	e9 c6 fa ff ff       	jmp    101b7b <__alltraps>

001020b5 <vector142>:
.globl vector142
vector142:
  pushl $0
  1020b5:	6a 00                	push   $0x0
  pushl $142
  1020b7:	68 8e 00 00 00       	push   $0x8e
  jmp __alltraps
  1020bc:	e9 ba fa ff ff       	jmp    101b7b <__alltraps>

001020c1 <vector143>:
.globl vector143
vector143:
  pushl $0
  1020c1:	6a 00                	push   $0x0
  pushl $143
  1020c3:	68 8f 00 00 00       	push   $0x8f
  jmp __alltraps
  1020c8:	e9 ae fa ff ff       	jmp    101b7b <__alltraps>

001020cd <vector144>:
.globl vector144
vector144:
  pushl $0
  1020cd:	6a 00                	push   $0x0
  pushl $144
  1020cf:	68 90 00 00 00       	push   $0x90
  jmp __alltraps
  1020d4:	e9 a2 fa ff ff       	jmp    101b7b <__alltraps>

001020d9 <vector145>:
.globl vector145
vector145:
  pushl $0
  1020d9:	6a 00                	push   $0x0
  pushl $145
  1020db:	68 91 00 00 00       	push   $0x91
  jmp __alltraps
  1020e0:	e9 96 fa ff ff       	jmp    101b7b <__alltraps>

001020e5 <vector146>:
.globl vector146
vector146:
  pushl $0
  1020e5:	6a 00                	push   $0x0
  pushl $146
  1020e7:	68 92 00 00 00       	push   $0x92
  jmp __alltraps
  1020ec:	e9 8a fa ff ff       	jmp    101b7b <__alltraps>

001020f1 <vector147>:
.globl vector147
vector147:
  pushl $0
  1020f1:	6a 00                	push   $0x0
  pushl $147
  1020f3:	68 93 00 00 00       	push   $0x93
  jmp __alltraps
  1020f8:	e9 7e fa ff ff       	jmp    101b7b <__alltraps>

001020fd <vector148>:
.globl vector148
vector148:
  pushl $0
  1020fd:	6a 00                	push   $0x0
  pushl $148
  1020ff:	68 94 00 00 00       	push   $0x94
  jmp __alltraps
  102104:	e9 72 fa ff ff       	jmp    101b7b <__alltraps>

00102109 <vector149>:
.globl vector149
vector149:
  pushl $0
  102109:	6a 00                	push   $0x0
  pushl $149
  10210b:	68 95 00 00 00       	push   $0x95
  jmp __alltraps
  102110:	e9 66 fa ff ff       	jmp    101b7b <__alltraps>

00102115 <vector150>:
.globl vector150
vector150:
  pushl $0
  102115:	6a 00                	push   $0x0
  pushl $150
  102117:	68 96 00 00 00       	push   $0x96
  jmp __alltraps
  10211c:	e9 5a fa ff ff       	jmp    101b7b <__alltraps>

00102121 <vector151>:
.globl vector151
vector151:
  pushl $0
  102121:	6a 00                	push   $0x0
  pushl $151
  102123:	68 97 00 00 00       	push   $0x97
  jmp __alltraps
  102128:	e9 4e fa ff ff       	jmp    101b7b <__alltraps>

0010212d <vector152>:
.globl vector152
vector152:
  pushl $0
  10212d:	6a 00                	push   $0x0
  pushl $152
  10212f:	68 98 00 00 00       	push   $0x98
  jmp __alltraps
  102134:	e9 42 fa ff ff       	jmp    101b7b <__alltraps>

00102139 <vector153>:
.globl vector153
vector153:
  pushl $0
  102139:	6a 00                	push   $0x0
  pushl $153
  10213b:	68 99 00 00 00       	push   $0x99
  jmp __alltraps
  102140:	e9 36 fa ff ff       	jmp    101b7b <__alltraps>

00102145 <vector154>:
.globl vector154
vector154:
  pushl $0
  102145:	6a 00                	push   $0x0
  pushl $154
  102147:	68 9a 00 00 00       	push   $0x9a
  jmp __alltraps
  10214c:	e9 2a fa ff ff       	jmp    101b7b <__alltraps>

00102151 <vector155>:
.globl vector155
vector155:
  pushl $0
  102151:	6a 00                	push   $0x0
  pushl $155
  102153:	68 9b 00 00 00       	push   $0x9b
  jmp __alltraps
  102158:	e9 1e fa ff ff       	jmp    101b7b <__alltraps>

0010215d <vector156>:
.globl vector156
vector156:
  pushl $0
  10215d:	6a 00                	push   $0x0
  pushl $156
  10215f:	68 9c 00 00 00       	push   $0x9c
  jmp __alltraps
  102164:	e9 12 fa ff ff       	jmp    101b7b <__alltraps>

00102169 <vector157>:
.globl vector157
vector157:
  pushl $0
  102169:	6a 00                	push   $0x0
  pushl $157
  10216b:	68 9d 00 00 00       	push   $0x9d
  jmp __alltraps
  102170:	e9 06 fa ff ff       	jmp    101b7b <__alltraps>

00102175 <vector158>:
.globl vector158
vector158:
  pushl $0
  102175:	6a 00                	push   $0x0
  pushl $158
  102177:	68 9e 00 00 00       	push   $0x9e
  jmp __alltraps
  10217c:	e9 fa f9 ff ff       	jmp    101b7b <__alltraps>

00102181 <vector159>:
.globl vector159
vector159:
  pushl $0
  102181:	6a 00                	push   $0x0
  pushl $159
  102183:	68 9f 00 00 00       	push   $0x9f
  jmp __alltraps
  102188:	e9 ee f9 ff ff       	jmp    101b7b <__alltraps>

0010218d <vector160>:
.globl vector160
vector160:
  pushl $0
  10218d:	6a 00                	push   $0x0
  pushl $160
  10218f:	68 a0 00 00 00       	push   $0xa0
  jmp __alltraps
  102194:	e9 e2 f9 ff ff       	jmp    101b7b <__alltraps>

00102199 <vector161>:
.globl vector161
vector161:
  pushl $0
  102199:	6a 00                	push   $0x0
  pushl $161
  10219b:	68 a1 00 00 00       	push   $0xa1
  jmp __alltraps
  1021a0:	e9 d6 f9 ff ff       	jmp    101b7b <__alltraps>

001021a5 <vector162>:
.globl vector162
vector162:
  pushl $0
  1021a5:	6a 00                	push   $0x0
  pushl $162
  1021a7:	68 a2 00 00 00       	push   $0xa2
  jmp __alltraps
  1021ac:	e9 ca f9 ff ff       	jmp    101b7b <__alltraps>

001021b1 <vector163>:
.globl vector163
vector163:
  pushl $0
  1021b1:	6a 00                	push   $0x0
  pushl $163
  1021b3:	68 a3 00 00 00       	push   $0xa3
  jmp __alltraps
  1021b8:	e9 be f9 ff ff       	jmp    101b7b <__alltraps>

001021bd <vector164>:
.globl vector164
vector164:
  pushl $0
  1021bd:	6a 00                	push   $0x0
  pushl $164
  1021bf:	68 a4 00 00 00       	push   $0xa4
  jmp __alltraps
  1021c4:	e9 b2 f9 ff ff       	jmp    101b7b <__alltraps>

001021c9 <vector165>:
.globl vector165
vector165:
  pushl $0
  1021c9:	6a 00                	push   $0x0
  pushl $165
  1021cb:	68 a5 00 00 00       	push   $0xa5
  jmp __alltraps
  1021d0:	e9 a6 f9 ff ff       	jmp    101b7b <__alltraps>

001021d5 <vector166>:
.globl vector166
vector166:
  pushl $0
  1021d5:	6a 00                	push   $0x0
  pushl $166
  1021d7:	68 a6 00 00 00       	push   $0xa6
  jmp __alltraps
  1021dc:	e9 9a f9 ff ff       	jmp    101b7b <__alltraps>

001021e1 <vector167>:
.globl vector167
vector167:
  pushl $0
  1021e1:	6a 00                	push   $0x0
  pushl $167
  1021e3:	68 a7 00 00 00       	push   $0xa7
  jmp __alltraps
  1021e8:	e9 8e f9 ff ff       	jmp    101b7b <__alltraps>

001021ed <vector168>:
.globl vector168
vector168:
  pushl $0
  1021ed:	6a 00                	push   $0x0
  pushl $168
  1021ef:	68 a8 00 00 00       	push   $0xa8
  jmp __alltraps
  1021f4:	e9 82 f9 ff ff       	jmp    101b7b <__alltraps>

001021f9 <vector169>:
.globl vector169
vector169:
  pushl $0
  1021f9:	6a 00                	push   $0x0
  pushl $169
  1021fb:	68 a9 00 00 00       	push   $0xa9
  jmp __alltraps
  102200:	e9 76 f9 ff ff       	jmp    101b7b <__alltraps>

00102205 <vector170>:
.globl vector170
vector170:
  pushl $0
  102205:	6a 00                	push   $0x0
  pushl $170
  102207:	68 aa 00 00 00       	push   $0xaa
  jmp __alltraps
  10220c:	e9 6a f9 ff ff       	jmp    101b7b <__alltraps>

00102211 <vector171>:
.globl vector171
vector171:
  pushl $0
  102211:	6a 00                	push   $0x0
  pushl $171
  102213:	68 ab 00 00 00       	push   $0xab
  jmp __alltraps
  102218:	e9 5e f9 ff ff       	jmp    101b7b <__alltraps>

0010221d <vector172>:
.globl vector172
vector172:
  pushl $0
  10221d:	6a 00                	push   $0x0
  pushl $172
  10221f:	68 ac 00 00 00       	push   $0xac
  jmp __alltraps
  102224:	e9 52 f9 ff ff       	jmp    101b7b <__alltraps>

00102229 <vector173>:
.globl vector173
vector173:
  pushl $0
  102229:	6a 00                	push   $0x0
  pushl $173
  10222b:	68 ad 00 00 00       	push   $0xad
  jmp __alltraps
  102230:	e9 46 f9 ff ff       	jmp    101b7b <__alltraps>

00102235 <vector174>:
.globl vector174
vector174:
  pushl $0
  102235:	6a 00                	push   $0x0
  pushl $174
  102237:	68 ae 00 00 00       	push   $0xae
  jmp __alltraps
  10223c:	e9 3a f9 ff ff       	jmp    101b7b <__alltraps>

00102241 <vector175>:
.globl vector175
vector175:
  pushl $0
  102241:	6a 00                	push   $0x0
  pushl $175
  102243:	68 af 00 00 00       	push   $0xaf
  jmp __alltraps
  102248:	e9 2e f9 ff ff       	jmp    101b7b <__alltraps>

0010224d <vector176>:
.globl vector176
vector176:
  pushl $0
  10224d:	6a 00                	push   $0x0
  pushl $176
  10224f:	68 b0 00 00 00       	push   $0xb0
  jmp __alltraps
  102254:	e9 22 f9 ff ff       	jmp    101b7b <__alltraps>

00102259 <vector177>:
.globl vector177
vector177:
  pushl $0
  102259:	6a 00                	push   $0x0
  pushl $177
  10225b:	68 b1 00 00 00       	push   $0xb1
  jmp __alltraps
  102260:	e9 16 f9 ff ff       	jmp    101b7b <__alltraps>

00102265 <vector178>:
.globl vector178
vector178:
  pushl $0
  102265:	6a 00                	push   $0x0
  pushl $178
  102267:	68 b2 00 00 00       	push   $0xb2
  jmp __alltraps
  10226c:	e9 0a f9 ff ff       	jmp    101b7b <__alltraps>

00102271 <vector179>:
.globl vector179
vector179:
  pushl $0
  102271:	6a 00                	push   $0x0
  pushl $179
  102273:	68 b3 00 00 00       	push   $0xb3
  jmp __alltraps
  102278:	e9 fe f8 ff ff       	jmp    101b7b <__alltraps>

0010227d <vector180>:
.globl vector180
vector180:
  pushl $0
  10227d:	6a 00                	push   $0x0
  pushl $180
  10227f:	68 b4 00 00 00       	push   $0xb4
  jmp __alltraps
  102284:	e9 f2 f8 ff ff       	jmp    101b7b <__alltraps>

00102289 <vector181>:
.globl vector181
vector181:
  pushl $0
  102289:	6a 00                	push   $0x0
  pushl $181
  10228b:	68 b5 00 00 00       	push   $0xb5
  jmp __alltraps
  102290:	e9 e6 f8 ff ff       	jmp    101b7b <__alltraps>

00102295 <vector182>:
.globl vector182
vector182:
  pushl $0
  102295:	6a 00                	push   $0x0
  pushl $182
  102297:	68 b6 00 00 00       	push   $0xb6
  jmp __alltraps
  10229c:	e9 da f8 ff ff       	jmp    101b7b <__alltraps>

001022a1 <vector183>:
.globl vector183
vector183:
  pushl $0
  1022a1:	6a 00                	push   $0x0
  pushl $183
  1022a3:	68 b7 00 00 00       	push   $0xb7
  jmp __alltraps
  1022a8:	e9 ce f8 ff ff       	jmp    101b7b <__alltraps>

001022ad <vector184>:
.globl vector184
vector184:
  pushl $0
  1022ad:	6a 00                	push   $0x0
  pushl $184
  1022af:	68 b8 00 00 00       	push   $0xb8
  jmp __alltraps
  1022b4:	e9 c2 f8 ff ff       	jmp    101b7b <__alltraps>

001022b9 <vector185>:
.globl vector185
vector185:
  pushl $0
  1022b9:	6a 00                	push   $0x0
  pushl $185
  1022bb:	68 b9 00 00 00       	push   $0xb9
  jmp __alltraps
  1022c0:	e9 b6 f8 ff ff       	jmp    101b7b <__alltraps>

001022c5 <vector186>:
.globl vector186
vector186:
  pushl $0
  1022c5:	6a 00                	push   $0x0
  pushl $186
  1022c7:	68 ba 00 00 00       	push   $0xba
  jmp __alltraps
  1022cc:	e9 aa f8 ff ff       	jmp    101b7b <__alltraps>

001022d1 <vector187>:
.globl vector187
vector187:
  pushl $0
  1022d1:	6a 00                	push   $0x0
  pushl $187
  1022d3:	68 bb 00 00 00       	push   $0xbb
  jmp __alltraps
  1022d8:	e9 9e f8 ff ff       	jmp    101b7b <__alltraps>

001022dd <vector188>:
.globl vector188
vector188:
  pushl $0
  1022dd:	6a 00                	push   $0x0
  pushl $188
  1022df:	68 bc 00 00 00       	push   $0xbc
  jmp __alltraps
  1022e4:	e9 92 f8 ff ff       	jmp    101b7b <__alltraps>

001022e9 <vector189>:
.globl vector189
vector189:
  pushl $0
  1022e9:	6a 00                	push   $0x0
  pushl $189
  1022eb:	68 bd 00 00 00       	push   $0xbd
  jmp __alltraps
  1022f0:	e9 86 f8 ff ff       	jmp    101b7b <__alltraps>

001022f5 <vector190>:
.globl vector190
vector190:
  pushl $0
  1022f5:	6a 00                	push   $0x0
  pushl $190
  1022f7:	68 be 00 00 00       	push   $0xbe
  jmp __alltraps
  1022fc:	e9 7a f8 ff ff       	jmp    101b7b <__alltraps>

00102301 <vector191>:
.globl vector191
vector191:
  pushl $0
  102301:	6a 00                	push   $0x0
  pushl $191
  102303:	68 bf 00 00 00       	push   $0xbf
  jmp __alltraps
  102308:	e9 6e f8 ff ff       	jmp    101b7b <__alltraps>

0010230d <vector192>:
.globl vector192
vector192:
  pushl $0
  10230d:	6a 00                	push   $0x0
  pushl $192
  10230f:	68 c0 00 00 00       	push   $0xc0
  jmp __alltraps
  102314:	e9 62 f8 ff ff       	jmp    101b7b <__alltraps>

00102319 <vector193>:
.globl vector193
vector193:
  pushl $0
  102319:	6a 00                	push   $0x0
  pushl $193
  10231b:	68 c1 00 00 00       	push   $0xc1
  jmp __alltraps
  102320:	e9 56 f8 ff ff       	jmp    101b7b <__alltraps>

00102325 <vector194>:
.globl vector194
vector194:
  pushl $0
  102325:	6a 00                	push   $0x0
  pushl $194
  102327:	68 c2 00 00 00       	push   $0xc2
  jmp __alltraps
  10232c:	e9 4a f8 ff ff       	jmp    101b7b <__alltraps>

00102331 <vector195>:
.globl vector195
vector195:
  pushl $0
  102331:	6a 00                	push   $0x0
  pushl $195
  102333:	68 c3 00 00 00       	push   $0xc3
  jmp __alltraps
  102338:	e9 3e f8 ff ff       	jmp    101b7b <__alltraps>

0010233d <vector196>:
.globl vector196
vector196:
  pushl $0
  10233d:	6a 00                	push   $0x0
  pushl $196
  10233f:	68 c4 00 00 00       	push   $0xc4
  jmp __alltraps
  102344:	e9 32 f8 ff ff       	jmp    101b7b <__alltraps>

00102349 <vector197>:
.globl vector197
vector197:
  pushl $0
  102349:	6a 00                	push   $0x0
  pushl $197
  10234b:	68 c5 00 00 00       	push   $0xc5
  jmp __alltraps
  102350:	e9 26 f8 ff ff       	jmp    101b7b <__alltraps>

00102355 <vector198>:
.globl vector198
vector198:
  pushl $0
  102355:	6a 00                	push   $0x0
  pushl $198
  102357:	68 c6 00 00 00       	push   $0xc6
  jmp __alltraps
  10235c:	e9 1a f8 ff ff       	jmp    101b7b <__alltraps>

00102361 <vector199>:
.globl vector199
vector199:
  pushl $0
  102361:	6a 00                	push   $0x0
  pushl $199
  102363:	68 c7 00 00 00       	push   $0xc7
  jmp __alltraps
  102368:	e9 0e f8 ff ff       	jmp    101b7b <__alltraps>

0010236d <vector200>:
.globl vector200
vector200:
  pushl $0
  10236d:	6a 00                	push   $0x0
  pushl $200
  10236f:	68 c8 00 00 00       	push   $0xc8
  jmp __alltraps
  102374:	e9 02 f8 ff ff       	jmp    101b7b <__alltraps>

00102379 <vector201>:
.globl vector201
vector201:
  pushl $0
  102379:	6a 00                	push   $0x0
  pushl $201
  10237b:	68 c9 00 00 00       	push   $0xc9
  jmp __alltraps
  102380:	e9 f6 f7 ff ff       	jmp    101b7b <__alltraps>

00102385 <vector202>:
.globl vector202
vector202:
  pushl $0
  102385:	6a 00                	push   $0x0
  pushl $202
  102387:	68 ca 00 00 00       	push   $0xca
  jmp __alltraps
  10238c:	e9 ea f7 ff ff       	jmp    101b7b <__alltraps>

00102391 <vector203>:
.globl vector203
vector203:
  pushl $0
  102391:	6a 00                	push   $0x0
  pushl $203
  102393:	68 cb 00 00 00       	push   $0xcb
  jmp __alltraps
  102398:	e9 de f7 ff ff       	jmp    101b7b <__alltraps>

0010239d <vector204>:
.globl vector204
vector204:
  pushl $0
  10239d:	6a 00                	push   $0x0
  pushl $204
  10239f:	68 cc 00 00 00       	push   $0xcc
  jmp __alltraps
  1023a4:	e9 d2 f7 ff ff       	jmp    101b7b <__alltraps>

001023a9 <vector205>:
.globl vector205
vector205:
  pushl $0
  1023a9:	6a 00                	push   $0x0
  pushl $205
  1023ab:	68 cd 00 00 00       	push   $0xcd
  jmp __alltraps
  1023b0:	e9 c6 f7 ff ff       	jmp    101b7b <__alltraps>

001023b5 <vector206>:
.globl vector206
vector206:
  pushl $0
  1023b5:	6a 00                	push   $0x0
  pushl $206
  1023b7:	68 ce 00 00 00       	push   $0xce
  jmp __alltraps
  1023bc:	e9 ba f7 ff ff       	jmp    101b7b <__alltraps>

001023c1 <vector207>:
.globl vector207
vector207:
  pushl $0
  1023c1:	6a 00                	push   $0x0
  pushl $207
  1023c3:	68 cf 00 00 00       	push   $0xcf
  jmp __alltraps
  1023c8:	e9 ae f7 ff ff       	jmp    101b7b <__alltraps>

001023cd <vector208>:
.globl vector208
vector208:
  pushl $0
  1023cd:	6a 00                	push   $0x0
  pushl $208
  1023cf:	68 d0 00 00 00       	push   $0xd0
  jmp __alltraps
  1023d4:	e9 a2 f7 ff ff       	jmp    101b7b <__alltraps>

001023d9 <vector209>:
.globl vector209
vector209:
  pushl $0
  1023d9:	6a 00                	push   $0x0
  pushl $209
  1023db:	68 d1 00 00 00       	push   $0xd1
  jmp __alltraps
  1023e0:	e9 96 f7 ff ff       	jmp    101b7b <__alltraps>

001023e5 <vector210>:
.globl vector210
vector210:
  pushl $0
  1023e5:	6a 00                	push   $0x0
  pushl $210
  1023e7:	68 d2 00 00 00       	push   $0xd2
  jmp __alltraps
  1023ec:	e9 8a f7 ff ff       	jmp    101b7b <__alltraps>

001023f1 <vector211>:
.globl vector211
vector211:
  pushl $0
  1023f1:	6a 00                	push   $0x0
  pushl $211
  1023f3:	68 d3 00 00 00       	push   $0xd3
  jmp __alltraps
  1023f8:	e9 7e f7 ff ff       	jmp    101b7b <__alltraps>

001023fd <vector212>:
.globl vector212
vector212:
  pushl $0
  1023fd:	6a 00                	push   $0x0
  pushl $212
  1023ff:	68 d4 00 00 00       	push   $0xd4
  jmp __alltraps
  102404:	e9 72 f7 ff ff       	jmp    101b7b <__alltraps>

00102409 <vector213>:
.globl vector213
vector213:
  pushl $0
  102409:	6a 00                	push   $0x0
  pushl $213
  10240b:	68 d5 00 00 00       	push   $0xd5
  jmp __alltraps
  102410:	e9 66 f7 ff ff       	jmp    101b7b <__alltraps>

00102415 <vector214>:
.globl vector214
vector214:
  pushl $0
  102415:	6a 00                	push   $0x0
  pushl $214
  102417:	68 d6 00 00 00       	push   $0xd6
  jmp __alltraps
  10241c:	e9 5a f7 ff ff       	jmp    101b7b <__alltraps>

00102421 <vector215>:
.globl vector215
vector215:
  pushl $0
  102421:	6a 00                	push   $0x0
  pushl $215
  102423:	68 d7 00 00 00       	push   $0xd7
  jmp __alltraps
  102428:	e9 4e f7 ff ff       	jmp    101b7b <__alltraps>

0010242d <vector216>:
.globl vector216
vector216:
  pushl $0
  10242d:	6a 00                	push   $0x0
  pushl $216
  10242f:	68 d8 00 00 00       	push   $0xd8
  jmp __alltraps
  102434:	e9 42 f7 ff ff       	jmp    101b7b <__alltraps>

00102439 <vector217>:
.globl vector217
vector217:
  pushl $0
  102439:	6a 00                	push   $0x0
  pushl $217
  10243b:	68 d9 00 00 00       	push   $0xd9
  jmp __alltraps
  102440:	e9 36 f7 ff ff       	jmp    101b7b <__alltraps>

00102445 <vector218>:
.globl vector218
vector218:
  pushl $0
  102445:	6a 00                	push   $0x0
  pushl $218
  102447:	68 da 00 00 00       	push   $0xda
  jmp __alltraps
  10244c:	e9 2a f7 ff ff       	jmp    101b7b <__alltraps>

00102451 <vector219>:
.globl vector219
vector219:
  pushl $0
  102451:	6a 00                	push   $0x0
  pushl $219
  102453:	68 db 00 00 00       	push   $0xdb
  jmp __alltraps
  102458:	e9 1e f7 ff ff       	jmp    101b7b <__alltraps>

0010245d <vector220>:
.globl vector220
vector220:
  pushl $0
  10245d:	6a 00                	push   $0x0
  pushl $220
  10245f:	68 dc 00 00 00       	push   $0xdc
  jmp __alltraps
  102464:	e9 12 f7 ff ff       	jmp    101b7b <__alltraps>

00102469 <vector221>:
.globl vector221
vector221:
  pushl $0
  102469:	6a 00                	push   $0x0
  pushl $221
  10246b:	68 dd 00 00 00       	push   $0xdd
  jmp __alltraps
  102470:	e9 06 f7 ff ff       	jmp    101b7b <__alltraps>

00102475 <vector222>:
.globl vector222
vector222:
  pushl $0
  102475:	6a 00                	push   $0x0
  pushl $222
  102477:	68 de 00 00 00       	push   $0xde
  jmp __alltraps
  10247c:	e9 fa f6 ff ff       	jmp    101b7b <__alltraps>

00102481 <vector223>:
.globl vector223
vector223:
  pushl $0
  102481:	6a 00                	push   $0x0
  pushl $223
  102483:	68 df 00 00 00       	push   $0xdf
  jmp __alltraps
  102488:	e9 ee f6 ff ff       	jmp    101b7b <__alltraps>

0010248d <vector224>:
.globl vector224
vector224:
  pushl $0
  10248d:	6a 00                	push   $0x0
  pushl $224
  10248f:	68 e0 00 00 00       	push   $0xe0
  jmp __alltraps
  102494:	e9 e2 f6 ff ff       	jmp    101b7b <__alltraps>

00102499 <vector225>:
.globl vector225
vector225:
  pushl $0
  102499:	6a 00                	push   $0x0
  pushl $225
  10249b:	68 e1 00 00 00       	push   $0xe1
  jmp __alltraps
  1024a0:	e9 d6 f6 ff ff       	jmp    101b7b <__alltraps>

001024a5 <vector226>:
.globl vector226
vector226:
  pushl $0
  1024a5:	6a 00                	push   $0x0
  pushl $226
  1024a7:	68 e2 00 00 00       	push   $0xe2
  jmp __alltraps
  1024ac:	e9 ca f6 ff ff       	jmp    101b7b <__alltraps>

001024b1 <vector227>:
.globl vector227
vector227:
  pushl $0
  1024b1:	6a 00                	push   $0x0
  pushl $227
  1024b3:	68 e3 00 00 00       	push   $0xe3
  jmp __alltraps
  1024b8:	e9 be f6 ff ff       	jmp    101b7b <__alltraps>

001024bd <vector228>:
.globl vector228
vector228:
  pushl $0
  1024bd:	6a 00                	push   $0x0
  pushl $228
  1024bf:	68 e4 00 00 00       	push   $0xe4
  jmp __alltraps
  1024c4:	e9 b2 f6 ff ff       	jmp    101b7b <__alltraps>

001024c9 <vector229>:
.globl vector229
vector229:
  pushl $0
  1024c9:	6a 00                	push   $0x0
  pushl $229
  1024cb:	68 e5 00 00 00       	push   $0xe5
  jmp __alltraps
  1024d0:	e9 a6 f6 ff ff       	jmp    101b7b <__alltraps>

001024d5 <vector230>:
.globl vector230
vector230:
  pushl $0
  1024d5:	6a 00                	push   $0x0
  pushl $230
  1024d7:	68 e6 00 00 00       	push   $0xe6
  jmp __alltraps
  1024dc:	e9 9a f6 ff ff       	jmp    101b7b <__alltraps>

001024e1 <vector231>:
.globl vector231
vector231:
  pushl $0
  1024e1:	6a 00                	push   $0x0
  pushl $231
  1024e3:	68 e7 00 00 00       	push   $0xe7
  jmp __alltraps
  1024e8:	e9 8e f6 ff ff       	jmp    101b7b <__alltraps>

001024ed <vector232>:
.globl vector232
vector232:
  pushl $0
  1024ed:	6a 00                	push   $0x0
  pushl $232
  1024ef:	68 e8 00 00 00       	push   $0xe8
  jmp __alltraps
  1024f4:	e9 82 f6 ff ff       	jmp    101b7b <__alltraps>

001024f9 <vector233>:
.globl vector233
vector233:
  pushl $0
  1024f9:	6a 00                	push   $0x0
  pushl $233
  1024fb:	68 e9 00 00 00       	push   $0xe9
  jmp __alltraps
  102500:	e9 76 f6 ff ff       	jmp    101b7b <__alltraps>

00102505 <vector234>:
.globl vector234
vector234:
  pushl $0
  102505:	6a 00                	push   $0x0
  pushl $234
  102507:	68 ea 00 00 00       	push   $0xea
  jmp __alltraps
  10250c:	e9 6a f6 ff ff       	jmp    101b7b <__alltraps>

00102511 <vector235>:
.globl vector235
vector235:
  pushl $0
  102511:	6a 00                	push   $0x0
  pushl $235
  102513:	68 eb 00 00 00       	push   $0xeb
  jmp __alltraps
  102518:	e9 5e f6 ff ff       	jmp    101b7b <__alltraps>

0010251d <vector236>:
.globl vector236
vector236:
  pushl $0
  10251d:	6a 00                	push   $0x0
  pushl $236
  10251f:	68 ec 00 00 00       	push   $0xec
  jmp __alltraps
  102524:	e9 52 f6 ff ff       	jmp    101b7b <__alltraps>

00102529 <vector237>:
.globl vector237
vector237:
  pushl $0
  102529:	6a 00                	push   $0x0
  pushl $237
  10252b:	68 ed 00 00 00       	push   $0xed
  jmp __alltraps
  102530:	e9 46 f6 ff ff       	jmp    101b7b <__alltraps>

00102535 <vector238>:
.globl vector238
vector238:
  pushl $0
  102535:	6a 00                	push   $0x0
  pushl $238
  102537:	68 ee 00 00 00       	push   $0xee
  jmp __alltraps
  10253c:	e9 3a f6 ff ff       	jmp    101b7b <__alltraps>

00102541 <vector239>:
.globl vector239
vector239:
  pushl $0
  102541:	6a 00                	push   $0x0
  pushl $239
  102543:	68 ef 00 00 00       	push   $0xef
  jmp __alltraps
  102548:	e9 2e f6 ff ff       	jmp    101b7b <__alltraps>

0010254d <vector240>:
.globl vector240
vector240:
  pushl $0
  10254d:	6a 00                	push   $0x0
  pushl $240
  10254f:	68 f0 00 00 00       	push   $0xf0
  jmp __alltraps
  102554:	e9 22 f6 ff ff       	jmp    101b7b <__alltraps>

00102559 <vector241>:
.globl vector241
vector241:
  pushl $0
  102559:	6a 00                	push   $0x0
  pushl $241
  10255b:	68 f1 00 00 00       	push   $0xf1
  jmp __alltraps
  102560:	e9 16 f6 ff ff       	jmp    101b7b <__alltraps>

00102565 <vector242>:
.globl vector242
vector242:
  pushl $0
  102565:	6a 00                	push   $0x0
  pushl $242
  102567:	68 f2 00 00 00       	push   $0xf2
  jmp __alltraps
  10256c:	e9 0a f6 ff ff       	jmp    101b7b <__alltraps>

00102571 <vector243>:
.globl vector243
vector243:
  pushl $0
  102571:	6a 00                	push   $0x0
  pushl $243
  102573:	68 f3 00 00 00       	push   $0xf3
  jmp __alltraps
  102578:	e9 fe f5 ff ff       	jmp    101b7b <__alltraps>

0010257d <vector244>:
.globl vector244
vector244:
  pushl $0
  10257d:	6a 00                	push   $0x0
  pushl $244
  10257f:	68 f4 00 00 00       	push   $0xf4
  jmp __alltraps
  102584:	e9 f2 f5 ff ff       	jmp    101b7b <__alltraps>

00102589 <vector245>:
.globl vector245
vector245:
  pushl $0
  102589:	6a 00                	push   $0x0
  pushl $245
  10258b:	68 f5 00 00 00       	push   $0xf5
  jmp __alltraps
  102590:	e9 e6 f5 ff ff       	jmp    101b7b <__alltraps>

00102595 <vector246>:
.globl vector246
vector246:
  pushl $0
  102595:	6a 00                	push   $0x0
  pushl $246
  102597:	68 f6 00 00 00       	push   $0xf6
  jmp __alltraps
  10259c:	e9 da f5 ff ff       	jmp    101b7b <__alltraps>

001025a1 <vector247>:
.globl vector247
vector247:
  pushl $0
  1025a1:	6a 00                	push   $0x0
  pushl $247
  1025a3:	68 f7 00 00 00       	push   $0xf7
  jmp __alltraps
  1025a8:	e9 ce f5 ff ff       	jmp    101b7b <__alltraps>

001025ad <vector248>:
.globl vector248
vector248:
  pushl $0
  1025ad:	6a 00                	push   $0x0
  pushl $248
  1025af:	68 f8 00 00 00       	push   $0xf8
  jmp __alltraps
  1025b4:	e9 c2 f5 ff ff       	jmp    101b7b <__alltraps>

001025b9 <vector249>:
.globl vector249
vector249:
  pushl $0
  1025b9:	6a 00                	push   $0x0
  pushl $249
  1025bb:	68 f9 00 00 00       	push   $0xf9
  jmp __alltraps
  1025c0:	e9 b6 f5 ff ff       	jmp    101b7b <__alltraps>

001025c5 <vector250>:
.globl vector250
vector250:
  pushl $0
  1025c5:	6a 00                	push   $0x0
  pushl $250
  1025c7:	68 fa 00 00 00       	push   $0xfa
  jmp __alltraps
  1025cc:	e9 aa f5 ff ff       	jmp    101b7b <__alltraps>

001025d1 <vector251>:
.globl vector251
vector251:
  pushl $0
  1025d1:	6a 00                	push   $0x0
  pushl $251
  1025d3:	68 fb 00 00 00       	push   $0xfb
  jmp __alltraps
  1025d8:	e9 9e f5 ff ff       	jmp    101b7b <__alltraps>

001025dd <vector252>:
.globl vector252
vector252:
  pushl $0
  1025dd:	6a 00                	push   $0x0
  pushl $252
  1025df:	68 fc 00 00 00       	push   $0xfc
  jmp __alltraps
  1025e4:	e9 92 f5 ff ff       	jmp    101b7b <__alltraps>

001025e9 <vector253>:
.globl vector253
vector253:
  pushl $0
  1025e9:	6a 00                	push   $0x0
  pushl $253
  1025eb:	68 fd 00 00 00       	push   $0xfd
  jmp __alltraps
  1025f0:	e9 86 f5 ff ff       	jmp    101b7b <__alltraps>

001025f5 <vector254>:
.globl vector254
vector254:
  pushl $0
  1025f5:	6a 00                	push   $0x0
  pushl $254
  1025f7:	68 fe 00 00 00       	push   $0xfe
  jmp __alltraps
  1025fc:	e9 7a f5 ff ff       	jmp    101b7b <__alltraps>

00102601 <vector255>:
.globl vector255
vector255:
  pushl $0
  102601:	6a 00                	push   $0x0
  pushl $255
  102603:	68 ff 00 00 00       	push   $0xff
  jmp __alltraps
  102608:	e9 6e f5 ff ff       	jmp    101b7b <__alltraps>

0010260d <lgdt>:
/* *
 * lgdt - load the global descriptor table register and reset the
 * data/code segement registers for kernel.
 * */
static inline void
lgdt(struct pseudodesc *pd) {
  10260d:	55                   	push   %ebp
  10260e:	89 e5                	mov    %esp,%ebp
    asm volatile ("lgdt (%0)" :: "r" (pd));
  102610:	8b 45 08             	mov    0x8(%ebp),%eax
  102613:	0f 01 10             	lgdtl  (%eax)
    asm volatile ("movw %%ax, %%gs" :: "a" (USER_DS));
  102616:	b8 23 00 00 00       	mov    $0x23,%eax
  10261b:	8e e8                	mov    %eax,%gs
    asm volatile ("movw %%ax, %%fs" :: "a" (USER_DS));
  10261d:	b8 23 00 00 00       	mov    $0x23,%eax
  102622:	8e e0                	mov    %eax,%fs
    asm volatile ("movw %%ax, %%es" :: "a" (KERNEL_DS));
  102624:	b8 10 00 00 00       	mov    $0x10,%eax
  102629:	8e c0                	mov    %eax,%es
    asm volatile ("movw %%ax, %%ds" :: "a" (KERNEL_DS));
  10262b:	b8 10 00 00 00       	mov    $0x10,%eax
  102630:	8e d8                	mov    %eax,%ds
    asm volatile ("movw %%ax, %%ss" :: "a" (KERNEL_DS));
  102632:	b8 10 00 00 00       	mov    $0x10,%eax
  102637:	8e d0                	mov    %eax,%ss
    // reload cs
    asm volatile ("ljmp %0, $1f\n 1:\n" :: "i" (KERNEL_CS));
  102639:	ea 40 26 10 00 08 00 	ljmp   $0x8,$0x102640
}
  102640:	5d                   	pop    %ebp
  102641:	c3                   	ret    

00102642 <gdt_init>:
/* temporary kernel stack */
uint8_t stack0[1024];

/* gdt_init - initialize the default GDT and TSS */
static void
gdt_init(void) {
  102642:	55                   	push   %ebp
  102643:	89 e5                	mov    %esp,%ebp
  102645:	83 ec 14             	sub    $0x14,%esp
    // Setup a TSS so that we can get the right stack when we trap from
    // user to the kernel. But not safe here, it's only a temporary value,
    // it will be set to KSTACKTOP in lab2.
    ts.ts_esp0 = (uint32_t)&stack0 + sizeof(stack0);
  102648:	b8 20 f9 10 00       	mov    $0x10f920,%eax
  10264d:	05 00 04 00 00       	add    $0x400,%eax
  102652:	a3 a4 f8 10 00       	mov    %eax,0x10f8a4
    ts.ts_ss0 = KERNEL_DS;
  102657:	66 c7 05 a8 f8 10 00 	movw   $0x10,0x10f8a8
  10265e:	10 00 

    // initialize the TSS filed of the gdt
    gdt[SEG_TSS] = SEG16(STS_T32A, (uint32_t)&ts, sizeof(ts), DPL_KERNEL);
  102660:	66 c7 05 08 ea 10 00 	movw   $0x68,0x10ea08
  102667:	68 00 
  102669:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  10266e:	66 a3 0a ea 10 00    	mov    %ax,0x10ea0a
  102674:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  102679:	c1 e8 10             	shr    $0x10,%eax
  10267c:	a2 0c ea 10 00       	mov    %al,0x10ea0c
  102681:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102688:	83 e0 f0             	and    $0xfffffff0,%eax
  10268b:	83 c8 09             	or     $0x9,%eax
  10268e:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  102693:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  10269a:	83 c8 10             	or     $0x10,%eax
  10269d:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  1026a2:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  1026a9:	83 e0 9f             	and    $0xffffff9f,%eax
  1026ac:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  1026b1:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  1026b8:	83 c8 80             	or     $0xffffff80,%eax
  1026bb:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  1026c0:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  1026c7:	83 e0 f0             	and    $0xfffffff0,%eax
  1026ca:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  1026cf:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  1026d6:	83 e0 ef             	and    $0xffffffef,%eax
  1026d9:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  1026de:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  1026e5:	83 e0 df             	and    $0xffffffdf,%eax
  1026e8:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  1026ed:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  1026f4:	83 c8 40             	or     $0x40,%eax
  1026f7:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  1026fc:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102703:	83 e0 7f             	and    $0x7f,%eax
  102706:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  10270b:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  102710:	c1 e8 18             	shr    $0x18,%eax
  102713:	a2 0f ea 10 00       	mov    %al,0x10ea0f
    gdt[SEG_TSS].sd_s = 0;
  102718:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  10271f:	83 e0 ef             	and    $0xffffffef,%eax
  102722:	a2 0d ea 10 00       	mov    %al,0x10ea0d

    // reload all segment registers
    lgdt(&gdt_pd);
  102727:	c7 04 24 10 ea 10 00 	movl   $0x10ea10,(%esp)
  10272e:	e8 da fe ff ff       	call   10260d <lgdt>
  102733:	66 c7 45 fe 28 00    	movw   $0x28,-0x2(%ebp)
    asm volatile ("cli");
}

static inline void
ltr(uint16_t sel) {
    asm volatile ("ltr %0" :: "r" (sel));
  102739:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  10273d:	0f 00 d8             	ltr    %ax

    // load the TSS
    ltr(GD_TSS);
}
  102740:	c9                   	leave  
  102741:	c3                   	ret    

00102742 <pmm_init>:

/* pmm_init - initialize the physical memory management */
void
pmm_init(void) {
  102742:	55                   	push   %ebp
  102743:	89 e5                	mov    %esp,%ebp
    gdt_init();
  102745:	e8 f8 fe ff ff       	call   102642 <gdt_init>
}
  10274a:	5d                   	pop    %ebp
  10274b:	c3                   	ret    

0010274c <printnum>:
 * @width:         maximum number of digits, if the actual width is less than @width, use @padc instead
 * @padc:        character that padded on the left if the actual width is less than @width
 * */
static void
printnum(void (*putch)(int, void*), void *putdat,
        unsigned long long num, unsigned base, int width, int padc) {
  10274c:	55                   	push   %ebp
  10274d:	89 e5                	mov    %esp,%ebp
  10274f:	83 ec 58             	sub    $0x58,%esp
  102752:	8b 45 10             	mov    0x10(%ebp),%eax
  102755:	89 45 d0             	mov    %eax,-0x30(%ebp)
  102758:	8b 45 14             	mov    0x14(%ebp),%eax
  10275b:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    unsigned long long result = num;
  10275e:	8b 45 d0             	mov    -0x30(%ebp),%eax
  102761:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  102764:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102767:	89 55 ec             	mov    %edx,-0x14(%ebp)
    unsigned mod = do_div(result, base);
  10276a:	8b 45 18             	mov    0x18(%ebp),%eax
  10276d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102770:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102773:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102776:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102779:	89 55 f0             	mov    %edx,-0x10(%ebp)
  10277c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10277f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102782:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  102786:	74 1c                	je     1027a4 <printnum+0x58>
  102788:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10278b:	ba 00 00 00 00       	mov    $0x0,%edx
  102790:	f7 75 e4             	divl   -0x1c(%ebp)
  102793:	89 55 f4             	mov    %edx,-0xc(%ebp)
  102796:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102799:	ba 00 00 00 00       	mov    $0x0,%edx
  10279e:	f7 75 e4             	divl   -0x1c(%ebp)
  1027a1:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1027a4:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1027a7:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1027aa:	f7 75 e4             	divl   -0x1c(%ebp)
  1027ad:	89 45 e0             	mov    %eax,-0x20(%ebp)
  1027b0:	89 55 dc             	mov    %edx,-0x24(%ebp)
  1027b3:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1027b6:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1027b9:	89 45 e8             	mov    %eax,-0x18(%ebp)
  1027bc:	89 55 ec             	mov    %edx,-0x14(%ebp)
  1027bf:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1027c2:	89 45 d8             	mov    %eax,-0x28(%ebp)

    // first recursively print all preceding (more significant) digits
    if (num >= base) {
  1027c5:	8b 45 18             	mov    0x18(%ebp),%eax
  1027c8:	ba 00 00 00 00       	mov    $0x0,%edx
  1027cd:	3b 55 d4             	cmp    -0x2c(%ebp),%edx
  1027d0:	77 56                	ja     102828 <printnum+0xdc>
  1027d2:	3b 55 d4             	cmp    -0x2c(%ebp),%edx
  1027d5:	72 05                	jb     1027dc <printnum+0x90>
  1027d7:	3b 45 d0             	cmp    -0x30(%ebp),%eax
  1027da:	77 4c                	ja     102828 <printnum+0xdc>
        printnum(putch, putdat, result, base, width - 1, padc);
  1027dc:	8b 45 1c             	mov    0x1c(%ebp),%eax
  1027df:	8d 50 ff             	lea    -0x1(%eax),%edx
  1027e2:	8b 45 20             	mov    0x20(%ebp),%eax
  1027e5:	89 44 24 18          	mov    %eax,0x18(%esp)
  1027e9:	89 54 24 14          	mov    %edx,0x14(%esp)
  1027ed:	8b 45 18             	mov    0x18(%ebp),%eax
  1027f0:	89 44 24 10          	mov    %eax,0x10(%esp)
  1027f4:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1027f7:	8b 55 ec             	mov    -0x14(%ebp),%edx
  1027fa:	89 44 24 08          	mov    %eax,0x8(%esp)
  1027fe:	89 54 24 0c          	mov    %edx,0xc(%esp)
  102802:	8b 45 0c             	mov    0xc(%ebp),%eax
  102805:	89 44 24 04          	mov    %eax,0x4(%esp)
  102809:	8b 45 08             	mov    0x8(%ebp),%eax
  10280c:	89 04 24             	mov    %eax,(%esp)
  10280f:	e8 38 ff ff ff       	call   10274c <printnum>
  102814:	eb 1c                	jmp    102832 <printnum+0xe6>
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
            putch(padc, putdat);
  102816:	8b 45 0c             	mov    0xc(%ebp),%eax
  102819:	89 44 24 04          	mov    %eax,0x4(%esp)
  10281d:	8b 45 20             	mov    0x20(%ebp),%eax
  102820:	89 04 24             	mov    %eax,(%esp)
  102823:	8b 45 08             	mov    0x8(%ebp),%eax
  102826:	ff d0                	call   *%eax
    // first recursively print all preceding (more significant) digits
    if (num >= base) {
        printnum(putch, putdat, result, base, width - 1, padc);
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
  102828:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
  10282c:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
  102830:	7f e4                	jg     102816 <printnum+0xca>
            putch(padc, putdat);
    }
    // then print this (the least significant) digit
    putch("0123456789abcdef"[mod], putdat);
  102832:	8b 45 d8             	mov    -0x28(%ebp),%eax
  102835:	05 10 3a 10 00       	add    $0x103a10,%eax
  10283a:	0f b6 00             	movzbl (%eax),%eax
  10283d:	0f be c0             	movsbl %al,%eax
  102840:	8b 55 0c             	mov    0xc(%ebp),%edx
  102843:	89 54 24 04          	mov    %edx,0x4(%esp)
  102847:	89 04 24             	mov    %eax,(%esp)
  10284a:	8b 45 08             	mov    0x8(%ebp),%eax
  10284d:	ff d0                	call   *%eax
}
  10284f:	c9                   	leave  
  102850:	c3                   	ret    

00102851 <getuint>:
 * getuint - get an unsigned int of various possible sizes from a varargs list
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static unsigned long long
getuint(va_list *ap, int lflag) {
  102851:	55                   	push   %ebp
  102852:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  102854:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102858:	7e 14                	jle    10286e <getuint+0x1d>
        return va_arg(*ap, unsigned long long);
  10285a:	8b 45 08             	mov    0x8(%ebp),%eax
  10285d:	8b 00                	mov    (%eax),%eax
  10285f:	8d 48 08             	lea    0x8(%eax),%ecx
  102862:	8b 55 08             	mov    0x8(%ebp),%edx
  102865:	89 0a                	mov    %ecx,(%edx)
  102867:	8b 50 04             	mov    0x4(%eax),%edx
  10286a:	8b 00                	mov    (%eax),%eax
  10286c:	eb 30                	jmp    10289e <getuint+0x4d>
    }
    else if (lflag) {
  10286e:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102872:	74 16                	je     10288a <getuint+0x39>
        return va_arg(*ap, unsigned long);
  102874:	8b 45 08             	mov    0x8(%ebp),%eax
  102877:	8b 00                	mov    (%eax),%eax
  102879:	8d 48 04             	lea    0x4(%eax),%ecx
  10287c:	8b 55 08             	mov    0x8(%ebp),%edx
  10287f:	89 0a                	mov    %ecx,(%edx)
  102881:	8b 00                	mov    (%eax),%eax
  102883:	ba 00 00 00 00       	mov    $0x0,%edx
  102888:	eb 14                	jmp    10289e <getuint+0x4d>
    }
    else {
        return va_arg(*ap, unsigned int);
  10288a:	8b 45 08             	mov    0x8(%ebp),%eax
  10288d:	8b 00                	mov    (%eax),%eax
  10288f:	8d 48 04             	lea    0x4(%eax),%ecx
  102892:	8b 55 08             	mov    0x8(%ebp),%edx
  102895:	89 0a                	mov    %ecx,(%edx)
  102897:	8b 00                	mov    (%eax),%eax
  102899:	ba 00 00 00 00       	mov    $0x0,%edx
    }
}
  10289e:	5d                   	pop    %ebp
  10289f:	c3                   	ret    

001028a0 <getint>:
 * getint - same as getuint but signed, we can't use getuint because of sign extension
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static long long
getint(va_list *ap, int lflag) {
  1028a0:	55                   	push   %ebp
  1028a1:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  1028a3:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  1028a7:	7e 14                	jle    1028bd <getint+0x1d>
        return va_arg(*ap, long long);
  1028a9:	8b 45 08             	mov    0x8(%ebp),%eax
  1028ac:	8b 00                	mov    (%eax),%eax
  1028ae:	8d 48 08             	lea    0x8(%eax),%ecx
  1028b1:	8b 55 08             	mov    0x8(%ebp),%edx
  1028b4:	89 0a                	mov    %ecx,(%edx)
  1028b6:	8b 50 04             	mov    0x4(%eax),%edx
  1028b9:	8b 00                	mov    (%eax),%eax
  1028bb:	eb 28                	jmp    1028e5 <getint+0x45>
    }
    else if (lflag) {
  1028bd:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  1028c1:	74 12                	je     1028d5 <getint+0x35>
        return va_arg(*ap, long);
  1028c3:	8b 45 08             	mov    0x8(%ebp),%eax
  1028c6:	8b 00                	mov    (%eax),%eax
  1028c8:	8d 48 04             	lea    0x4(%eax),%ecx
  1028cb:	8b 55 08             	mov    0x8(%ebp),%edx
  1028ce:	89 0a                	mov    %ecx,(%edx)
  1028d0:	8b 00                	mov    (%eax),%eax
  1028d2:	99                   	cltd   
  1028d3:	eb 10                	jmp    1028e5 <getint+0x45>
    }
    else {
        return va_arg(*ap, int);
  1028d5:	8b 45 08             	mov    0x8(%ebp),%eax
  1028d8:	8b 00                	mov    (%eax),%eax
  1028da:	8d 48 04             	lea    0x4(%eax),%ecx
  1028dd:	8b 55 08             	mov    0x8(%ebp),%edx
  1028e0:	89 0a                	mov    %ecx,(%edx)
  1028e2:	8b 00                	mov    (%eax),%eax
  1028e4:	99                   	cltd   
    }
}
  1028e5:	5d                   	pop    %ebp
  1028e6:	c3                   	ret    

001028e7 <printfmt>:
 * @putch:        specified putch function, print a single character
 * @putdat:        used by @putch function
 * @fmt:        the format string to use
 * */
void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
  1028e7:	55                   	push   %ebp
  1028e8:	89 e5                	mov    %esp,%ebp
  1028ea:	83 ec 28             	sub    $0x28,%esp
    va_list ap;

    va_start(ap, fmt);
  1028ed:	8d 45 14             	lea    0x14(%ebp),%eax
  1028f0:	89 45 f4             	mov    %eax,-0xc(%ebp)
    vprintfmt(putch, putdat, fmt, ap);
  1028f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1028f6:	89 44 24 0c          	mov    %eax,0xc(%esp)
  1028fa:	8b 45 10             	mov    0x10(%ebp),%eax
  1028fd:	89 44 24 08          	mov    %eax,0x8(%esp)
  102901:	8b 45 0c             	mov    0xc(%ebp),%eax
  102904:	89 44 24 04          	mov    %eax,0x4(%esp)
  102908:	8b 45 08             	mov    0x8(%ebp),%eax
  10290b:	89 04 24             	mov    %eax,(%esp)
  10290e:	e8 02 00 00 00       	call   102915 <vprintfmt>
    va_end(ap);
}
  102913:	c9                   	leave  
  102914:	c3                   	ret    

00102915 <vprintfmt>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want printfmt() instead.
 * */
void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap) {
  102915:	55                   	push   %ebp
  102916:	89 e5                	mov    %esp,%ebp
  102918:	56                   	push   %esi
  102919:	53                   	push   %ebx
  10291a:	83 ec 40             	sub    $0x40,%esp
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  10291d:	eb 18                	jmp    102937 <vprintfmt+0x22>
            if (ch == '\0') {
  10291f:	85 db                	test   %ebx,%ebx
  102921:	75 05                	jne    102928 <vprintfmt+0x13>
                return;
  102923:	e9 d1 03 00 00       	jmp    102cf9 <vprintfmt+0x3e4>
            }
            putch(ch, putdat);
  102928:	8b 45 0c             	mov    0xc(%ebp),%eax
  10292b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10292f:	89 1c 24             	mov    %ebx,(%esp)
  102932:	8b 45 08             	mov    0x8(%ebp),%eax
  102935:	ff d0                	call   *%eax
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102937:	8b 45 10             	mov    0x10(%ebp),%eax
  10293a:	8d 50 01             	lea    0x1(%eax),%edx
  10293d:	89 55 10             	mov    %edx,0x10(%ebp)
  102940:	0f b6 00             	movzbl (%eax),%eax
  102943:	0f b6 d8             	movzbl %al,%ebx
  102946:	83 fb 25             	cmp    $0x25,%ebx
  102949:	75 d4                	jne    10291f <vprintfmt+0xa>
            }
            putch(ch, putdat);
        }

        // Process a %-escape sequence
        char padc = ' ';
  10294b:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
        width = precision = -1;
  10294f:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
  102956:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102959:	89 45 e8             	mov    %eax,-0x18(%ebp)
        lflag = altflag = 0;
  10295c:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  102963:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102966:	89 45 e0             	mov    %eax,-0x20(%ebp)

    reswitch:
        switch (ch = *(unsigned char *)fmt ++) {
  102969:	8b 45 10             	mov    0x10(%ebp),%eax
  10296c:	8d 50 01             	lea    0x1(%eax),%edx
  10296f:	89 55 10             	mov    %edx,0x10(%ebp)
  102972:	0f b6 00             	movzbl (%eax),%eax
  102975:	0f b6 d8             	movzbl %al,%ebx
  102978:	8d 43 dd             	lea    -0x23(%ebx),%eax
  10297b:	83 f8 55             	cmp    $0x55,%eax
  10297e:	0f 87 44 03 00 00    	ja     102cc8 <vprintfmt+0x3b3>
  102984:	8b 04 85 34 3a 10 00 	mov    0x103a34(,%eax,4),%eax
  10298b:	ff e0                	jmp    *%eax

        // flag to pad on the right
        case '-':
            padc = '-';
  10298d:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
            goto reswitch;
  102991:	eb d6                	jmp    102969 <vprintfmt+0x54>

        // flag to pad with 0's instead of spaces
        case '0':
            padc = '0';
  102993:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
            goto reswitch;
  102997:	eb d0                	jmp    102969 <vprintfmt+0x54>

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  102999:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
                precision = precision * 10 + ch - '0';
  1029a0:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  1029a3:	89 d0                	mov    %edx,%eax
  1029a5:	c1 e0 02             	shl    $0x2,%eax
  1029a8:	01 d0                	add    %edx,%eax
  1029aa:	01 c0                	add    %eax,%eax
  1029ac:	01 d8                	add    %ebx,%eax
  1029ae:	83 e8 30             	sub    $0x30,%eax
  1029b1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                ch = *fmt;
  1029b4:	8b 45 10             	mov    0x10(%ebp),%eax
  1029b7:	0f b6 00             	movzbl (%eax),%eax
  1029ba:	0f be d8             	movsbl %al,%ebx
                if (ch < '0' || ch > '9') {
  1029bd:	83 fb 2f             	cmp    $0x2f,%ebx
  1029c0:	7e 0b                	jle    1029cd <vprintfmt+0xb8>
  1029c2:	83 fb 39             	cmp    $0x39,%ebx
  1029c5:	7f 06                	jg     1029cd <vprintfmt+0xb8>
            padc = '0';
            goto reswitch;

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  1029c7:	83 45 10 01          	addl   $0x1,0x10(%ebp)
                precision = precision * 10 + ch - '0';
                ch = *fmt;
                if (ch < '0' || ch > '9') {
                    break;
                }
            }
  1029cb:	eb d3                	jmp    1029a0 <vprintfmt+0x8b>
            goto process_precision;
  1029cd:	eb 33                	jmp    102a02 <vprintfmt+0xed>

        case '*':
            precision = va_arg(ap, int);
  1029cf:	8b 45 14             	mov    0x14(%ebp),%eax
  1029d2:	8d 50 04             	lea    0x4(%eax),%edx
  1029d5:	89 55 14             	mov    %edx,0x14(%ebp)
  1029d8:	8b 00                	mov    (%eax),%eax
  1029da:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            goto process_precision;
  1029dd:	eb 23                	jmp    102a02 <vprintfmt+0xed>

        case '.':
            if (width < 0)
  1029df:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  1029e3:	79 0c                	jns    1029f1 <vprintfmt+0xdc>
                width = 0;
  1029e5:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
            goto reswitch;
  1029ec:	e9 78 ff ff ff       	jmp    102969 <vprintfmt+0x54>
  1029f1:	e9 73 ff ff ff       	jmp    102969 <vprintfmt+0x54>

        case '#':
            altflag = 1;
  1029f6:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
            goto reswitch;
  1029fd:	e9 67 ff ff ff       	jmp    102969 <vprintfmt+0x54>

        process_precision:
            if (width < 0)
  102a02:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102a06:	79 12                	jns    102a1a <vprintfmt+0x105>
                width = precision, precision = -1;
  102a08:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102a0b:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102a0e:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
            goto reswitch;
  102a15:	e9 4f ff ff ff       	jmp    102969 <vprintfmt+0x54>
  102a1a:	e9 4a ff ff ff       	jmp    102969 <vprintfmt+0x54>

        // long flag (doubled for long long)
        case 'l':
            lflag ++;
  102a1f:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
            goto reswitch;
  102a23:	e9 41 ff ff ff       	jmp    102969 <vprintfmt+0x54>

        // character
        case 'c':
            putch(va_arg(ap, int), putdat);
  102a28:	8b 45 14             	mov    0x14(%ebp),%eax
  102a2b:	8d 50 04             	lea    0x4(%eax),%edx
  102a2e:	89 55 14             	mov    %edx,0x14(%ebp)
  102a31:	8b 00                	mov    (%eax),%eax
  102a33:	8b 55 0c             	mov    0xc(%ebp),%edx
  102a36:	89 54 24 04          	mov    %edx,0x4(%esp)
  102a3a:	89 04 24             	mov    %eax,(%esp)
  102a3d:	8b 45 08             	mov    0x8(%ebp),%eax
  102a40:	ff d0                	call   *%eax
            break;
  102a42:	e9 ac 02 00 00       	jmp    102cf3 <vprintfmt+0x3de>

        // error message
        case 'e':
            err = va_arg(ap, int);
  102a47:	8b 45 14             	mov    0x14(%ebp),%eax
  102a4a:	8d 50 04             	lea    0x4(%eax),%edx
  102a4d:	89 55 14             	mov    %edx,0x14(%ebp)
  102a50:	8b 18                	mov    (%eax),%ebx
            if (err < 0) {
  102a52:	85 db                	test   %ebx,%ebx
  102a54:	79 02                	jns    102a58 <vprintfmt+0x143>
                err = -err;
  102a56:	f7 db                	neg    %ebx
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
  102a58:	83 fb 06             	cmp    $0x6,%ebx
  102a5b:	7f 0b                	jg     102a68 <vprintfmt+0x153>
  102a5d:	8b 34 9d f4 39 10 00 	mov    0x1039f4(,%ebx,4),%esi
  102a64:	85 f6                	test   %esi,%esi
  102a66:	75 23                	jne    102a8b <vprintfmt+0x176>
                printfmt(putch, putdat, "error %d", err);
  102a68:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  102a6c:	c7 44 24 08 21 3a 10 	movl   $0x103a21,0x8(%esp)
  102a73:	00 
  102a74:	8b 45 0c             	mov    0xc(%ebp),%eax
  102a77:	89 44 24 04          	mov    %eax,0x4(%esp)
  102a7b:	8b 45 08             	mov    0x8(%ebp),%eax
  102a7e:	89 04 24             	mov    %eax,(%esp)
  102a81:	e8 61 fe ff ff       	call   1028e7 <printfmt>
            }
            else {
                printfmt(putch, putdat, "%s", p);
            }
            break;
  102a86:	e9 68 02 00 00       	jmp    102cf3 <vprintfmt+0x3de>
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
                printfmt(putch, putdat, "error %d", err);
            }
            else {
                printfmt(putch, putdat, "%s", p);
  102a8b:	89 74 24 0c          	mov    %esi,0xc(%esp)
  102a8f:	c7 44 24 08 2a 3a 10 	movl   $0x103a2a,0x8(%esp)
  102a96:	00 
  102a97:	8b 45 0c             	mov    0xc(%ebp),%eax
  102a9a:	89 44 24 04          	mov    %eax,0x4(%esp)
  102a9e:	8b 45 08             	mov    0x8(%ebp),%eax
  102aa1:	89 04 24             	mov    %eax,(%esp)
  102aa4:	e8 3e fe ff ff       	call   1028e7 <printfmt>
            }
            break;
  102aa9:	e9 45 02 00 00       	jmp    102cf3 <vprintfmt+0x3de>

        // string
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
  102aae:	8b 45 14             	mov    0x14(%ebp),%eax
  102ab1:	8d 50 04             	lea    0x4(%eax),%edx
  102ab4:	89 55 14             	mov    %edx,0x14(%ebp)
  102ab7:	8b 30                	mov    (%eax),%esi
  102ab9:	85 f6                	test   %esi,%esi
  102abb:	75 05                	jne    102ac2 <vprintfmt+0x1ad>
                p = "(null)";
  102abd:	be 2d 3a 10 00       	mov    $0x103a2d,%esi
            }
            if (width > 0 && padc != '-') {
  102ac2:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102ac6:	7e 3e                	jle    102b06 <vprintfmt+0x1f1>
  102ac8:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
  102acc:	74 38                	je     102b06 <vprintfmt+0x1f1>
                for (width -= strnlen(p, precision); width > 0; width --) {
  102ace:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  102ad1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102ad4:	89 44 24 04          	mov    %eax,0x4(%esp)
  102ad8:	89 34 24             	mov    %esi,(%esp)
  102adb:	e8 15 03 00 00       	call   102df5 <strnlen>
  102ae0:	29 c3                	sub    %eax,%ebx
  102ae2:	89 d8                	mov    %ebx,%eax
  102ae4:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102ae7:	eb 17                	jmp    102b00 <vprintfmt+0x1eb>
                    putch(padc, putdat);
  102ae9:	0f be 45 db          	movsbl -0x25(%ebp),%eax
  102aed:	8b 55 0c             	mov    0xc(%ebp),%edx
  102af0:	89 54 24 04          	mov    %edx,0x4(%esp)
  102af4:	89 04 24             	mov    %eax,(%esp)
  102af7:	8b 45 08             	mov    0x8(%ebp),%eax
  102afa:	ff d0                	call   *%eax
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
                p = "(null)";
            }
            if (width > 0 && padc != '-') {
                for (width -= strnlen(p, precision); width > 0; width --) {
  102afc:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  102b00:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102b04:	7f e3                	jg     102ae9 <vprintfmt+0x1d4>
                    putch(padc, putdat);
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  102b06:	eb 38                	jmp    102b40 <vprintfmt+0x22b>
                if (altflag && (ch < ' ' || ch > '~')) {
  102b08:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  102b0c:	74 1f                	je     102b2d <vprintfmt+0x218>
  102b0e:	83 fb 1f             	cmp    $0x1f,%ebx
  102b11:	7e 05                	jle    102b18 <vprintfmt+0x203>
  102b13:	83 fb 7e             	cmp    $0x7e,%ebx
  102b16:	7e 15                	jle    102b2d <vprintfmt+0x218>
                    putch('?', putdat);
  102b18:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b1b:	89 44 24 04          	mov    %eax,0x4(%esp)
  102b1f:	c7 04 24 3f 00 00 00 	movl   $0x3f,(%esp)
  102b26:	8b 45 08             	mov    0x8(%ebp),%eax
  102b29:	ff d0                	call   *%eax
  102b2b:	eb 0f                	jmp    102b3c <vprintfmt+0x227>
                }
                else {
                    putch(ch, putdat);
  102b2d:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b30:	89 44 24 04          	mov    %eax,0x4(%esp)
  102b34:	89 1c 24             	mov    %ebx,(%esp)
  102b37:	8b 45 08             	mov    0x8(%ebp),%eax
  102b3a:	ff d0                	call   *%eax
            if (width > 0 && padc != '-') {
                for (width -= strnlen(p, precision); width > 0; width --) {
                    putch(padc, putdat);
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  102b3c:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  102b40:	89 f0                	mov    %esi,%eax
  102b42:	8d 70 01             	lea    0x1(%eax),%esi
  102b45:	0f b6 00             	movzbl (%eax),%eax
  102b48:	0f be d8             	movsbl %al,%ebx
  102b4b:	85 db                	test   %ebx,%ebx
  102b4d:	74 10                	je     102b5f <vprintfmt+0x24a>
  102b4f:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  102b53:	78 b3                	js     102b08 <vprintfmt+0x1f3>
  102b55:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
  102b59:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  102b5d:	79 a9                	jns    102b08 <vprintfmt+0x1f3>
                }
                else {
                    putch(ch, putdat);
                }
            }
            for (; width > 0; width --) {
  102b5f:	eb 17                	jmp    102b78 <vprintfmt+0x263>
                putch(' ', putdat);
  102b61:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b64:	89 44 24 04          	mov    %eax,0x4(%esp)
  102b68:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  102b6f:	8b 45 08             	mov    0x8(%ebp),%eax
  102b72:	ff d0                	call   *%eax
                }
                else {
                    putch(ch, putdat);
                }
            }
            for (; width > 0; width --) {
  102b74:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  102b78:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102b7c:	7f e3                	jg     102b61 <vprintfmt+0x24c>
                putch(' ', putdat);
            }
            break;
  102b7e:	e9 70 01 00 00       	jmp    102cf3 <vprintfmt+0x3de>

        // (signed) decimal
        case 'd':
            num = getint(&ap, lflag);
  102b83:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102b86:	89 44 24 04          	mov    %eax,0x4(%esp)
  102b8a:	8d 45 14             	lea    0x14(%ebp),%eax
  102b8d:	89 04 24             	mov    %eax,(%esp)
  102b90:	e8 0b fd ff ff       	call   1028a0 <getint>
  102b95:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102b98:	89 55 f4             	mov    %edx,-0xc(%ebp)
            if ((long long)num < 0) {
  102b9b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102b9e:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102ba1:	85 d2                	test   %edx,%edx
  102ba3:	79 26                	jns    102bcb <vprintfmt+0x2b6>
                putch('-', putdat);
  102ba5:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ba8:	89 44 24 04          	mov    %eax,0x4(%esp)
  102bac:	c7 04 24 2d 00 00 00 	movl   $0x2d,(%esp)
  102bb3:	8b 45 08             	mov    0x8(%ebp),%eax
  102bb6:	ff d0                	call   *%eax
                num = -(long long)num;
  102bb8:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102bbb:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102bbe:	f7 d8                	neg    %eax
  102bc0:	83 d2 00             	adc    $0x0,%edx
  102bc3:	f7 da                	neg    %edx
  102bc5:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102bc8:	89 55 f4             	mov    %edx,-0xc(%ebp)
            }
            base = 10;
  102bcb:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  102bd2:	e9 a8 00 00 00       	jmp    102c7f <vprintfmt+0x36a>

        // unsigned decimal
        case 'u':
            num = getuint(&ap, lflag);
  102bd7:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102bda:	89 44 24 04          	mov    %eax,0x4(%esp)
  102bde:	8d 45 14             	lea    0x14(%ebp),%eax
  102be1:	89 04 24             	mov    %eax,(%esp)
  102be4:	e8 68 fc ff ff       	call   102851 <getuint>
  102be9:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102bec:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 10;
  102bef:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  102bf6:	e9 84 00 00 00       	jmp    102c7f <vprintfmt+0x36a>

        // (unsigned) octal
        case 'o':
            num = getuint(&ap, lflag);
  102bfb:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102bfe:	89 44 24 04          	mov    %eax,0x4(%esp)
  102c02:	8d 45 14             	lea    0x14(%ebp),%eax
  102c05:	89 04 24             	mov    %eax,(%esp)
  102c08:	e8 44 fc ff ff       	call   102851 <getuint>
  102c0d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102c10:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 8;
  102c13:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
            goto number;
  102c1a:	eb 63                	jmp    102c7f <vprintfmt+0x36a>

        // pointer
        case 'p':
            putch('0', putdat);
  102c1c:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c1f:	89 44 24 04          	mov    %eax,0x4(%esp)
  102c23:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
  102c2a:	8b 45 08             	mov    0x8(%ebp),%eax
  102c2d:	ff d0                	call   *%eax
            putch('x', putdat);
  102c2f:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c32:	89 44 24 04          	mov    %eax,0x4(%esp)
  102c36:	c7 04 24 78 00 00 00 	movl   $0x78,(%esp)
  102c3d:	8b 45 08             	mov    0x8(%ebp),%eax
  102c40:	ff d0                	call   *%eax
            num = (unsigned long long)(uintptr_t)va_arg(ap, void *);
  102c42:	8b 45 14             	mov    0x14(%ebp),%eax
  102c45:	8d 50 04             	lea    0x4(%eax),%edx
  102c48:	89 55 14             	mov    %edx,0x14(%ebp)
  102c4b:	8b 00                	mov    (%eax),%eax
  102c4d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102c50:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            base = 16;
  102c57:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
            goto number;
  102c5e:	eb 1f                	jmp    102c7f <vprintfmt+0x36a>

        // (unsigned) hexadecimal
        case 'x':
            num = getuint(&ap, lflag);
  102c60:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102c63:	89 44 24 04          	mov    %eax,0x4(%esp)
  102c67:	8d 45 14             	lea    0x14(%ebp),%eax
  102c6a:	89 04 24             	mov    %eax,(%esp)
  102c6d:	e8 df fb ff ff       	call   102851 <getuint>
  102c72:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102c75:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 16;
  102c78:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
        number:
            printnum(putch, putdat, num, base, width, padc);
  102c7f:	0f be 55 db          	movsbl -0x25(%ebp),%edx
  102c83:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102c86:	89 54 24 18          	mov    %edx,0x18(%esp)
  102c8a:	8b 55 e8             	mov    -0x18(%ebp),%edx
  102c8d:	89 54 24 14          	mov    %edx,0x14(%esp)
  102c91:	89 44 24 10          	mov    %eax,0x10(%esp)
  102c95:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102c98:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102c9b:	89 44 24 08          	mov    %eax,0x8(%esp)
  102c9f:	89 54 24 0c          	mov    %edx,0xc(%esp)
  102ca3:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ca6:	89 44 24 04          	mov    %eax,0x4(%esp)
  102caa:	8b 45 08             	mov    0x8(%ebp),%eax
  102cad:	89 04 24             	mov    %eax,(%esp)
  102cb0:	e8 97 fa ff ff       	call   10274c <printnum>
            break;
  102cb5:	eb 3c                	jmp    102cf3 <vprintfmt+0x3de>

        // escaped '%' character
        case '%':
            putch(ch, putdat);
  102cb7:	8b 45 0c             	mov    0xc(%ebp),%eax
  102cba:	89 44 24 04          	mov    %eax,0x4(%esp)
  102cbe:	89 1c 24             	mov    %ebx,(%esp)
  102cc1:	8b 45 08             	mov    0x8(%ebp),%eax
  102cc4:	ff d0                	call   *%eax
            break;
  102cc6:	eb 2b                	jmp    102cf3 <vprintfmt+0x3de>

        // unrecognized escape sequence - just print it literally
        default:
            putch('%', putdat);
  102cc8:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ccb:	89 44 24 04          	mov    %eax,0x4(%esp)
  102ccf:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
  102cd6:	8b 45 08             	mov    0x8(%ebp),%eax
  102cd9:	ff d0                	call   *%eax
            for (fmt --; fmt[-1] != '%'; fmt --)
  102cdb:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  102cdf:	eb 04                	jmp    102ce5 <vprintfmt+0x3d0>
  102ce1:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  102ce5:	8b 45 10             	mov    0x10(%ebp),%eax
  102ce8:	83 e8 01             	sub    $0x1,%eax
  102ceb:	0f b6 00             	movzbl (%eax),%eax
  102cee:	3c 25                	cmp    $0x25,%al
  102cf0:	75 ef                	jne    102ce1 <vprintfmt+0x3cc>
                /* do nothing */;
            break;
  102cf2:	90                   	nop
        }
    }
  102cf3:	90                   	nop
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102cf4:	e9 3e fc ff ff       	jmp    102937 <vprintfmt+0x22>
            for (fmt --; fmt[-1] != '%'; fmt --)
                /* do nothing */;
            break;
        }
    }
}
  102cf9:	83 c4 40             	add    $0x40,%esp
  102cfc:	5b                   	pop    %ebx
  102cfd:	5e                   	pop    %esi
  102cfe:	5d                   	pop    %ebp
  102cff:	c3                   	ret    

00102d00 <sprintputch>:
 * sprintputch - 'print' a single character in a buffer
 * @ch:            the character will be printed
 * @b:            the buffer to place the character @ch
 * */
static void
sprintputch(int ch, struct sprintbuf *b) {
  102d00:	55                   	push   %ebp
  102d01:	89 e5                	mov    %esp,%ebp
    b->cnt ++;
  102d03:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d06:	8b 40 08             	mov    0x8(%eax),%eax
  102d09:	8d 50 01             	lea    0x1(%eax),%edx
  102d0c:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d0f:	89 50 08             	mov    %edx,0x8(%eax)
    if (b->buf < b->ebuf) {
  102d12:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d15:	8b 10                	mov    (%eax),%edx
  102d17:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d1a:	8b 40 04             	mov    0x4(%eax),%eax
  102d1d:	39 c2                	cmp    %eax,%edx
  102d1f:	73 12                	jae    102d33 <sprintputch+0x33>
        *b->buf ++ = ch;
  102d21:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d24:	8b 00                	mov    (%eax),%eax
  102d26:	8d 48 01             	lea    0x1(%eax),%ecx
  102d29:	8b 55 0c             	mov    0xc(%ebp),%edx
  102d2c:	89 0a                	mov    %ecx,(%edx)
  102d2e:	8b 55 08             	mov    0x8(%ebp),%edx
  102d31:	88 10                	mov    %dl,(%eax)
    }
}
  102d33:	5d                   	pop    %ebp
  102d34:	c3                   	ret    

00102d35 <snprintf>:
 * @str:        the buffer to place the result into
 * @size:        the size of buffer, including the trailing null space
 * @fmt:        the format string to use
 * */
int
snprintf(char *str, size_t size, const char *fmt, ...) {
  102d35:	55                   	push   %ebp
  102d36:	89 e5                	mov    %esp,%ebp
  102d38:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  102d3b:	8d 45 14             	lea    0x14(%ebp),%eax
  102d3e:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vsnprintf(str, size, fmt, ap);
  102d41:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102d44:	89 44 24 0c          	mov    %eax,0xc(%esp)
  102d48:	8b 45 10             	mov    0x10(%ebp),%eax
  102d4b:	89 44 24 08          	mov    %eax,0x8(%esp)
  102d4f:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d52:	89 44 24 04          	mov    %eax,0x4(%esp)
  102d56:	8b 45 08             	mov    0x8(%ebp),%eax
  102d59:	89 04 24             	mov    %eax,(%esp)
  102d5c:	e8 08 00 00 00       	call   102d69 <vsnprintf>
  102d61:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  102d64:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  102d67:	c9                   	leave  
  102d68:	c3                   	ret    

00102d69 <vsnprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want snprintf() instead.
 * */
int
vsnprintf(char *str, size_t size, const char *fmt, va_list ap) {
  102d69:	55                   	push   %ebp
  102d6a:	89 e5                	mov    %esp,%ebp
  102d6c:	83 ec 28             	sub    $0x28,%esp
    struct sprintbuf b = {str, str + size - 1, 0};
  102d6f:	8b 45 08             	mov    0x8(%ebp),%eax
  102d72:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102d75:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d78:	8d 50 ff             	lea    -0x1(%eax),%edx
  102d7b:	8b 45 08             	mov    0x8(%ebp),%eax
  102d7e:	01 d0                	add    %edx,%eax
  102d80:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102d83:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if (str == NULL || b.buf > b.ebuf) {
  102d8a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  102d8e:	74 0a                	je     102d9a <vsnprintf+0x31>
  102d90:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102d93:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102d96:	39 c2                	cmp    %eax,%edx
  102d98:	76 07                	jbe    102da1 <vsnprintf+0x38>
        return -E_INVAL;
  102d9a:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  102d9f:	eb 2a                	jmp    102dcb <vsnprintf+0x62>
    }
    // print the string to the buffer
    vprintfmt((void*)sprintputch, &b, fmt, ap);
  102da1:	8b 45 14             	mov    0x14(%ebp),%eax
  102da4:	89 44 24 0c          	mov    %eax,0xc(%esp)
  102da8:	8b 45 10             	mov    0x10(%ebp),%eax
  102dab:	89 44 24 08          	mov    %eax,0x8(%esp)
  102daf:	8d 45 ec             	lea    -0x14(%ebp),%eax
  102db2:	89 44 24 04          	mov    %eax,0x4(%esp)
  102db6:	c7 04 24 00 2d 10 00 	movl   $0x102d00,(%esp)
  102dbd:	e8 53 fb ff ff       	call   102915 <vprintfmt>
    // null terminate the buffer
    *b.buf = '\0';
  102dc2:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102dc5:	c6 00 00             	movb   $0x0,(%eax)
    return b.cnt;
  102dc8:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  102dcb:	c9                   	leave  
  102dcc:	c3                   	ret    

00102dcd <strlen>:
 * @s:        the input string
 *
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
  102dcd:	55                   	push   %ebp
  102dce:	89 e5                	mov    %esp,%ebp
  102dd0:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  102dd3:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (*s ++ != '\0') {
  102dda:	eb 04                	jmp    102de0 <strlen+0x13>
        cnt ++;
  102ddc:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
    size_t cnt = 0;
    while (*s ++ != '\0') {
  102de0:	8b 45 08             	mov    0x8(%ebp),%eax
  102de3:	8d 50 01             	lea    0x1(%eax),%edx
  102de6:	89 55 08             	mov    %edx,0x8(%ebp)
  102de9:	0f b6 00             	movzbl (%eax),%eax
  102dec:	84 c0                	test   %al,%al
  102dee:	75 ec                	jne    102ddc <strlen+0xf>
        cnt ++;
    }
    return cnt;
  102df0:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102df3:	c9                   	leave  
  102df4:	c3                   	ret    

00102df5 <strnlen>:
 * The return value is strlen(s), if that is less than @len, or
 * @len if there is no '\0' character among the first @len characters
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
  102df5:	55                   	push   %ebp
  102df6:	89 e5                	mov    %esp,%ebp
  102df8:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  102dfb:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  102e02:	eb 04                	jmp    102e08 <strnlen+0x13>
        cnt ++;
  102e04:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
    size_t cnt = 0;
    while (cnt < len && *s ++ != '\0') {
  102e08:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102e0b:	3b 45 0c             	cmp    0xc(%ebp),%eax
  102e0e:	73 10                	jae    102e20 <strnlen+0x2b>
  102e10:	8b 45 08             	mov    0x8(%ebp),%eax
  102e13:	8d 50 01             	lea    0x1(%eax),%edx
  102e16:	89 55 08             	mov    %edx,0x8(%ebp)
  102e19:	0f b6 00             	movzbl (%eax),%eax
  102e1c:	84 c0                	test   %al,%al
  102e1e:	75 e4                	jne    102e04 <strnlen+0xf>
        cnt ++;
    }
    return cnt;
  102e20:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102e23:	c9                   	leave  
  102e24:	c3                   	ret    

00102e25 <strcpy>:
 * To avoid overflows, the size of array pointed by @dst should be long enough to
 * contain the same string as @src (including the terminating null character), and
 * should not overlap in memory with @src.
 * */
char *
strcpy(char *dst, const char *src) {
  102e25:	55                   	push   %ebp
  102e26:	89 e5                	mov    %esp,%ebp
  102e28:	57                   	push   %edi
  102e29:	56                   	push   %esi
  102e2a:	83 ec 20             	sub    $0x20,%esp
  102e2d:	8b 45 08             	mov    0x8(%ebp),%eax
  102e30:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102e33:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e36:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCPY
#define __HAVE_ARCH_STRCPY
static inline char *
__strcpy(char *dst, const char *src) {
    int d0, d1, d2;
    asm volatile (
  102e39:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102e3c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102e3f:	89 d1                	mov    %edx,%ecx
  102e41:	89 c2                	mov    %eax,%edx
  102e43:	89 ce                	mov    %ecx,%esi
  102e45:	89 d7                	mov    %edx,%edi
  102e47:	ac                   	lods   %ds:(%esi),%al
  102e48:	aa                   	stos   %al,%es:(%edi)
  102e49:	84 c0                	test   %al,%al
  102e4b:	75 fa                	jne    102e47 <strcpy+0x22>
  102e4d:	89 fa                	mov    %edi,%edx
  102e4f:	89 f1                	mov    %esi,%ecx
  102e51:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  102e54:	89 55 e8             	mov    %edx,-0x18(%ebp)
  102e57:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "stosb;"
            "testb %%al, %%al;"
            "jne 1b;"
            : "=&S" (d0), "=&D" (d1), "=&a" (d2)
            : "0" (src), "1" (dst) : "memory");
    return dst;
  102e5a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    char *p = dst;
    while ((*p ++ = *src ++) != '\0')
        /* nothing */;
    return dst;
#endif /* __HAVE_ARCH_STRCPY */
}
  102e5d:	83 c4 20             	add    $0x20,%esp
  102e60:	5e                   	pop    %esi
  102e61:	5f                   	pop    %edi
  102e62:	5d                   	pop    %ebp
  102e63:	c3                   	ret    

00102e64 <strncpy>:
 * @len:    maximum number of characters to be copied from @src
 *
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
  102e64:	55                   	push   %ebp
  102e65:	89 e5                	mov    %esp,%ebp
  102e67:	83 ec 10             	sub    $0x10,%esp
    char *p = dst;
  102e6a:	8b 45 08             	mov    0x8(%ebp),%eax
  102e6d:	89 45 fc             	mov    %eax,-0x4(%ebp)
    while (len > 0) {
  102e70:	eb 21                	jmp    102e93 <strncpy+0x2f>
        if ((*p = *src) != '\0') {
  102e72:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e75:	0f b6 10             	movzbl (%eax),%edx
  102e78:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102e7b:	88 10                	mov    %dl,(%eax)
  102e7d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102e80:	0f b6 00             	movzbl (%eax),%eax
  102e83:	84 c0                	test   %al,%al
  102e85:	74 04                	je     102e8b <strncpy+0x27>
            src ++;
  102e87:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
        }
        p ++, len --;
  102e8b:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  102e8f:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
    char *p = dst;
    while (len > 0) {
  102e93:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102e97:	75 d9                	jne    102e72 <strncpy+0xe>
        if ((*p = *src) != '\0') {
            src ++;
        }
        p ++, len --;
    }
    return dst;
  102e99:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102e9c:	c9                   	leave  
  102e9d:	c3                   	ret    

00102e9e <strcmp>:
 * - A value greater than zero indicates that the first character that does
 *   not match has a greater value in @s1 than in @s2;
 * - And a value less than zero indicates the opposite.
 * */
int
strcmp(const char *s1, const char *s2) {
  102e9e:	55                   	push   %ebp
  102e9f:	89 e5                	mov    %esp,%ebp
  102ea1:	57                   	push   %edi
  102ea2:	56                   	push   %esi
  102ea3:	83 ec 20             	sub    $0x20,%esp
  102ea6:	8b 45 08             	mov    0x8(%ebp),%eax
  102ea9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102eac:	8b 45 0c             	mov    0xc(%ebp),%eax
  102eaf:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCMP
#define __HAVE_ARCH_STRCMP
static inline int
__strcmp(const char *s1, const char *s2) {
    int d0, d1, ret;
    asm volatile (
  102eb2:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102eb5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102eb8:	89 d1                	mov    %edx,%ecx
  102eba:	89 c2                	mov    %eax,%edx
  102ebc:	89 ce                	mov    %ecx,%esi
  102ebe:	89 d7                	mov    %edx,%edi
  102ec0:	ac                   	lods   %ds:(%esi),%al
  102ec1:	ae                   	scas   %es:(%edi),%al
  102ec2:	75 08                	jne    102ecc <strcmp+0x2e>
  102ec4:	84 c0                	test   %al,%al
  102ec6:	75 f8                	jne    102ec0 <strcmp+0x22>
  102ec8:	31 c0                	xor    %eax,%eax
  102eca:	eb 04                	jmp    102ed0 <strcmp+0x32>
  102ecc:	19 c0                	sbb    %eax,%eax
  102ece:	0c 01                	or     $0x1,%al
  102ed0:	89 fa                	mov    %edi,%edx
  102ed2:	89 f1                	mov    %esi,%ecx
  102ed4:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102ed7:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  102eda:	89 55 e4             	mov    %edx,-0x1c(%ebp)
            "orb $1, %%al;"
            "3:"
            : "=a" (ret), "=&S" (d0), "=&D" (d1)
            : "1" (s1), "2" (s2)
            : "memory");
    return ret;
  102edd:	8b 45 ec             	mov    -0x14(%ebp),%eax
    while (*s1 != '\0' && *s1 == *s2) {
        s1 ++, s2 ++;
    }
    return (int)((unsigned char)*s1 - (unsigned char)*s2);
#endif /* __HAVE_ARCH_STRCMP */
}
  102ee0:	83 c4 20             	add    $0x20,%esp
  102ee3:	5e                   	pop    %esi
  102ee4:	5f                   	pop    %edi
  102ee5:	5d                   	pop    %ebp
  102ee6:	c3                   	ret    

00102ee7 <strncmp>:
 * they are equal to each other, it continues with the following pairs until
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
  102ee7:	55                   	push   %ebp
  102ee8:	89 e5                	mov    %esp,%ebp
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  102eea:	eb 0c                	jmp    102ef8 <strncmp+0x11>
        n --, s1 ++, s2 ++;
  102eec:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  102ef0:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102ef4:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  102ef8:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102efc:	74 1a                	je     102f18 <strncmp+0x31>
  102efe:	8b 45 08             	mov    0x8(%ebp),%eax
  102f01:	0f b6 00             	movzbl (%eax),%eax
  102f04:	84 c0                	test   %al,%al
  102f06:	74 10                	je     102f18 <strncmp+0x31>
  102f08:	8b 45 08             	mov    0x8(%ebp),%eax
  102f0b:	0f b6 10             	movzbl (%eax),%edx
  102f0e:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f11:	0f b6 00             	movzbl (%eax),%eax
  102f14:	38 c2                	cmp    %al,%dl
  102f16:	74 d4                	je     102eec <strncmp+0x5>
        n --, s1 ++, s2 ++;
    }
    return (n == 0) ? 0 : (int)((unsigned char)*s1 - (unsigned char)*s2);
  102f18:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102f1c:	74 18                	je     102f36 <strncmp+0x4f>
  102f1e:	8b 45 08             	mov    0x8(%ebp),%eax
  102f21:	0f b6 00             	movzbl (%eax),%eax
  102f24:	0f b6 d0             	movzbl %al,%edx
  102f27:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f2a:	0f b6 00             	movzbl (%eax),%eax
  102f2d:	0f b6 c0             	movzbl %al,%eax
  102f30:	29 c2                	sub    %eax,%edx
  102f32:	89 d0                	mov    %edx,%eax
  102f34:	eb 05                	jmp    102f3b <strncmp+0x54>
  102f36:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102f3b:	5d                   	pop    %ebp
  102f3c:	c3                   	ret    

00102f3d <strchr>:
 *
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
  102f3d:	55                   	push   %ebp
  102f3e:	89 e5                	mov    %esp,%ebp
  102f40:	83 ec 04             	sub    $0x4,%esp
  102f43:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f46:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102f49:	eb 14                	jmp    102f5f <strchr+0x22>
        if (*s == c) {
  102f4b:	8b 45 08             	mov    0x8(%ebp),%eax
  102f4e:	0f b6 00             	movzbl (%eax),%eax
  102f51:	3a 45 fc             	cmp    -0x4(%ebp),%al
  102f54:	75 05                	jne    102f5b <strchr+0x1e>
            return (char *)s;
  102f56:	8b 45 08             	mov    0x8(%ebp),%eax
  102f59:	eb 13                	jmp    102f6e <strchr+0x31>
        }
        s ++;
  102f5b:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
    while (*s != '\0') {
  102f5f:	8b 45 08             	mov    0x8(%ebp),%eax
  102f62:	0f b6 00             	movzbl (%eax),%eax
  102f65:	84 c0                	test   %al,%al
  102f67:	75 e2                	jne    102f4b <strchr+0xe>
        if (*s == c) {
            return (char *)s;
        }
        s ++;
    }
    return NULL;
  102f69:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102f6e:	c9                   	leave  
  102f6f:	c3                   	ret    

00102f70 <strfind>:
 * The strfind() function is like strchr() except that if @c is
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
  102f70:	55                   	push   %ebp
  102f71:	89 e5                	mov    %esp,%ebp
  102f73:	83 ec 04             	sub    $0x4,%esp
  102f76:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f79:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102f7c:	eb 11                	jmp    102f8f <strfind+0x1f>
        if (*s == c) {
  102f7e:	8b 45 08             	mov    0x8(%ebp),%eax
  102f81:	0f b6 00             	movzbl (%eax),%eax
  102f84:	3a 45 fc             	cmp    -0x4(%ebp),%al
  102f87:	75 02                	jne    102f8b <strfind+0x1b>
            break;
  102f89:	eb 0e                	jmp    102f99 <strfind+0x29>
        }
        s ++;
  102f8b:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
    while (*s != '\0') {
  102f8f:	8b 45 08             	mov    0x8(%ebp),%eax
  102f92:	0f b6 00             	movzbl (%eax),%eax
  102f95:	84 c0                	test   %al,%al
  102f97:	75 e5                	jne    102f7e <strfind+0xe>
        if (*s == c) {
            break;
        }
        s ++;
    }
    return (char *)s;
  102f99:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102f9c:	c9                   	leave  
  102f9d:	c3                   	ret    

00102f9e <strtol>:
 * an optional "0x" or "0X" prefix.
 *
 * The strtol() function returns the converted integral number as a long int value.
 * */
long
strtol(const char *s, char **endptr, int base) {
  102f9e:	55                   	push   %ebp
  102f9f:	89 e5                	mov    %esp,%ebp
  102fa1:	83 ec 10             	sub    $0x10,%esp
    int neg = 0;
  102fa4:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    long val = 0;
  102fab:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  102fb2:	eb 04                	jmp    102fb8 <strtol+0x1a>
        s ++;
  102fb4:	83 45 08 01          	addl   $0x1,0x8(%ebp)
strtol(const char *s, char **endptr, int base) {
    int neg = 0;
    long val = 0;

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  102fb8:	8b 45 08             	mov    0x8(%ebp),%eax
  102fbb:	0f b6 00             	movzbl (%eax),%eax
  102fbe:	3c 20                	cmp    $0x20,%al
  102fc0:	74 f2                	je     102fb4 <strtol+0x16>
  102fc2:	8b 45 08             	mov    0x8(%ebp),%eax
  102fc5:	0f b6 00             	movzbl (%eax),%eax
  102fc8:	3c 09                	cmp    $0x9,%al
  102fca:	74 e8                	je     102fb4 <strtol+0x16>
        s ++;
    }

    // plus/minus sign
    if (*s == '+') {
  102fcc:	8b 45 08             	mov    0x8(%ebp),%eax
  102fcf:	0f b6 00             	movzbl (%eax),%eax
  102fd2:	3c 2b                	cmp    $0x2b,%al
  102fd4:	75 06                	jne    102fdc <strtol+0x3e>
        s ++;
  102fd6:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102fda:	eb 15                	jmp    102ff1 <strtol+0x53>
    }
    else if (*s == '-') {
  102fdc:	8b 45 08             	mov    0x8(%ebp),%eax
  102fdf:	0f b6 00             	movzbl (%eax),%eax
  102fe2:	3c 2d                	cmp    $0x2d,%al
  102fe4:	75 0b                	jne    102ff1 <strtol+0x53>
        s ++, neg = 1;
  102fe6:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102fea:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
    }

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x')) {
  102ff1:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102ff5:	74 06                	je     102ffd <strtol+0x5f>
  102ff7:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
  102ffb:	75 24                	jne    103021 <strtol+0x83>
  102ffd:	8b 45 08             	mov    0x8(%ebp),%eax
  103000:	0f b6 00             	movzbl (%eax),%eax
  103003:	3c 30                	cmp    $0x30,%al
  103005:	75 1a                	jne    103021 <strtol+0x83>
  103007:	8b 45 08             	mov    0x8(%ebp),%eax
  10300a:	83 c0 01             	add    $0x1,%eax
  10300d:	0f b6 00             	movzbl (%eax),%eax
  103010:	3c 78                	cmp    $0x78,%al
  103012:	75 0d                	jne    103021 <strtol+0x83>
        s += 2, base = 16;
  103014:	83 45 08 02          	addl   $0x2,0x8(%ebp)
  103018:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
  10301f:	eb 2a                	jmp    10304b <strtol+0xad>
    }
    else if (base == 0 && s[0] == '0') {
  103021:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103025:	75 17                	jne    10303e <strtol+0xa0>
  103027:	8b 45 08             	mov    0x8(%ebp),%eax
  10302a:	0f b6 00             	movzbl (%eax),%eax
  10302d:	3c 30                	cmp    $0x30,%al
  10302f:	75 0d                	jne    10303e <strtol+0xa0>
        s ++, base = 8;
  103031:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  103035:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
  10303c:	eb 0d                	jmp    10304b <strtol+0xad>
    }
    else if (base == 0) {
  10303e:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103042:	75 07                	jne    10304b <strtol+0xad>
        base = 10;
  103044:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9') {
  10304b:	8b 45 08             	mov    0x8(%ebp),%eax
  10304e:	0f b6 00             	movzbl (%eax),%eax
  103051:	3c 2f                	cmp    $0x2f,%al
  103053:	7e 1b                	jle    103070 <strtol+0xd2>
  103055:	8b 45 08             	mov    0x8(%ebp),%eax
  103058:	0f b6 00             	movzbl (%eax),%eax
  10305b:	3c 39                	cmp    $0x39,%al
  10305d:	7f 11                	jg     103070 <strtol+0xd2>
            dig = *s - '0';
  10305f:	8b 45 08             	mov    0x8(%ebp),%eax
  103062:	0f b6 00             	movzbl (%eax),%eax
  103065:	0f be c0             	movsbl %al,%eax
  103068:	83 e8 30             	sub    $0x30,%eax
  10306b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10306e:	eb 48                	jmp    1030b8 <strtol+0x11a>
        }
        else if (*s >= 'a' && *s <= 'z') {
  103070:	8b 45 08             	mov    0x8(%ebp),%eax
  103073:	0f b6 00             	movzbl (%eax),%eax
  103076:	3c 60                	cmp    $0x60,%al
  103078:	7e 1b                	jle    103095 <strtol+0xf7>
  10307a:	8b 45 08             	mov    0x8(%ebp),%eax
  10307d:	0f b6 00             	movzbl (%eax),%eax
  103080:	3c 7a                	cmp    $0x7a,%al
  103082:	7f 11                	jg     103095 <strtol+0xf7>
            dig = *s - 'a' + 10;
  103084:	8b 45 08             	mov    0x8(%ebp),%eax
  103087:	0f b6 00             	movzbl (%eax),%eax
  10308a:	0f be c0             	movsbl %al,%eax
  10308d:	83 e8 57             	sub    $0x57,%eax
  103090:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103093:	eb 23                	jmp    1030b8 <strtol+0x11a>
        }
        else if (*s >= 'A' && *s <= 'Z') {
  103095:	8b 45 08             	mov    0x8(%ebp),%eax
  103098:	0f b6 00             	movzbl (%eax),%eax
  10309b:	3c 40                	cmp    $0x40,%al
  10309d:	7e 3d                	jle    1030dc <strtol+0x13e>
  10309f:	8b 45 08             	mov    0x8(%ebp),%eax
  1030a2:	0f b6 00             	movzbl (%eax),%eax
  1030a5:	3c 5a                	cmp    $0x5a,%al
  1030a7:	7f 33                	jg     1030dc <strtol+0x13e>
            dig = *s - 'A' + 10;
  1030a9:	8b 45 08             	mov    0x8(%ebp),%eax
  1030ac:	0f b6 00             	movzbl (%eax),%eax
  1030af:	0f be c0             	movsbl %al,%eax
  1030b2:	83 e8 37             	sub    $0x37,%eax
  1030b5:	89 45 f4             	mov    %eax,-0xc(%ebp)
        }
        else {
            break;
        }
        if (dig >= base) {
  1030b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1030bb:	3b 45 10             	cmp    0x10(%ebp),%eax
  1030be:	7c 02                	jl     1030c2 <strtol+0x124>
            break;
  1030c0:	eb 1a                	jmp    1030dc <strtol+0x13e>
        }
        s ++, val = (val * base) + dig;
  1030c2:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  1030c6:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1030c9:	0f af 45 10          	imul   0x10(%ebp),%eax
  1030cd:	89 c2                	mov    %eax,%edx
  1030cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1030d2:	01 d0                	add    %edx,%eax
  1030d4:	89 45 f8             	mov    %eax,-0x8(%ebp)
        // we don't properly detect overflow!
    }
  1030d7:	e9 6f ff ff ff       	jmp    10304b <strtol+0xad>

    if (endptr) {
  1030dc:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  1030e0:	74 08                	je     1030ea <strtol+0x14c>
        *endptr = (char *) s;
  1030e2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1030e5:	8b 55 08             	mov    0x8(%ebp),%edx
  1030e8:	89 10                	mov    %edx,(%eax)
    }
    return (neg ? -val : val);
  1030ea:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  1030ee:	74 07                	je     1030f7 <strtol+0x159>
  1030f0:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1030f3:	f7 d8                	neg    %eax
  1030f5:	eb 03                	jmp    1030fa <strtol+0x15c>
  1030f7:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  1030fa:	c9                   	leave  
  1030fb:	c3                   	ret    

001030fc <memset>:
 * @n:        number of bytes to be set to the value
 *
 * The memset() function returns @s.
 * */
void *
memset(void *s, char c, size_t n) {
  1030fc:	55                   	push   %ebp
  1030fd:	89 e5                	mov    %esp,%ebp
  1030ff:	57                   	push   %edi
  103100:	83 ec 24             	sub    $0x24,%esp
  103103:	8b 45 0c             	mov    0xc(%ebp),%eax
  103106:	88 45 d8             	mov    %al,-0x28(%ebp)
#ifdef __HAVE_ARCH_MEMSET
    return __memset(s, c, n);
  103109:	0f be 45 d8          	movsbl -0x28(%ebp),%eax
  10310d:	8b 55 08             	mov    0x8(%ebp),%edx
  103110:	89 55 f8             	mov    %edx,-0x8(%ebp)
  103113:	88 45 f7             	mov    %al,-0x9(%ebp)
  103116:	8b 45 10             	mov    0x10(%ebp),%eax
  103119:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_MEMSET
#define __HAVE_ARCH_MEMSET
static inline void *
__memset(void *s, char c, size_t n) {
    int d0, d1;
    asm volatile (
  10311c:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  10311f:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  103123:	8b 55 f8             	mov    -0x8(%ebp),%edx
  103126:	89 d7                	mov    %edx,%edi
  103128:	f3 aa                	rep stos %al,%es:(%edi)
  10312a:	89 fa                	mov    %edi,%edx
  10312c:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  10312f:	89 55 e8             	mov    %edx,-0x18(%ebp)
            "rep; stosb;"
            : "=&c" (d0), "=&D" (d1)
            : "0" (n), "a" (c), "1" (s)
            : "memory");
    return s;
  103132:	8b 45 f8             	mov    -0x8(%ebp),%eax
    while (n -- > 0) {
        *p ++ = c;
    }
    return s;
#endif /* __HAVE_ARCH_MEMSET */
}
  103135:	83 c4 24             	add    $0x24,%esp
  103138:	5f                   	pop    %edi
  103139:	5d                   	pop    %ebp
  10313a:	c3                   	ret    

0010313b <memmove>:
 * @n:        number of bytes to copy
 *
 * The memmove() function returns @dst.
 * */
void *
memmove(void *dst, const void *src, size_t n) {
  10313b:	55                   	push   %ebp
  10313c:	89 e5                	mov    %esp,%ebp
  10313e:	57                   	push   %edi
  10313f:	56                   	push   %esi
  103140:	53                   	push   %ebx
  103141:	83 ec 30             	sub    $0x30,%esp
  103144:	8b 45 08             	mov    0x8(%ebp),%eax
  103147:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10314a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10314d:	89 45 ec             	mov    %eax,-0x14(%ebp)
  103150:	8b 45 10             	mov    0x10(%ebp),%eax
  103153:	89 45 e8             	mov    %eax,-0x18(%ebp)

#ifndef __HAVE_ARCH_MEMMOVE
#define __HAVE_ARCH_MEMMOVE
static inline void *
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
  103156:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103159:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  10315c:	73 42                	jae    1031a0 <memmove+0x65>
  10315e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103161:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  103164:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103167:	89 45 e0             	mov    %eax,-0x20(%ebp)
  10316a:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10316d:	89 45 dc             	mov    %eax,-0x24(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  103170:	8b 45 dc             	mov    -0x24(%ebp),%eax
  103173:	c1 e8 02             	shr    $0x2,%eax
  103176:	89 c1                	mov    %eax,%ecx
#ifndef __HAVE_ARCH_MEMCPY
#define __HAVE_ARCH_MEMCPY
static inline void *
__memcpy(void *dst, const void *src, size_t n) {
    int d0, d1, d2;
    asm volatile (
  103178:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  10317b:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10317e:	89 d7                	mov    %edx,%edi
  103180:	89 c6                	mov    %eax,%esi
  103182:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  103184:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  103187:	83 e1 03             	and    $0x3,%ecx
  10318a:	74 02                	je     10318e <memmove+0x53>
  10318c:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  10318e:	89 f0                	mov    %esi,%eax
  103190:	89 fa                	mov    %edi,%edx
  103192:	89 4d d8             	mov    %ecx,-0x28(%ebp)
  103195:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  103198:	89 45 d0             	mov    %eax,-0x30(%ebp)
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
            : "memory");
    return dst;
  10319b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10319e:	eb 36                	jmp    1031d6 <memmove+0x9b>
    asm volatile (
            "std;"
            "rep; movsb;"
            "cld;"
            : "=&c" (d0), "=&S" (d1), "=&D" (d2)
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
  1031a0:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1031a3:	8d 50 ff             	lea    -0x1(%eax),%edx
  1031a6:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1031a9:	01 c2                	add    %eax,%edx
  1031ab:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1031ae:	8d 48 ff             	lea    -0x1(%eax),%ecx
  1031b1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1031b4:	8d 1c 01             	lea    (%ecx,%eax,1),%ebx
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
        return __memcpy(dst, src, n);
    }
    int d0, d1, d2;
    asm volatile (
  1031b7:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1031ba:	89 c1                	mov    %eax,%ecx
  1031bc:	89 d8                	mov    %ebx,%eax
  1031be:	89 d6                	mov    %edx,%esi
  1031c0:	89 c7                	mov    %eax,%edi
  1031c2:	fd                   	std    
  1031c3:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  1031c5:	fc                   	cld    
  1031c6:	89 f8                	mov    %edi,%eax
  1031c8:	89 f2                	mov    %esi,%edx
  1031ca:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  1031cd:	89 55 c8             	mov    %edx,-0x38(%ebp)
  1031d0:	89 45 c4             	mov    %eax,-0x3c(%ebp)
            "rep; movsb;"
            "cld;"
            : "=&c" (d0), "=&S" (d1), "=&D" (d2)
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
            : "memory");
    return dst;
  1031d3:	8b 45 f0             	mov    -0x10(%ebp),%eax
            *d ++ = *s ++;
        }
    }
    return dst;
#endif /* __HAVE_ARCH_MEMMOVE */
}
  1031d6:	83 c4 30             	add    $0x30,%esp
  1031d9:	5b                   	pop    %ebx
  1031da:	5e                   	pop    %esi
  1031db:	5f                   	pop    %edi
  1031dc:	5d                   	pop    %ebp
  1031dd:	c3                   	ret    

001031de <memcpy>:
 * it always copies exactly @n bytes. To avoid overflows, the size of arrays pointed
 * by both @src and @dst, should be at least @n bytes, and should not overlap
 * (for overlapping memory area, memmove is a safer approach).
 * */
void *
memcpy(void *dst, const void *src, size_t n) {
  1031de:	55                   	push   %ebp
  1031df:	89 e5                	mov    %esp,%ebp
  1031e1:	57                   	push   %edi
  1031e2:	56                   	push   %esi
  1031e3:	83 ec 20             	sub    $0x20,%esp
  1031e6:	8b 45 08             	mov    0x8(%ebp),%eax
  1031e9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1031ec:	8b 45 0c             	mov    0xc(%ebp),%eax
  1031ef:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1031f2:	8b 45 10             	mov    0x10(%ebp),%eax
  1031f5:	89 45 ec             	mov    %eax,-0x14(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  1031f8:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1031fb:	c1 e8 02             	shr    $0x2,%eax
  1031fe:	89 c1                	mov    %eax,%ecx
#ifndef __HAVE_ARCH_MEMCPY
#define __HAVE_ARCH_MEMCPY
static inline void *
__memcpy(void *dst, const void *src, size_t n) {
    int d0, d1, d2;
    asm volatile (
  103200:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103203:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103206:	89 d7                	mov    %edx,%edi
  103208:	89 c6                	mov    %eax,%esi
  10320a:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  10320c:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  10320f:	83 e1 03             	and    $0x3,%ecx
  103212:	74 02                	je     103216 <memcpy+0x38>
  103214:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  103216:	89 f0                	mov    %esi,%eax
  103218:	89 fa                	mov    %edi,%edx
  10321a:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  10321d:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  103220:	89 45 e0             	mov    %eax,-0x20(%ebp)
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
            : "memory");
    return dst;
  103223:	8b 45 f4             	mov    -0xc(%ebp),%eax
    while (n -- > 0) {
        *d ++ = *s ++;
    }
    return dst;
#endif /* __HAVE_ARCH_MEMCPY */
}
  103226:	83 c4 20             	add    $0x20,%esp
  103229:	5e                   	pop    %esi
  10322a:	5f                   	pop    %edi
  10322b:	5d                   	pop    %ebp
  10322c:	c3                   	ret    

0010322d <memcmp>:
 *   match in both memory blocks has a greater value in @v1 than in @v2
 *   as if evaluated as unsigned char values;
 * - And a value less than zero indicates the opposite.
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
  10322d:	55                   	push   %ebp
  10322e:	89 e5                	mov    %esp,%ebp
  103230:	83 ec 10             	sub    $0x10,%esp
    const char *s1 = (const char *)v1;
  103233:	8b 45 08             	mov    0x8(%ebp),%eax
  103236:	89 45 fc             	mov    %eax,-0x4(%ebp)
    const char *s2 = (const char *)v2;
  103239:	8b 45 0c             	mov    0xc(%ebp),%eax
  10323c:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (n -- > 0) {
  10323f:	eb 30                	jmp    103271 <memcmp+0x44>
        if (*s1 != *s2) {
  103241:	8b 45 fc             	mov    -0x4(%ebp),%eax
  103244:	0f b6 10             	movzbl (%eax),%edx
  103247:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10324a:	0f b6 00             	movzbl (%eax),%eax
  10324d:	38 c2                	cmp    %al,%dl
  10324f:	74 18                	je     103269 <memcmp+0x3c>
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
  103251:	8b 45 fc             	mov    -0x4(%ebp),%eax
  103254:	0f b6 00             	movzbl (%eax),%eax
  103257:	0f b6 d0             	movzbl %al,%edx
  10325a:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10325d:	0f b6 00             	movzbl (%eax),%eax
  103260:	0f b6 c0             	movzbl %al,%eax
  103263:	29 c2                	sub    %eax,%edx
  103265:	89 d0                	mov    %edx,%eax
  103267:	eb 1a                	jmp    103283 <memcmp+0x56>
        }
        s1 ++, s2 ++;
  103269:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  10326d:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
    const char *s1 = (const char *)v1;
    const char *s2 = (const char *)v2;
    while (n -- > 0) {
  103271:	8b 45 10             	mov    0x10(%ebp),%eax
  103274:	8d 50 ff             	lea    -0x1(%eax),%edx
  103277:	89 55 10             	mov    %edx,0x10(%ebp)
  10327a:	85 c0                	test   %eax,%eax
  10327c:	75 c3                	jne    103241 <memcmp+0x14>
        if (*s1 != *s2) {
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
        }
        s1 ++, s2 ++;
    }
    return 0;
  10327e:	b8 00 00 00 00       	mov    $0x0,%eax
}
  103283:	c9                   	leave  
  103284:	c3                   	ret    
