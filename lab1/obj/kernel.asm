
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
  100027:	e8 f9 30 00 00       	call   103125 <memset>

    cons_init();                // init the console
  10002c:	e8 1f 15 00 00       	call   101550 <cons_init>

    const char *message = "(THU.CST) os is loading ...";
  100031:	c7 45 f4 c0 32 10 00 	movl   $0x1032c0,-0xc(%ebp)
    cprintf("%s\n\n", message);
  100038:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10003b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10003f:	c7 04 24 dc 32 10 00 	movl   $0x1032dc,(%esp)
  100046:	e8 c7 02 00 00       	call   100312 <cprintf>

    print_kerninfo();
  10004b:	e8 f6 07 00 00       	call   100846 <print_kerninfo>

    grade_backtrace();
  100050:	e8 86 00 00 00       	call   1000db <grade_backtrace>

    pmm_init();                 // init physical memory management
  100055:	e8 11 27 00 00       	call   10276b <pmm_init>

    pic_init();                 // init interrupt controller
  10005a:	e8 34 16 00 00       	call   101693 <pic_init>
    idt_init();                 // init interrupt descriptor table
  10005f:	e8 86 17 00 00       	call   1017ea <idt_init>

    clock_init();               // init clock interrupt
  100064:	e8 da 0c 00 00       	call   100d43 <clock_init>
    intr_enable();              // enable irq interrupt
  100069:	e8 93 15 00 00       	call   101601 <intr_enable>
    //LAB1: CAHLLENGE 1 If you try to do it, uncomment lab1_switch_test()
    // user/kernel mode switch test
    //lab1_switch_test();

    /* do nothing */
    while (1);
  10006e:	eb fe                	jmp    10006e <kern_init+0x6e>

00100070 <grade_backtrace2>:
}

void __attribute__((noinline))
grade_backtrace2(int arg0, int arg1, int arg2, int arg3) {
  100070:	55                   	push   %ebp
  100071:	89 e5                	mov    %esp,%ebp
  100073:	83 ec 18             	sub    $0x18,%esp
    mon_backtrace(0, NULL, NULL);
  100076:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  10007d:	00 
  10007e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  100085:	00 
  100086:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  10008d:	e8 e3 0b 00 00       	call   100c75 <mon_backtrace>
}
  100092:	c9                   	leave  
  100093:	c3                   	ret    

00100094 <grade_backtrace1>:

void __attribute__((noinline))
grade_backtrace1(int arg0, int arg1) {
  100094:	55                   	push   %ebp
  100095:	89 e5                	mov    %esp,%ebp
  100097:	53                   	push   %ebx
  100098:	83 ec 14             	sub    $0x14,%esp
    grade_backtrace2(arg0, (int)&arg0, arg1, (int)&arg1);
  10009b:	8d 5d 0c             	lea    0xc(%ebp),%ebx
  10009e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  1000a1:	8d 55 08             	lea    0x8(%ebp),%edx
  1000a4:	8b 45 08             	mov    0x8(%ebp),%eax
  1000a7:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  1000ab:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  1000af:	89 54 24 04          	mov    %edx,0x4(%esp)
  1000b3:	89 04 24             	mov    %eax,(%esp)
  1000b6:	e8 b5 ff ff ff       	call   100070 <grade_backtrace2>
}
  1000bb:	83 c4 14             	add    $0x14,%esp
  1000be:	5b                   	pop    %ebx
  1000bf:	5d                   	pop    %ebp
  1000c0:	c3                   	ret    

001000c1 <grade_backtrace0>:

void __attribute__((noinline))
grade_backtrace0(int arg0, int arg1, int arg2) {
  1000c1:	55                   	push   %ebp
  1000c2:	89 e5                	mov    %esp,%ebp
  1000c4:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace1(arg0, arg2);
  1000c7:	8b 45 10             	mov    0x10(%ebp),%eax
  1000ca:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000ce:	8b 45 08             	mov    0x8(%ebp),%eax
  1000d1:	89 04 24             	mov    %eax,(%esp)
  1000d4:	e8 bb ff ff ff       	call   100094 <grade_backtrace1>
}
  1000d9:	c9                   	leave  
  1000da:	c3                   	ret    

001000db <grade_backtrace>:

void
grade_backtrace(void) {
  1000db:	55                   	push   %ebp
  1000dc:	89 e5                	mov    %esp,%ebp
  1000de:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace0(0, (int)kern_init, 0xffff0000);
  1000e1:	b8 00 00 10 00       	mov    $0x100000,%eax
  1000e6:	c7 44 24 08 00 00 ff 	movl   $0xffff0000,0x8(%esp)
  1000ed:	ff 
  1000ee:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000f2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  1000f9:	e8 c3 ff ff ff       	call   1000c1 <grade_backtrace0>
}
  1000fe:	c9                   	leave  
  1000ff:	c3                   	ret    

00100100 <lab1_print_cur_status>:

static void
lab1_print_cur_status(void) {
  100100:	55                   	push   %ebp
  100101:	89 e5                	mov    %esp,%ebp
  100103:	83 ec 28             	sub    $0x28,%esp
    static int round = 0;
    uint16_t reg1, reg2, reg3, reg4;
    asm volatile (
  100106:	8c 4d f6             	mov    %cs,-0xa(%ebp)
  100109:	8c 5d f4             	mov    %ds,-0xc(%ebp)
  10010c:	8c 45 f2             	mov    %es,-0xe(%ebp)
  10010f:	8c 55 f0             	mov    %ss,-0x10(%ebp)
            "mov %%cs, %0;"
            "mov %%ds, %1;"
            "mov %%es, %2;"
            "mov %%ss, %3;"
            : "=m"(reg1), "=m"(reg2), "=m"(reg3), "=m"(reg4));
    cprintf("%d: @ring %d\n", round, reg1 & 3);
  100112:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100116:	0f b7 c0             	movzwl %ax,%eax
  100119:	83 e0 03             	and    $0x3,%eax
  10011c:	89 c2                	mov    %eax,%edx
  10011e:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100123:	89 54 24 08          	mov    %edx,0x8(%esp)
  100127:	89 44 24 04          	mov    %eax,0x4(%esp)
  10012b:	c7 04 24 e1 32 10 00 	movl   $0x1032e1,(%esp)
  100132:	e8 db 01 00 00       	call   100312 <cprintf>
    cprintf("%d:  cs = %x\n", round, reg1);
  100137:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10013b:	0f b7 d0             	movzwl %ax,%edx
  10013e:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100143:	89 54 24 08          	mov    %edx,0x8(%esp)
  100147:	89 44 24 04          	mov    %eax,0x4(%esp)
  10014b:	c7 04 24 ef 32 10 00 	movl   $0x1032ef,(%esp)
  100152:	e8 bb 01 00 00       	call   100312 <cprintf>
    cprintf("%d:  ds = %x\n", round, reg2);
  100157:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  10015b:	0f b7 d0             	movzwl %ax,%edx
  10015e:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100163:	89 54 24 08          	mov    %edx,0x8(%esp)
  100167:	89 44 24 04          	mov    %eax,0x4(%esp)
  10016b:	c7 04 24 fd 32 10 00 	movl   $0x1032fd,(%esp)
  100172:	e8 9b 01 00 00       	call   100312 <cprintf>
    cprintf("%d:  es = %x\n", round, reg3);
  100177:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  10017b:	0f b7 d0             	movzwl %ax,%edx
  10017e:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100183:	89 54 24 08          	mov    %edx,0x8(%esp)
  100187:	89 44 24 04          	mov    %eax,0x4(%esp)
  10018b:	c7 04 24 0b 33 10 00 	movl   $0x10330b,(%esp)
  100192:	e8 7b 01 00 00       	call   100312 <cprintf>
    cprintf("%d:  ss = %x\n", round, reg4);
  100197:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  10019b:	0f b7 d0             	movzwl %ax,%edx
  10019e:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  1001a3:	89 54 24 08          	mov    %edx,0x8(%esp)
  1001a7:	89 44 24 04          	mov    %eax,0x4(%esp)
  1001ab:	c7 04 24 19 33 10 00 	movl   $0x103319,(%esp)
  1001b2:	e8 5b 01 00 00       	call   100312 <cprintf>
    round ++;
  1001b7:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  1001bc:	83 c0 01             	add    $0x1,%eax
  1001bf:	a3 20 ea 10 00       	mov    %eax,0x10ea20
}
  1001c4:	c9                   	leave  
  1001c5:	c3                   	ret    

001001c6 <lab1_switch_to_user>:

static void
lab1_switch_to_user(void) {
  1001c6:	55                   	push   %ebp
  1001c7:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 : TODO
}
  1001c9:	5d                   	pop    %ebp
  1001ca:	c3                   	ret    

001001cb <lab1_switch_to_kernel>:

static void
lab1_switch_to_kernel(void) {
  1001cb:	55                   	push   %ebp
  1001cc:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 :  TODO
}
  1001ce:	5d                   	pop    %ebp
  1001cf:	c3                   	ret    

001001d0 <lab1_switch_test>:

static void
lab1_switch_test(void) {
  1001d0:	55                   	push   %ebp
  1001d1:	89 e5                	mov    %esp,%ebp
  1001d3:	83 ec 18             	sub    $0x18,%esp
    lab1_print_cur_status();
  1001d6:	e8 25 ff ff ff       	call   100100 <lab1_print_cur_status>
    cprintf("+++ switch to  user  mode +++\n");
  1001db:	c7 04 24 28 33 10 00 	movl   $0x103328,(%esp)
  1001e2:	e8 2b 01 00 00       	call   100312 <cprintf>
    lab1_switch_to_user();
  1001e7:	e8 da ff ff ff       	call   1001c6 <lab1_switch_to_user>
    lab1_print_cur_status();
  1001ec:	e8 0f ff ff ff       	call   100100 <lab1_print_cur_status>
    cprintf("+++ switch to kernel mode +++\n");
  1001f1:	c7 04 24 48 33 10 00 	movl   $0x103348,(%esp)
  1001f8:	e8 15 01 00 00       	call   100312 <cprintf>
    lab1_switch_to_kernel();
  1001fd:	e8 c9 ff ff ff       	call   1001cb <lab1_switch_to_kernel>
    lab1_print_cur_status();
  100202:	e8 f9 fe ff ff       	call   100100 <lab1_print_cur_status>
}
  100207:	c9                   	leave  
  100208:	c3                   	ret    

00100209 <readline>:
 * The readline() function returns the text of the line read. If some errors
 * are happened, NULL is returned. The return value is a global variable,
 * thus it should be copied before it is used.
 * */
char *
readline(const char *prompt) {
  100209:	55                   	push   %ebp
  10020a:	89 e5                	mov    %esp,%ebp
  10020c:	83 ec 28             	sub    $0x28,%esp
    if (prompt != NULL) {
  10020f:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100213:	74 13                	je     100228 <readline+0x1f>
        cprintf("%s", prompt);
  100215:	8b 45 08             	mov    0x8(%ebp),%eax
  100218:	89 44 24 04          	mov    %eax,0x4(%esp)
  10021c:	c7 04 24 67 33 10 00 	movl   $0x103367,(%esp)
  100223:	e8 ea 00 00 00       	call   100312 <cprintf>
    }
    int i = 0, c;
  100228:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        c = getchar();
  10022f:	e8 66 01 00 00       	call   10039a <getchar>
  100234:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if (c < 0) {
  100237:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  10023b:	79 07                	jns    100244 <readline+0x3b>
            return NULL;
  10023d:	b8 00 00 00 00       	mov    $0x0,%eax
  100242:	eb 79                	jmp    1002bd <readline+0xb4>
        }
        else if (c >= ' ' && i < BUFSIZE - 1) {
  100244:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
  100248:	7e 28                	jle    100272 <readline+0x69>
  10024a:	81 7d f4 fe 03 00 00 	cmpl   $0x3fe,-0xc(%ebp)
  100251:	7f 1f                	jg     100272 <readline+0x69>
            cputchar(c);
  100253:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100256:	89 04 24             	mov    %eax,(%esp)
  100259:	e8 da 00 00 00       	call   100338 <cputchar>
            buf[i ++] = c;
  10025e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100261:	8d 50 01             	lea    0x1(%eax),%edx
  100264:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100267:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10026a:	88 90 40 ea 10 00    	mov    %dl,0x10ea40(%eax)
  100270:	eb 46                	jmp    1002b8 <readline+0xaf>
        }
        else if (c == '\b' && i > 0) {
  100272:	83 7d f0 08          	cmpl   $0x8,-0x10(%ebp)
  100276:	75 17                	jne    10028f <readline+0x86>
  100278:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10027c:	7e 11                	jle    10028f <readline+0x86>
            cputchar(c);
  10027e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100281:	89 04 24             	mov    %eax,(%esp)
  100284:	e8 af 00 00 00       	call   100338 <cputchar>
            i --;
  100289:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  10028d:	eb 29                	jmp    1002b8 <readline+0xaf>
        }
        else if (c == '\n' || c == '\r') {
  10028f:	83 7d f0 0a          	cmpl   $0xa,-0x10(%ebp)
  100293:	74 06                	je     10029b <readline+0x92>
  100295:	83 7d f0 0d          	cmpl   $0xd,-0x10(%ebp)
  100299:	75 1d                	jne    1002b8 <readline+0xaf>
            cputchar(c);
  10029b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10029e:	89 04 24             	mov    %eax,(%esp)
  1002a1:	e8 92 00 00 00       	call   100338 <cputchar>
            buf[i] = '\0';
  1002a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1002a9:	05 40 ea 10 00       	add    $0x10ea40,%eax
  1002ae:	c6 00 00             	movb   $0x0,(%eax)
            return buf;
  1002b1:	b8 40 ea 10 00       	mov    $0x10ea40,%eax
  1002b6:	eb 05                	jmp    1002bd <readline+0xb4>
        }
    }
  1002b8:	e9 72 ff ff ff       	jmp    10022f <readline+0x26>
}
  1002bd:	c9                   	leave  
  1002be:	c3                   	ret    

001002bf <cputch>:
/* *
 * cputch - writes a single character @c to stdout, and it will
 * increace the value of counter pointed by @cnt.
 * */
static void
cputch(int c, int *cnt) {
  1002bf:	55                   	push   %ebp
  1002c0:	89 e5                	mov    %esp,%ebp
  1002c2:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  1002c5:	8b 45 08             	mov    0x8(%ebp),%eax
  1002c8:	89 04 24             	mov    %eax,(%esp)
  1002cb:	e8 ac 12 00 00       	call   10157c <cons_putc>
    (*cnt) ++;
  1002d0:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002d3:	8b 00                	mov    (%eax),%eax
  1002d5:	8d 50 01             	lea    0x1(%eax),%edx
  1002d8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002db:	89 10                	mov    %edx,(%eax)
}
  1002dd:	c9                   	leave  
  1002de:	c3                   	ret    

001002df <vcprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want cprintf() instead.
 * */
int
vcprintf(const char *fmt, va_list ap) {
  1002df:	55                   	push   %ebp
  1002e0:	89 e5                	mov    %esp,%ebp
  1002e2:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  1002e5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    vprintfmt((void*)cputch, &cnt, fmt, ap);
  1002ec:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002ef:	89 44 24 0c          	mov    %eax,0xc(%esp)
  1002f3:	8b 45 08             	mov    0x8(%ebp),%eax
  1002f6:	89 44 24 08          	mov    %eax,0x8(%esp)
  1002fa:	8d 45 f4             	lea    -0xc(%ebp),%eax
  1002fd:	89 44 24 04          	mov    %eax,0x4(%esp)
  100301:	c7 04 24 bf 02 10 00 	movl   $0x1002bf,(%esp)
  100308:	e8 31 26 00 00       	call   10293e <vprintfmt>
    return cnt;
  10030d:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100310:	c9                   	leave  
  100311:	c3                   	ret    

00100312 <cprintf>:
 *
 * The return value is the number of characters which would be
 * written to stdout.
 * */
int
cprintf(const char *fmt, ...) {
  100312:	55                   	push   %ebp
  100313:	89 e5                	mov    %esp,%ebp
  100315:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  100318:	8d 45 0c             	lea    0xc(%ebp),%eax
  10031b:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vcprintf(fmt, ap);
  10031e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100321:	89 44 24 04          	mov    %eax,0x4(%esp)
  100325:	8b 45 08             	mov    0x8(%ebp),%eax
  100328:	89 04 24             	mov    %eax,(%esp)
  10032b:	e8 af ff ff ff       	call   1002df <vcprintf>
  100330:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  100333:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100336:	c9                   	leave  
  100337:	c3                   	ret    

00100338 <cputchar>:

/* cputchar - writes a single character to stdout */
void
cputchar(int c) {
  100338:	55                   	push   %ebp
  100339:	89 e5                	mov    %esp,%ebp
  10033b:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  10033e:	8b 45 08             	mov    0x8(%ebp),%eax
  100341:	89 04 24             	mov    %eax,(%esp)
  100344:	e8 33 12 00 00       	call   10157c <cons_putc>
}
  100349:	c9                   	leave  
  10034a:	c3                   	ret    

0010034b <cputs>:
/* *
 * cputs- writes the string pointed by @str to stdout and
 * appends a newline character.
 * */
int
cputs(const char *str) {
  10034b:	55                   	push   %ebp
  10034c:	89 e5                	mov    %esp,%ebp
  10034e:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  100351:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    char c;
    while ((c = *str ++) != '\0') {
  100358:	eb 13                	jmp    10036d <cputs+0x22>
        cputch(c, &cnt);
  10035a:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  10035e:	8d 55 f0             	lea    -0x10(%ebp),%edx
  100361:	89 54 24 04          	mov    %edx,0x4(%esp)
  100365:	89 04 24             	mov    %eax,(%esp)
  100368:	e8 52 ff ff ff       	call   1002bf <cputch>
 * */
int
cputs(const char *str) {
    int cnt = 0;
    char c;
    while ((c = *str ++) != '\0') {
  10036d:	8b 45 08             	mov    0x8(%ebp),%eax
  100370:	8d 50 01             	lea    0x1(%eax),%edx
  100373:	89 55 08             	mov    %edx,0x8(%ebp)
  100376:	0f b6 00             	movzbl (%eax),%eax
  100379:	88 45 f7             	mov    %al,-0x9(%ebp)
  10037c:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
  100380:	75 d8                	jne    10035a <cputs+0xf>
        cputch(c, &cnt);
    }
    cputch('\n', &cnt);
  100382:	8d 45 f0             	lea    -0x10(%ebp),%eax
  100385:	89 44 24 04          	mov    %eax,0x4(%esp)
  100389:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
  100390:	e8 2a ff ff ff       	call   1002bf <cputch>
    return cnt;
  100395:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  100398:	c9                   	leave  
  100399:	c3                   	ret    

0010039a <getchar>:

/* getchar - reads a single non-zero character from stdin */
int
getchar(void) {
  10039a:	55                   	push   %ebp
  10039b:	89 e5                	mov    %esp,%ebp
  10039d:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = cons_getc()) == 0)
  1003a0:	e8 00 12 00 00       	call   1015a5 <cons_getc>
  1003a5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1003a8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1003ac:	74 f2                	je     1003a0 <getchar+0x6>
        /* do nothing */;
    return c;
  1003ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1003b1:	c9                   	leave  
  1003b2:	c3                   	ret    

001003b3 <stab_binsearch>:
 *      stab_binsearch(stabs, &left, &right, N_SO, 0xf0100184);
 * will exit setting left = 118, right = 554.
 * */
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
  1003b3:	55                   	push   %ebp
  1003b4:	89 e5                	mov    %esp,%ebp
  1003b6:	83 ec 20             	sub    $0x20,%esp
    int l = *region_left, r = *region_right, any_matches = 0;
  1003b9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1003bc:	8b 00                	mov    (%eax),%eax
  1003be:	89 45 fc             	mov    %eax,-0x4(%ebp)
  1003c1:	8b 45 10             	mov    0x10(%ebp),%eax
  1003c4:	8b 00                	mov    (%eax),%eax
  1003c6:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1003c9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

    while (l <= r) {
  1003d0:	e9 d2 00 00 00       	jmp    1004a7 <stab_binsearch+0xf4>
        int true_m = (l + r) / 2, m = true_m;
  1003d5:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1003d8:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1003db:	01 d0                	add    %edx,%eax
  1003dd:	89 c2                	mov    %eax,%edx
  1003df:	c1 ea 1f             	shr    $0x1f,%edx
  1003e2:	01 d0                	add    %edx,%eax
  1003e4:	d1 f8                	sar    %eax
  1003e6:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1003e9:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1003ec:	89 45 f0             	mov    %eax,-0x10(%ebp)

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  1003ef:	eb 04                	jmp    1003f5 <stab_binsearch+0x42>
            m --;
  1003f1:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)

    while (l <= r) {
        int true_m = (l + r) / 2, m = true_m;

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  1003f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1003f8:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1003fb:	7c 1f                	jl     10041c <stab_binsearch+0x69>
  1003fd:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100400:	89 d0                	mov    %edx,%eax
  100402:	01 c0                	add    %eax,%eax
  100404:	01 d0                	add    %edx,%eax
  100406:	c1 e0 02             	shl    $0x2,%eax
  100409:	89 c2                	mov    %eax,%edx
  10040b:	8b 45 08             	mov    0x8(%ebp),%eax
  10040e:	01 d0                	add    %edx,%eax
  100410:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100414:	0f b6 c0             	movzbl %al,%eax
  100417:	3b 45 14             	cmp    0x14(%ebp),%eax
  10041a:	75 d5                	jne    1003f1 <stab_binsearch+0x3e>
            m --;
        }
        if (m < l) {    // no match in [l, m]
  10041c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10041f:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  100422:	7d 0b                	jge    10042f <stab_binsearch+0x7c>
            l = true_m + 1;
  100424:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100427:	83 c0 01             	add    $0x1,%eax
  10042a:	89 45 fc             	mov    %eax,-0x4(%ebp)
            continue;
  10042d:	eb 78                	jmp    1004a7 <stab_binsearch+0xf4>
        }

        // actual binary search
        any_matches = 1;
  10042f:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
        if (stabs[m].n_value < addr) {
  100436:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100439:	89 d0                	mov    %edx,%eax
  10043b:	01 c0                	add    %eax,%eax
  10043d:	01 d0                	add    %edx,%eax
  10043f:	c1 e0 02             	shl    $0x2,%eax
  100442:	89 c2                	mov    %eax,%edx
  100444:	8b 45 08             	mov    0x8(%ebp),%eax
  100447:	01 d0                	add    %edx,%eax
  100449:	8b 40 08             	mov    0x8(%eax),%eax
  10044c:	3b 45 18             	cmp    0x18(%ebp),%eax
  10044f:	73 13                	jae    100464 <stab_binsearch+0xb1>
            *region_left = m;
  100451:	8b 45 0c             	mov    0xc(%ebp),%eax
  100454:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100457:	89 10                	mov    %edx,(%eax)
            l = true_m + 1;
  100459:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10045c:	83 c0 01             	add    $0x1,%eax
  10045f:	89 45 fc             	mov    %eax,-0x4(%ebp)
  100462:	eb 43                	jmp    1004a7 <stab_binsearch+0xf4>
        } else if (stabs[m].n_value > addr) {
  100464:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100467:	89 d0                	mov    %edx,%eax
  100469:	01 c0                	add    %eax,%eax
  10046b:	01 d0                	add    %edx,%eax
  10046d:	c1 e0 02             	shl    $0x2,%eax
  100470:	89 c2                	mov    %eax,%edx
  100472:	8b 45 08             	mov    0x8(%ebp),%eax
  100475:	01 d0                	add    %edx,%eax
  100477:	8b 40 08             	mov    0x8(%eax),%eax
  10047a:	3b 45 18             	cmp    0x18(%ebp),%eax
  10047d:	76 16                	jbe    100495 <stab_binsearch+0xe2>
            *region_right = m - 1;
  10047f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100482:	8d 50 ff             	lea    -0x1(%eax),%edx
  100485:	8b 45 10             	mov    0x10(%ebp),%eax
  100488:	89 10                	mov    %edx,(%eax)
            r = m - 1;
  10048a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10048d:	83 e8 01             	sub    $0x1,%eax
  100490:	89 45 f8             	mov    %eax,-0x8(%ebp)
  100493:	eb 12                	jmp    1004a7 <stab_binsearch+0xf4>
        } else {
            // exact match for 'addr', but continue loop to find
            // *region_right
            *region_left = m;
  100495:	8b 45 0c             	mov    0xc(%ebp),%eax
  100498:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10049b:	89 10                	mov    %edx,(%eax)
            l = m;
  10049d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1004a0:	89 45 fc             	mov    %eax,-0x4(%ebp)
            addr ++;
  1004a3:	83 45 18 01          	addl   $0x1,0x18(%ebp)
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
    int l = *region_left, r = *region_right, any_matches = 0;

    while (l <= r) {
  1004a7:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1004aa:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  1004ad:	0f 8e 22 ff ff ff    	jle    1003d5 <stab_binsearch+0x22>
            l = m;
            addr ++;
        }
    }

    if (!any_matches) {
  1004b3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1004b7:	75 0f                	jne    1004c8 <stab_binsearch+0x115>
        *region_right = *region_left - 1;
  1004b9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004bc:	8b 00                	mov    (%eax),%eax
  1004be:	8d 50 ff             	lea    -0x1(%eax),%edx
  1004c1:	8b 45 10             	mov    0x10(%ebp),%eax
  1004c4:	89 10                	mov    %edx,(%eax)
  1004c6:	eb 3f                	jmp    100507 <stab_binsearch+0x154>
    }
    else {
        // find rightmost region containing 'addr'
        l = *region_right;
  1004c8:	8b 45 10             	mov    0x10(%ebp),%eax
  1004cb:	8b 00                	mov    (%eax),%eax
  1004cd:	89 45 fc             	mov    %eax,-0x4(%ebp)
        for (; l > *region_left && stabs[l].n_type != type; l --)
  1004d0:	eb 04                	jmp    1004d6 <stab_binsearch+0x123>
  1004d2:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
  1004d6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004d9:	8b 00                	mov    (%eax),%eax
  1004db:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1004de:	7d 1f                	jge    1004ff <stab_binsearch+0x14c>
  1004e0:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1004e3:	89 d0                	mov    %edx,%eax
  1004e5:	01 c0                	add    %eax,%eax
  1004e7:	01 d0                	add    %edx,%eax
  1004e9:	c1 e0 02             	shl    $0x2,%eax
  1004ec:	89 c2                	mov    %eax,%edx
  1004ee:	8b 45 08             	mov    0x8(%ebp),%eax
  1004f1:	01 d0                	add    %edx,%eax
  1004f3:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1004f7:	0f b6 c0             	movzbl %al,%eax
  1004fa:	3b 45 14             	cmp    0x14(%ebp),%eax
  1004fd:	75 d3                	jne    1004d2 <stab_binsearch+0x11f>
            /* do nothing */;
        *region_left = l;
  1004ff:	8b 45 0c             	mov    0xc(%ebp),%eax
  100502:	8b 55 fc             	mov    -0x4(%ebp),%edx
  100505:	89 10                	mov    %edx,(%eax)
    }
}
  100507:	c9                   	leave  
  100508:	c3                   	ret    

00100509 <debuginfo_eip>:
 * the specified instruction address, @addr.  Returns 0 if information
 * was found, and negative if not.  But even if it returns negative it
 * has stored some information into '*info'.
 * */
int
debuginfo_eip(uintptr_t addr, struct eipdebuginfo *info) {
  100509:	55                   	push   %ebp
  10050a:	89 e5                	mov    %esp,%ebp
  10050c:	83 ec 58             	sub    $0x58,%esp
    const struct stab *stabs, *stab_end;
    const char *stabstr, *stabstr_end;

    info->eip_file = "<unknown>";
  10050f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100512:	c7 00 6c 33 10 00    	movl   $0x10336c,(%eax)
    info->eip_line = 0;
  100518:	8b 45 0c             	mov    0xc(%ebp),%eax
  10051b:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    info->eip_fn_name = "<unknown>";
  100522:	8b 45 0c             	mov    0xc(%ebp),%eax
  100525:	c7 40 08 6c 33 10 00 	movl   $0x10336c,0x8(%eax)
    info->eip_fn_namelen = 9;
  10052c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10052f:	c7 40 0c 09 00 00 00 	movl   $0x9,0xc(%eax)
    info->eip_fn_addr = addr;
  100536:	8b 45 0c             	mov    0xc(%ebp),%eax
  100539:	8b 55 08             	mov    0x8(%ebp),%edx
  10053c:	89 50 10             	mov    %edx,0x10(%eax)
    info->eip_fn_narg = 0;
  10053f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100542:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)

    stabs = __STAB_BEGIN__;
  100549:	c7 45 f4 cc 3b 10 00 	movl   $0x103bcc,-0xc(%ebp)
    stab_end = __STAB_END__;
  100550:	c7 45 f0 28 b2 10 00 	movl   $0x10b228,-0x10(%ebp)
    stabstr = __STABSTR_BEGIN__;
  100557:	c7 45 ec 29 b2 10 00 	movl   $0x10b229,-0x14(%ebp)
    stabstr_end = __STABSTR_END__;
  10055e:	c7 45 e8 19 d2 10 00 	movl   $0x10d219,-0x18(%ebp)

    // String table validity checks
    if (stabstr_end <= stabstr || stabstr_end[-1] != 0) {
  100565:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100568:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  10056b:	76 0d                	jbe    10057a <debuginfo_eip+0x71>
  10056d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100570:	83 e8 01             	sub    $0x1,%eax
  100573:	0f b6 00             	movzbl (%eax),%eax
  100576:	84 c0                	test   %al,%al
  100578:	74 0a                	je     100584 <debuginfo_eip+0x7b>
        return -1;
  10057a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10057f:	e9 c0 02 00 00       	jmp    100844 <debuginfo_eip+0x33b>
    // 'eip'.  First, we find the basic source file containing 'eip'.
    // Then, we look in that source file for the function.  Then we look
    // for the line number.

    // Search the entire set of stabs for the source file (type N_SO).
    int lfile = 0, rfile = (stab_end - stabs) - 1;
  100584:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  10058b:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10058e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100591:	29 c2                	sub    %eax,%edx
  100593:	89 d0                	mov    %edx,%eax
  100595:	c1 f8 02             	sar    $0x2,%eax
  100598:	69 c0 ab aa aa aa    	imul   $0xaaaaaaab,%eax,%eax
  10059e:	83 e8 01             	sub    $0x1,%eax
  1005a1:	89 45 e0             	mov    %eax,-0x20(%ebp)
    stab_binsearch(stabs, &lfile, &rfile, N_SO, addr);
  1005a4:	8b 45 08             	mov    0x8(%ebp),%eax
  1005a7:	89 44 24 10          	mov    %eax,0x10(%esp)
  1005ab:	c7 44 24 0c 64 00 00 	movl   $0x64,0xc(%esp)
  1005b2:	00 
  1005b3:	8d 45 e0             	lea    -0x20(%ebp),%eax
  1005b6:	89 44 24 08          	mov    %eax,0x8(%esp)
  1005ba:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  1005bd:	89 44 24 04          	mov    %eax,0x4(%esp)
  1005c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1005c4:	89 04 24             	mov    %eax,(%esp)
  1005c7:	e8 e7 fd ff ff       	call   1003b3 <stab_binsearch>
    if (lfile == 0)
  1005cc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1005cf:	85 c0                	test   %eax,%eax
  1005d1:	75 0a                	jne    1005dd <debuginfo_eip+0xd4>
        return -1;
  1005d3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1005d8:	e9 67 02 00 00       	jmp    100844 <debuginfo_eip+0x33b>

    // Search within that file's stabs for the function definition
    // (N_FUN).
    int lfun = lfile, rfun = rfile;
  1005dd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1005e0:	89 45 dc             	mov    %eax,-0x24(%ebp)
  1005e3:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1005e6:	89 45 d8             	mov    %eax,-0x28(%ebp)
    int lline, rline;
    stab_binsearch(stabs, &lfun, &rfun, N_FUN, addr);
  1005e9:	8b 45 08             	mov    0x8(%ebp),%eax
  1005ec:	89 44 24 10          	mov    %eax,0x10(%esp)
  1005f0:	c7 44 24 0c 24 00 00 	movl   $0x24,0xc(%esp)
  1005f7:	00 
  1005f8:	8d 45 d8             	lea    -0x28(%ebp),%eax
  1005fb:	89 44 24 08          	mov    %eax,0x8(%esp)
  1005ff:	8d 45 dc             	lea    -0x24(%ebp),%eax
  100602:	89 44 24 04          	mov    %eax,0x4(%esp)
  100606:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100609:	89 04 24             	mov    %eax,(%esp)
  10060c:	e8 a2 fd ff ff       	call   1003b3 <stab_binsearch>

    if (lfun <= rfun) {
  100611:	8b 55 dc             	mov    -0x24(%ebp),%edx
  100614:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100617:	39 c2                	cmp    %eax,%edx
  100619:	7f 7c                	jg     100697 <debuginfo_eip+0x18e>
        // stabs[lfun] points to the function name
        // in the string table, but check bounds just in case.
        if (stabs[lfun].n_strx < stabstr_end - stabstr) {
  10061b:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10061e:	89 c2                	mov    %eax,%edx
  100620:	89 d0                	mov    %edx,%eax
  100622:	01 c0                	add    %eax,%eax
  100624:	01 d0                	add    %edx,%eax
  100626:	c1 e0 02             	shl    $0x2,%eax
  100629:	89 c2                	mov    %eax,%edx
  10062b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10062e:	01 d0                	add    %edx,%eax
  100630:	8b 10                	mov    (%eax),%edx
  100632:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  100635:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100638:	29 c1                	sub    %eax,%ecx
  10063a:	89 c8                	mov    %ecx,%eax
  10063c:	39 c2                	cmp    %eax,%edx
  10063e:	73 22                	jae    100662 <debuginfo_eip+0x159>
            info->eip_fn_name = stabstr + stabs[lfun].n_strx;
  100640:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100643:	89 c2                	mov    %eax,%edx
  100645:	89 d0                	mov    %edx,%eax
  100647:	01 c0                	add    %eax,%eax
  100649:	01 d0                	add    %edx,%eax
  10064b:	c1 e0 02             	shl    $0x2,%eax
  10064e:	89 c2                	mov    %eax,%edx
  100650:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100653:	01 d0                	add    %edx,%eax
  100655:	8b 10                	mov    (%eax),%edx
  100657:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10065a:	01 c2                	add    %eax,%edx
  10065c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10065f:	89 50 08             	mov    %edx,0x8(%eax)
        }
        info->eip_fn_addr = stabs[lfun].n_value;
  100662:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100665:	89 c2                	mov    %eax,%edx
  100667:	89 d0                	mov    %edx,%eax
  100669:	01 c0                	add    %eax,%eax
  10066b:	01 d0                	add    %edx,%eax
  10066d:	c1 e0 02             	shl    $0x2,%eax
  100670:	89 c2                	mov    %eax,%edx
  100672:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100675:	01 d0                	add    %edx,%eax
  100677:	8b 50 08             	mov    0x8(%eax),%edx
  10067a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10067d:	89 50 10             	mov    %edx,0x10(%eax)
        addr -= info->eip_fn_addr;
  100680:	8b 45 0c             	mov    0xc(%ebp),%eax
  100683:	8b 40 10             	mov    0x10(%eax),%eax
  100686:	29 45 08             	sub    %eax,0x8(%ebp)
        // Search within the function definition for the line number.
        lline = lfun;
  100689:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10068c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfun;
  10068f:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100692:	89 45 d0             	mov    %eax,-0x30(%ebp)
  100695:	eb 15                	jmp    1006ac <debuginfo_eip+0x1a3>
    } else {
        // Couldn't find function stab!  Maybe we're in an assembly
        // file.  Search the whole file for the line number.
        info->eip_fn_addr = addr;
  100697:	8b 45 0c             	mov    0xc(%ebp),%eax
  10069a:	8b 55 08             	mov    0x8(%ebp),%edx
  10069d:	89 50 10             	mov    %edx,0x10(%eax)
        lline = lfile;
  1006a0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1006a3:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfile;
  1006a6:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1006a9:	89 45 d0             	mov    %eax,-0x30(%ebp)
    }
    info->eip_fn_namelen = strfind(info->eip_fn_name, ':') - info->eip_fn_name;
  1006ac:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006af:	8b 40 08             	mov    0x8(%eax),%eax
  1006b2:	c7 44 24 04 3a 00 00 	movl   $0x3a,0x4(%esp)
  1006b9:	00 
  1006ba:	89 04 24             	mov    %eax,(%esp)
  1006bd:	e8 d7 28 00 00       	call   102f99 <strfind>
  1006c2:	89 c2                	mov    %eax,%edx
  1006c4:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006c7:	8b 40 08             	mov    0x8(%eax),%eax
  1006ca:	29 c2                	sub    %eax,%edx
  1006cc:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006cf:	89 50 0c             	mov    %edx,0xc(%eax)

    // Search within [lline, rline] for the line number stab.
    // If found, set info->eip_line to the right line number.
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
  1006d2:	8b 45 08             	mov    0x8(%ebp),%eax
  1006d5:	89 44 24 10          	mov    %eax,0x10(%esp)
  1006d9:	c7 44 24 0c 44 00 00 	movl   $0x44,0xc(%esp)
  1006e0:	00 
  1006e1:	8d 45 d0             	lea    -0x30(%ebp),%eax
  1006e4:	89 44 24 08          	mov    %eax,0x8(%esp)
  1006e8:	8d 45 d4             	lea    -0x2c(%ebp),%eax
  1006eb:	89 44 24 04          	mov    %eax,0x4(%esp)
  1006ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006f2:	89 04 24             	mov    %eax,(%esp)
  1006f5:	e8 b9 fc ff ff       	call   1003b3 <stab_binsearch>
    if (lline <= rline) {
  1006fa:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1006fd:	8b 45 d0             	mov    -0x30(%ebp),%eax
  100700:	39 c2                	cmp    %eax,%edx
  100702:	7f 24                	jg     100728 <debuginfo_eip+0x21f>
        info->eip_line = stabs[rline].n_desc;
  100704:	8b 45 d0             	mov    -0x30(%ebp),%eax
  100707:	89 c2                	mov    %eax,%edx
  100709:	89 d0                	mov    %edx,%eax
  10070b:	01 c0                	add    %eax,%eax
  10070d:	01 d0                	add    %edx,%eax
  10070f:	c1 e0 02             	shl    $0x2,%eax
  100712:	89 c2                	mov    %eax,%edx
  100714:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100717:	01 d0                	add    %edx,%eax
  100719:	0f b7 40 06          	movzwl 0x6(%eax),%eax
  10071d:	0f b7 d0             	movzwl %ax,%edx
  100720:	8b 45 0c             	mov    0xc(%ebp),%eax
  100723:	89 50 04             	mov    %edx,0x4(%eax)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  100726:	eb 13                	jmp    10073b <debuginfo_eip+0x232>
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
    if (lline <= rline) {
        info->eip_line = stabs[rline].n_desc;
    } else {
        return -1;
  100728:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10072d:	e9 12 01 00 00       	jmp    100844 <debuginfo_eip+0x33b>
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
           && stabs[lline].n_type != N_SOL
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
        lline --;
  100732:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100735:	83 e8 01             	sub    $0x1,%eax
  100738:	89 45 d4             	mov    %eax,-0x2c(%ebp)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  10073b:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10073e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100741:	39 c2                	cmp    %eax,%edx
  100743:	7c 56                	jl     10079b <debuginfo_eip+0x292>
           && stabs[lline].n_type != N_SOL
  100745:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100748:	89 c2                	mov    %eax,%edx
  10074a:	89 d0                	mov    %edx,%eax
  10074c:	01 c0                	add    %eax,%eax
  10074e:	01 d0                	add    %edx,%eax
  100750:	c1 e0 02             	shl    $0x2,%eax
  100753:	89 c2                	mov    %eax,%edx
  100755:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100758:	01 d0                	add    %edx,%eax
  10075a:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10075e:	3c 84                	cmp    $0x84,%al
  100760:	74 39                	je     10079b <debuginfo_eip+0x292>
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
  100762:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100765:	89 c2                	mov    %eax,%edx
  100767:	89 d0                	mov    %edx,%eax
  100769:	01 c0                	add    %eax,%eax
  10076b:	01 d0                	add    %edx,%eax
  10076d:	c1 e0 02             	shl    $0x2,%eax
  100770:	89 c2                	mov    %eax,%edx
  100772:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100775:	01 d0                	add    %edx,%eax
  100777:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10077b:	3c 64                	cmp    $0x64,%al
  10077d:	75 b3                	jne    100732 <debuginfo_eip+0x229>
  10077f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100782:	89 c2                	mov    %eax,%edx
  100784:	89 d0                	mov    %edx,%eax
  100786:	01 c0                	add    %eax,%eax
  100788:	01 d0                	add    %edx,%eax
  10078a:	c1 e0 02             	shl    $0x2,%eax
  10078d:	89 c2                	mov    %eax,%edx
  10078f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100792:	01 d0                	add    %edx,%eax
  100794:	8b 40 08             	mov    0x8(%eax),%eax
  100797:	85 c0                	test   %eax,%eax
  100799:	74 97                	je     100732 <debuginfo_eip+0x229>
        lline --;
    }
    if (lline >= lfile && stabs[lline].n_strx < stabstr_end - stabstr) {
  10079b:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10079e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1007a1:	39 c2                	cmp    %eax,%edx
  1007a3:	7c 46                	jl     1007eb <debuginfo_eip+0x2e2>
  1007a5:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007a8:	89 c2                	mov    %eax,%edx
  1007aa:	89 d0                	mov    %edx,%eax
  1007ac:	01 c0                	add    %eax,%eax
  1007ae:	01 d0                	add    %edx,%eax
  1007b0:	c1 e0 02             	shl    $0x2,%eax
  1007b3:	89 c2                	mov    %eax,%edx
  1007b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007b8:	01 d0                	add    %edx,%eax
  1007ba:	8b 10                	mov    (%eax),%edx
  1007bc:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  1007bf:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1007c2:	29 c1                	sub    %eax,%ecx
  1007c4:	89 c8                	mov    %ecx,%eax
  1007c6:	39 c2                	cmp    %eax,%edx
  1007c8:	73 21                	jae    1007eb <debuginfo_eip+0x2e2>
        info->eip_file = stabstr + stabs[lline].n_strx;
  1007ca:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007cd:	89 c2                	mov    %eax,%edx
  1007cf:	89 d0                	mov    %edx,%eax
  1007d1:	01 c0                	add    %eax,%eax
  1007d3:	01 d0                	add    %edx,%eax
  1007d5:	c1 e0 02             	shl    $0x2,%eax
  1007d8:	89 c2                	mov    %eax,%edx
  1007da:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007dd:	01 d0                	add    %edx,%eax
  1007df:	8b 10                	mov    (%eax),%edx
  1007e1:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1007e4:	01 c2                	add    %eax,%edx
  1007e6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007e9:	89 10                	mov    %edx,(%eax)
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
  1007eb:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1007ee:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1007f1:	39 c2                	cmp    %eax,%edx
  1007f3:	7d 4a                	jge    10083f <debuginfo_eip+0x336>
        for (lline = lfun + 1;
  1007f5:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1007f8:	83 c0 01             	add    $0x1,%eax
  1007fb:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  1007fe:	eb 18                	jmp    100818 <debuginfo_eip+0x30f>
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
            info->eip_fn_narg ++;
  100800:	8b 45 0c             	mov    0xc(%ebp),%eax
  100803:	8b 40 14             	mov    0x14(%eax),%eax
  100806:	8d 50 01             	lea    0x1(%eax),%edx
  100809:	8b 45 0c             	mov    0xc(%ebp),%eax
  10080c:	89 50 14             	mov    %edx,0x14(%eax)
    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
  10080f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100812:	83 c0 01             	add    $0x1,%eax
  100815:	89 45 d4             	mov    %eax,-0x2c(%ebp)

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
             lline < rfun && stabs[lline].n_type == N_PSYM;
  100818:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10081b:	8b 45 d8             	mov    -0x28(%ebp),%eax
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
  10081e:	39 c2                	cmp    %eax,%edx
  100820:	7d 1d                	jge    10083f <debuginfo_eip+0x336>
             lline < rfun && stabs[lline].n_type == N_PSYM;
  100822:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100825:	89 c2                	mov    %eax,%edx
  100827:	89 d0                	mov    %edx,%eax
  100829:	01 c0                	add    %eax,%eax
  10082b:	01 d0                	add    %edx,%eax
  10082d:	c1 e0 02             	shl    $0x2,%eax
  100830:	89 c2                	mov    %eax,%edx
  100832:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100835:	01 d0                	add    %edx,%eax
  100837:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10083b:	3c a0                	cmp    $0xa0,%al
  10083d:	74 c1                	je     100800 <debuginfo_eip+0x2f7>
             lline ++) {
            info->eip_fn_narg ++;
        }
    }
    return 0;
  10083f:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100844:	c9                   	leave  
  100845:	c3                   	ret    

00100846 <print_kerninfo>:
 * print_kerninfo - print the information about kernel, including the location
 * of kernel entry, the start addresses of data and text segements, the start
 * address of free memory and how many memory that kernel has used.
 * */
void
print_kerninfo(void) {
  100846:	55                   	push   %ebp
  100847:	89 e5                	mov    %esp,%ebp
  100849:	83 ec 18             	sub    $0x18,%esp
    extern char etext[], edata[], end[], kern_init[];
    cprintf("Special kernel symbols:\n");
  10084c:	c7 04 24 76 33 10 00 	movl   $0x103376,(%esp)
  100853:	e8 ba fa ff ff       	call   100312 <cprintf>
    cprintf("  entry  0x%08x (phys)\n", kern_init);
  100858:	c7 44 24 04 00 00 10 	movl   $0x100000,0x4(%esp)
  10085f:	00 
  100860:	c7 04 24 8f 33 10 00 	movl   $0x10338f,(%esp)
  100867:	e8 a6 fa ff ff       	call   100312 <cprintf>
    cprintf("  etext  0x%08x (phys)\n", etext);
  10086c:	c7 44 24 04 ae 32 10 	movl   $0x1032ae,0x4(%esp)
  100873:	00 
  100874:	c7 04 24 a7 33 10 00 	movl   $0x1033a7,(%esp)
  10087b:	e8 92 fa ff ff       	call   100312 <cprintf>
    cprintf("  edata  0x%08x (phys)\n", edata);
  100880:	c7 44 24 04 16 ea 10 	movl   $0x10ea16,0x4(%esp)
  100887:	00 
  100888:	c7 04 24 bf 33 10 00 	movl   $0x1033bf,(%esp)
  10088f:	e8 7e fa ff ff       	call   100312 <cprintf>
    cprintf("  end    0x%08x (phys)\n", end);
  100894:	c7 44 24 04 20 fd 10 	movl   $0x10fd20,0x4(%esp)
  10089b:	00 
  10089c:	c7 04 24 d7 33 10 00 	movl   $0x1033d7,(%esp)
  1008a3:	e8 6a fa ff ff       	call   100312 <cprintf>
    cprintf("Kernel executable memory footprint: %dKB\n", (end - kern_init + 1023)/1024);
  1008a8:	b8 20 fd 10 00       	mov    $0x10fd20,%eax
  1008ad:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  1008b3:	b8 00 00 10 00       	mov    $0x100000,%eax
  1008b8:	29 c2                	sub    %eax,%edx
  1008ba:	89 d0                	mov    %edx,%eax
  1008bc:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  1008c2:	85 c0                	test   %eax,%eax
  1008c4:	0f 48 c2             	cmovs  %edx,%eax
  1008c7:	c1 f8 0a             	sar    $0xa,%eax
  1008ca:	89 44 24 04          	mov    %eax,0x4(%esp)
  1008ce:	c7 04 24 f0 33 10 00 	movl   $0x1033f0,(%esp)
  1008d5:	e8 38 fa ff ff       	call   100312 <cprintf>
}
  1008da:	c9                   	leave  
  1008db:	c3                   	ret    

001008dc <print_debuginfo>:
/* *
 * print_debuginfo - read and print the stat information for the address @eip,
 * and info.eip_fn_addr should be the first address of the related function.
 * */
void
print_debuginfo(uintptr_t eip) {
  1008dc:	55                   	push   %ebp
  1008dd:	89 e5                	mov    %esp,%ebp
  1008df:	81 ec 48 01 00 00    	sub    $0x148,%esp
    struct eipdebuginfo info;
    if (debuginfo_eip(eip, &info) != 0) {
  1008e5:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1008e8:	89 44 24 04          	mov    %eax,0x4(%esp)
  1008ec:	8b 45 08             	mov    0x8(%ebp),%eax
  1008ef:	89 04 24             	mov    %eax,(%esp)
  1008f2:	e8 12 fc ff ff       	call   100509 <debuginfo_eip>
  1008f7:	85 c0                	test   %eax,%eax
  1008f9:	74 15                	je     100910 <print_debuginfo+0x34>
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
  1008fb:	8b 45 08             	mov    0x8(%ebp),%eax
  1008fe:	89 44 24 04          	mov    %eax,0x4(%esp)
  100902:	c7 04 24 1a 34 10 00 	movl   $0x10341a,(%esp)
  100909:	e8 04 fa ff ff       	call   100312 <cprintf>
  10090e:	eb 6d                	jmp    10097d <print_debuginfo+0xa1>
    }
    else {
        char fnname[256];
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  100910:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100917:	eb 1c                	jmp    100935 <print_debuginfo+0x59>
            fnname[j] = info.eip_fn_name[j];
  100919:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  10091c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10091f:	01 d0                	add    %edx,%eax
  100921:	0f b6 00             	movzbl (%eax),%eax
  100924:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  10092a:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10092d:	01 ca                	add    %ecx,%edx
  10092f:	88 02                	mov    %al,(%edx)
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
    }
    else {
        char fnname[256];
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  100931:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100935:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100938:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  10093b:	7f dc                	jg     100919 <print_debuginfo+0x3d>
            fnname[j] = info.eip_fn_name[j];
        }
        fnname[j] = '\0';
  10093d:	8d 95 dc fe ff ff    	lea    -0x124(%ebp),%edx
  100943:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100946:	01 d0                	add    %edx,%eax
  100948:	c6 00 00             	movb   $0x0,(%eax)
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
                fnname, eip - info.eip_fn_addr);
  10094b:	8b 45 ec             	mov    -0x14(%ebp),%eax
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
            fnname[j] = info.eip_fn_name[j];
        }
        fnname[j] = '\0';
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
  10094e:	8b 55 08             	mov    0x8(%ebp),%edx
  100951:	89 d1                	mov    %edx,%ecx
  100953:	29 c1                	sub    %eax,%ecx
  100955:	8b 55 e0             	mov    -0x20(%ebp),%edx
  100958:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10095b:	89 4c 24 10          	mov    %ecx,0x10(%esp)
  10095f:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  100965:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  100969:	89 54 24 08          	mov    %edx,0x8(%esp)
  10096d:	89 44 24 04          	mov    %eax,0x4(%esp)
  100971:	c7 04 24 36 34 10 00 	movl   $0x103436,(%esp)
  100978:	e8 95 f9 ff ff       	call   100312 <cprintf>
                fnname, eip - info.eip_fn_addr);
    }
}
  10097d:	c9                   	leave  
  10097e:	c3                   	ret    

0010097f <read_eip>:

static __noinline uint32_t
read_eip(void) {
  10097f:	55                   	push   %ebp
  100980:	89 e5                	mov    %esp,%ebp
  100982:	83 ec 10             	sub    $0x10,%esp
    uint32_t eip;
    asm volatile("movl 4(%%ebp), %0" : "=r" (eip));
  100985:	8b 45 04             	mov    0x4(%ebp),%eax
  100988:	89 45 fc             	mov    %eax,-0x4(%ebp)
    return eip;
  10098b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  10098e:	c9                   	leave  
  10098f:	c3                   	ret    

00100990 <print_stackframe>:
 *
 * Note that, the length of ebp-chain is limited. In boot/bootasm.S, before jumping
 * to the kernel entry, the value of ebp has been set to zero, that's the boundary.
 * */
void
print_stackframe(void) {
  100990:	55                   	push   %ebp
  100991:	89 e5                	mov    %esp,%ebp
  100993:	83 ec 38             	sub    $0x38,%esp
}

static inline uint32_t
read_ebp(void) {
    uint32_t ebp;
    asm volatile ("movl %%ebp, %0" : "=r" (ebp));
  100996:	89 e8                	mov    %ebp,%eax
  100998:	89 45 e0             	mov    %eax,-0x20(%ebp)
    return ebp;
  10099b:	8b 45 e0             	mov    -0x20(%ebp),%eax
      *    (3.4) call print_debuginfo(eip-1) to print the C calling function name and line number, etc.
      *    (3.5) popup a calling stackframe
      *           NOTICE: the calling funciton's return addr eip  = ss:[ebp+4]
      *                   the calling funciton's ebp = ss:[ebp]
      */
    uint32_t ebp = read_ebp() , eip = read_eip();
  10099e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1009a1:	e8 d9 ff ff ff       	call   10097f <read_eip>
  1009a6:	89 45 f0             	mov    %eax,-0x10(%ebp)
    int i,j;
    for( i = 0 ; i < STACKFRAME_DEPTH ; i++ ){
  1009a9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  1009b0:	eb 7c                	jmp    100a2e <print_stackframe+0x9e>
        cprintf("ebp = %08x , eip = %08x args =",ebp,eip);
  1009b2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1009b5:	89 44 24 08          	mov    %eax,0x8(%esp)
  1009b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009bc:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009c0:	c7 04 24 48 34 10 00 	movl   $0x103448,(%esp)
  1009c7:	e8 46 f9 ff ff       	call   100312 <cprintf>
        uint32_t *arguments = ( uint32_t *) ebp + 2;
  1009cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009cf:	83 c0 08             	add    $0x8,%eax
  1009d2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        for( j = 0 ; j < 4 ; j++){
  1009d5:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  1009dc:	eb 25                	jmp    100a03 <print_stackframe+0x73>
            cprintf("0x%08x ",arguments[j] );
  1009de:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1009e1:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  1009e8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1009eb:	01 d0                	add    %edx,%eax
  1009ed:	8b 00                	mov    (%eax),%eax
  1009ef:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009f3:	c7 04 24 67 34 10 00 	movl   $0x103467,(%esp)
  1009fa:	e8 13 f9 ff ff       	call   100312 <cprintf>
    uint32_t ebp = read_ebp() , eip = read_eip();
    int i,j;
    for( i = 0 ; i < STACKFRAME_DEPTH ; i++ ){
        cprintf("ebp = %08x , eip = %08x args =",ebp,eip);
        uint32_t *arguments = ( uint32_t *) ebp + 2;
        for( j = 0 ; j < 4 ; j++){
  1009ff:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
  100a03:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
  100a07:	7e d5                	jle    1009de <print_stackframe+0x4e>
            cprintf("0x%08x ",arguments[j] );
        }
        print_debuginfo(eip-1);
  100a09:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100a0c:	83 e8 01             	sub    $0x1,%eax
  100a0f:	89 04 24             	mov    %eax,(%esp)
  100a12:	e8 c5 fe ff ff       	call   1008dc <print_debuginfo>
        eip = ( (uint32_t *) ebp )[1];
  100a17:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a1a:	83 c0 04             	add    $0x4,%eax
  100a1d:	8b 00                	mov    (%eax),%eax
  100a1f:	89 45 f0             	mov    %eax,-0x10(%ebp)
        ebp = ( (uint32_t *) ebp )[0];
  100a22:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a25:	8b 00                	mov    (%eax),%eax
  100a27:	89 45 f4             	mov    %eax,-0xc(%ebp)
      *           NOTICE: the calling funciton's return addr eip  = ss:[ebp+4]
      *                   the calling funciton's ebp = ss:[ebp]
      */
    uint32_t ebp = read_ebp() , eip = read_eip();
    int i,j;
    for( i = 0 ; i < STACKFRAME_DEPTH ; i++ ){
  100a2a:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  100a2e:	83 7d ec 13          	cmpl   $0x13,-0x14(%ebp)
  100a32:	0f 8e 7a ff ff ff    	jle    1009b2 <print_stackframe+0x22>
        print_debuginfo(eip-1);
        eip = ( (uint32_t *) ebp )[1];
        ebp = ( (uint32_t *) ebp )[0];
    }

}
  100a38:	c9                   	leave  
  100a39:	c3                   	ret    

00100a3a <parse>:
#define MAXARGS         16
#define WHITESPACE      " \t\n\r"

/* parse - parse the command buffer into whitespace-separated arguments */
static int
parse(char *buf, char **argv) {
  100a3a:	55                   	push   %ebp
  100a3b:	89 e5                	mov    %esp,%ebp
  100a3d:	83 ec 28             	sub    $0x28,%esp
    int argc = 0;
  100a40:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100a47:	eb 0c                	jmp    100a55 <parse+0x1b>
            *buf ++ = '\0';
  100a49:	8b 45 08             	mov    0x8(%ebp),%eax
  100a4c:	8d 50 01             	lea    0x1(%eax),%edx
  100a4f:	89 55 08             	mov    %edx,0x8(%ebp)
  100a52:	c6 00 00             	movb   $0x0,(%eax)
static int
parse(char *buf, char **argv) {
    int argc = 0;
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100a55:	8b 45 08             	mov    0x8(%ebp),%eax
  100a58:	0f b6 00             	movzbl (%eax),%eax
  100a5b:	84 c0                	test   %al,%al
  100a5d:	74 1d                	je     100a7c <parse+0x42>
  100a5f:	8b 45 08             	mov    0x8(%ebp),%eax
  100a62:	0f b6 00             	movzbl (%eax),%eax
  100a65:	0f be c0             	movsbl %al,%eax
  100a68:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a6c:	c7 04 24 f0 34 10 00 	movl   $0x1034f0,(%esp)
  100a73:	e8 ee 24 00 00       	call   102f66 <strchr>
  100a78:	85 c0                	test   %eax,%eax
  100a7a:	75 cd                	jne    100a49 <parse+0xf>
            *buf ++ = '\0';
        }
        if (*buf == '\0') {
  100a7c:	8b 45 08             	mov    0x8(%ebp),%eax
  100a7f:	0f b6 00             	movzbl (%eax),%eax
  100a82:	84 c0                	test   %al,%al
  100a84:	75 02                	jne    100a88 <parse+0x4e>
            break;
  100a86:	eb 67                	jmp    100aef <parse+0xb5>
        }

        // save and scan past next arg
        if (argc == MAXARGS - 1) {
  100a88:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
  100a8c:	75 14                	jne    100aa2 <parse+0x68>
            cprintf("Too many arguments (max %d).\n", MAXARGS);
  100a8e:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
  100a95:	00 
  100a96:	c7 04 24 f5 34 10 00 	movl   $0x1034f5,(%esp)
  100a9d:	e8 70 f8 ff ff       	call   100312 <cprintf>
        }
        argv[argc ++] = buf;
  100aa2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100aa5:	8d 50 01             	lea    0x1(%eax),%edx
  100aa8:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100aab:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100ab2:	8b 45 0c             	mov    0xc(%ebp),%eax
  100ab5:	01 c2                	add    %eax,%edx
  100ab7:	8b 45 08             	mov    0x8(%ebp),%eax
  100aba:	89 02                	mov    %eax,(%edx)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100abc:	eb 04                	jmp    100ac2 <parse+0x88>
            buf ++;
  100abe:	83 45 08 01          	addl   $0x1,0x8(%ebp)
        // save and scan past next arg
        if (argc == MAXARGS - 1) {
            cprintf("Too many arguments (max %d).\n", MAXARGS);
        }
        argv[argc ++] = buf;
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100ac2:	8b 45 08             	mov    0x8(%ebp),%eax
  100ac5:	0f b6 00             	movzbl (%eax),%eax
  100ac8:	84 c0                	test   %al,%al
  100aca:	74 1d                	je     100ae9 <parse+0xaf>
  100acc:	8b 45 08             	mov    0x8(%ebp),%eax
  100acf:	0f b6 00             	movzbl (%eax),%eax
  100ad2:	0f be c0             	movsbl %al,%eax
  100ad5:	89 44 24 04          	mov    %eax,0x4(%esp)
  100ad9:	c7 04 24 f0 34 10 00 	movl   $0x1034f0,(%esp)
  100ae0:	e8 81 24 00 00       	call   102f66 <strchr>
  100ae5:	85 c0                	test   %eax,%eax
  100ae7:	74 d5                	je     100abe <parse+0x84>
            buf ++;
        }
    }
  100ae9:	90                   	nop
static int
parse(char *buf, char **argv) {
    int argc = 0;
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100aea:	e9 66 ff ff ff       	jmp    100a55 <parse+0x1b>
        argv[argc ++] = buf;
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
            buf ++;
        }
    }
    return argc;
  100aef:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100af2:	c9                   	leave  
  100af3:	c3                   	ret    

00100af4 <runcmd>:
/* *
 * runcmd - parse the input string, split it into separated arguments
 * and then lookup and invoke some related commands/
 * */
static int
runcmd(char *buf, struct trapframe *tf) {
  100af4:	55                   	push   %ebp
  100af5:	89 e5                	mov    %esp,%ebp
  100af7:	83 ec 68             	sub    $0x68,%esp
    char *argv[MAXARGS];
    int argc = parse(buf, argv);
  100afa:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100afd:	89 44 24 04          	mov    %eax,0x4(%esp)
  100b01:	8b 45 08             	mov    0x8(%ebp),%eax
  100b04:	89 04 24             	mov    %eax,(%esp)
  100b07:	e8 2e ff ff ff       	call   100a3a <parse>
  100b0c:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if (argc == 0) {
  100b0f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100b13:	75 0a                	jne    100b1f <runcmd+0x2b>
        return 0;
  100b15:	b8 00 00 00 00       	mov    $0x0,%eax
  100b1a:	e9 85 00 00 00       	jmp    100ba4 <runcmd+0xb0>
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100b1f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100b26:	eb 5c                	jmp    100b84 <runcmd+0x90>
        if (strcmp(commands[i].name, argv[0]) == 0) {
  100b28:	8b 4d b0             	mov    -0x50(%ebp),%ecx
  100b2b:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100b2e:	89 d0                	mov    %edx,%eax
  100b30:	01 c0                	add    %eax,%eax
  100b32:	01 d0                	add    %edx,%eax
  100b34:	c1 e0 02             	shl    $0x2,%eax
  100b37:	05 00 e0 10 00       	add    $0x10e000,%eax
  100b3c:	8b 00                	mov    (%eax),%eax
  100b3e:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  100b42:	89 04 24             	mov    %eax,(%esp)
  100b45:	e8 7d 23 00 00       	call   102ec7 <strcmp>
  100b4a:	85 c0                	test   %eax,%eax
  100b4c:	75 32                	jne    100b80 <runcmd+0x8c>
            return commands[i].func(argc - 1, argv + 1, tf);
  100b4e:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100b51:	89 d0                	mov    %edx,%eax
  100b53:	01 c0                	add    %eax,%eax
  100b55:	01 d0                	add    %edx,%eax
  100b57:	c1 e0 02             	shl    $0x2,%eax
  100b5a:	05 00 e0 10 00       	add    $0x10e000,%eax
  100b5f:	8b 40 08             	mov    0x8(%eax),%eax
  100b62:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100b65:	8d 4a ff             	lea    -0x1(%edx),%ecx
  100b68:	8b 55 0c             	mov    0xc(%ebp),%edx
  100b6b:	89 54 24 08          	mov    %edx,0x8(%esp)
  100b6f:	8d 55 b0             	lea    -0x50(%ebp),%edx
  100b72:	83 c2 04             	add    $0x4,%edx
  100b75:	89 54 24 04          	mov    %edx,0x4(%esp)
  100b79:	89 0c 24             	mov    %ecx,(%esp)
  100b7c:	ff d0                	call   *%eax
  100b7e:	eb 24                	jmp    100ba4 <runcmd+0xb0>
    int argc = parse(buf, argv);
    if (argc == 0) {
        return 0;
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100b80:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100b84:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b87:	83 f8 02             	cmp    $0x2,%eax
  100b8a:	76 9c                	jbe    100b28 <runcmd+0x34>
        if (strcmp(commands[i].name, argv[0]) == 0) {
            return commands[i].func(argc - 1, argv + 1, tf);
        }
    }
    cprintf("Unknown command '%s'\n", argv[0]);
  100b8c:	8b 45 b0             	mov    -0x50(%ebp),%eax
  100b8f:	89 44 24 04          	mov    %eax,0x4(%esp)
  100b93:	c7 04 24 13 35 10 00 	movl   $0x103513,(%esp)
  100b9a:	e8 73 f7 ff ff       	call   100312 <cprintf>
    return 0;
  100b9f:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100ba4:	c9                   	leave  
  100ba5:	c3                   	ret    

00100ba6 <kmonitor>:

/***** Implementations of basic kernel monitor commands *****/

void
kmonitor(struct trapframe *tf) {
  100ba6:	55                   	push   %ebp
  100ba7:	89 e5                	mov    %esp,%ebp
  100ba9:	83 ec 28             	sub    $0x28,%esp
    cprintf("Welcome to the kernel debug monitor!!\n");
  100bac:	c7 04 24 2c 35 10 00 	movl   $0x10352c,(%esp)
  100bb3:	e8 5a f7 ff ff       	call   100312 <cprintf>
    cprintf("Type 'help' for a list of commands.\n");
  100bb8:	c7 04 24 54 35 10 00 	movl   $0x103554,(%esp)
  100bbf:	e8 4e f7 ff ff       	call   100312 <cprintf>

    if (tf != NULL) {
  100bc4:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100bc8:	74 0b                	je     100bd5 <kmonitor+0x2f>
        print_trapframe(tf);
  100bca:	8b 45 08             	mov    0x8(%ebp),%eax
  100bcd:	89 04 24             	mov    %eax,(%esp)
  100bd0:	e8 61 0c 00 00       	call   101836 <print_trapframe>
    }

    char *buf;
    while (1) {
        if ((buf = readline("K> ")) != NULL) {
  100bd5:	c7 04 24 79 35 10 00 	movl   $0x103579,(%esp)
  100bdc:	e8 28 f6 ff ff       	call   100209 <readline>
  100be1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100be4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100be8:	74 18                	je     100c02 <kmonitor+0x5c>
            if (runcmd(buf, tf) < 0) {
  100bea:	8b 45 08             	mov    0x8(%ebp),%eax
  100bed:	89 44 24 04          	mov    %eax,0x4(%esp)
  100bf1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100bf4:	89 04 24             	mov    %eax,(%esp)
  100bf7:	e8 f8 fe ff ff       	call   100af4 <runcmd>
  100bfc:	85 c0                	test   %eax,%eax
  100bfe:	79 02                	jns    100c02 <kmonitor+0x5c>
                break;
  100c00:	eb 02                	jmp    100c04 <kmonitor+0x5e>
            }
        }
    }
  100c02:	eb d1                	jmp    100bd5 <kmonitor+0x2f>
}
  100c04:	c9                   	leave  
  100c05:	c3                   	ret    

00100c06 <mon_help>:

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
  100c06:	55                   	push   %ebp
  100c07:	89 e5                	mov    %esp,%ebp
  100c09:	83 ec 28             	sub    $0x28,%esp
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100c0c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100c13:	eb 3f                	jmp    100c54 <mon_help+0x4e>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
  100c15:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c18:	89 d0                	mov    %edx,%eax
  100c1a:	01 c0                	add    %eax,%eax
  100c1c:	01 d0                	add    %edx,%eax
  100c1e:	c1 e0 02             	shl    $0x2,%eax
  100c21:	05 00 e0 10 00       	add    $0x10e000,%eax
  100c26:	8b 48 04             	mov    0x4(%eax),%ecx
  100c29:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c2c:	89 d0                	mov    %edx,%eax
  100c2e:	01 c0                	add    %eax,%eax
  100c30:	01 d0                	add    %edx,%eax
  100c32:	c1 e0 02             	shl    $0x2,%eax
  100c35:	05 00 e0 10 00       	add    $0x10e000,%eax
  100c3a:	8b 00                	mov    (%eax),%eax
  100c3c:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  100c40:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c44:	c7 04 24 7d 35 10 00 	movl   $0x10357d,(%esp)
  100c4b:	e8 c2 f6 ff ff       	call   100312 <cprintf>

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100c50:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100c54:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c57:	83 f8 02             	cmp    $0x2,%eax
  100c5a:	76 b9                	jbe    100c15 <mon_help+0xf>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
    }
    return 0;
  100c5c:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c61:	c9                   	leave  
  100c62:	c3                   	ret    

00100c63 <mon_kerninfo>:
/* *
 * mon_kerninfo - call print_kerninfo in kern/debug/kdebug.c to
 * print the memory occupancy in kernel.
 * */
int
mon_kerninfo(int argc, char **argv, struct trapframe *tf) {
  100c63:	55                   	push   %ebp
  100c64:	89 e5                	mov    %esp,%ebp
  100c66:	83 ec 08             	sub    $0x8,%esp
    print_kerninfo();
  100c69:	e8 d8 fb ff ff       	call   100846 <print_kerninfo>
    return 0;
  100c6e:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c73:	c9                   	leave  
  100c74:	c3                   	ret    

00100c75 <mon_backtrace>:
/* *
 * mon_backtrace - call print_stackframe in kern/debug/kdebug.c to
 * print a backtrace of the stack.
 * */
int
mon_backtrace(int argc, char **argv, struct trapframe *tf) {
  100c75:	55                   	push   %ebp
  100c76:	89 e5                	mov    %esp,%ebp
  100c78:	83 ec 08             	sub    $0x8,%esp
    print_stackframe();
  100c7b:	e8 10 fd ff ff       	call   100990 <print_stackframe>
    return 0;
  100c80:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c85:	c9                   	leave  
  100c86:	c3                   	ret    

00100c87 <__panic>:
/* *
 * __panic - __panic is called on unresolvable fatal errors. it prints
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
  100c87:	55                   	push   %ebp
  100c88:	89 e5                	mov    %esp,%ebp
  100c8a:	83 ec 28             	sub    $0x28,%esp
    if (is_panic) {
  100c8d:	a1 40 ee 10 00       	mov    0x10ee40,%eax
  100c92:	85 c0                	test   %eax,%eax
  100c94:	74 02                	je     100c98 <__panic+0x11>
        goto panic_dead;
  100c96:	eb 48                	jmp    100ce0 <__panic+0x59>
    }
    is_panic = 1;
  100c98:	c7 05 40 ee 10 00 01 	movl   $0x1,0x10ee40
  100c9f:	00 00 00 

    // print the 'message'
    va_list ap;
    va_start(ap, fmt);
  100ca2:	8d 45 14             	lea    0x14(%ebp),%eax
  100ca5:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel panic at %s:%d:\n    ", file, line);
  100ca8:	8b 45 0c             	mov    0xc(%ebp),%eax
  100cab:	89 44 24 08          	mov    %eax,0x8(%esp)
  100caf:	8b 45 08             	mov    0x8(%ebp),%eax
  100cb2:	89 44 24 04          	mov    %eax,0x4(%esp)
  100cb6:	c7 04 24 86 35 10 00 	movl   $0x103586,(%esp)
  100cbd:	e8 50 f6 ff ff       	call   100312 <cprintf>
    vcprintf(fmt, ap);
  100cc2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100cc5:	89 44 24 04          	mov    %eax,0x4(%esp)
  100cc9:	8b 45 10             	mov    0x10(%ebp),%eax
  100ccc:	89 04 24             	mov    %eax,(%esp)
  100ccf:	e8 0b f6 ff ff       	call   1002df <vcprintf>
    cprintf("\n");
  100cd4:	c7 04 24 a2 35 10 00 	movl   $0x1035a2,(%esp)
  100cdb:	e8 32 f6 ff ff       	call   100312 <cprintf>
    va_end(ap);

panic_dead:
    intr_disable();
  100ce0:	e8 22 09 00 00       	call   101607 <intr_disable>
    while (1) {
        kmonitor(NULL);
  100ce5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100cec:	e8 b5 fe ff ff       	call   100ba6 <kmonitor>
    }
  100cf1:	eb f2                	jmp    100ce5 <__panic+0x5e>

00100cf3 <__warn>:
}

/* __warn - like panic, but don't */
void
__warn(const char *file, int line, const char *fmt, ...) {
  100cf3:	55                   	push   %ebp
  100cf4:	89 e5                	mov    %esp,%ebp
  100cf6:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    va_start(ap, fmt);
  100cf9:	8d 45 14             	lea    0x14(%ebp),%eax
  100cfc:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel warning at %s:%d:\n    ", file, line);
  100cff:	8b 45 0c             	mov    0xc(%ebp),%eax
  100d02:	89 44 24 08          	mov    %eax,0x8(%esp)
  100d06:	8b 45 08             	mov    0x8(%ebp),%eax
  100d09:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d0d:	c7 04 24 a4 35 10 00 	movl   $0x1035a4,(%esp)
  100d14:	e8 f9 f5 ff ff       	call   100312 <cprintf>
    vcprintf(fmt, ap);
  100d19:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d1c:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d20:	8b 45 10             	mov    0x10(%ebp),%eax
  100d23:	89 04 24             	mov    %eax,(%esp)
  100d26:	e8 b4 f5 ff ff       	call   1002df <vcprintf>
    cprintf("\n");
  100d2b:	c7 04 24 a2 35 10 00 	movl   $0x1035a2,(%esp)
  100d32:	e8 db f5 ff ff       	call   100312 <cprintf>
    va_end(ap);
}
  100d37:	c9                   	leave  
  100d38:	c3                   	ret    

00100d39 <is_kernel_panic>:

bool
is_kernel_panic(void) {
  100d39:	55                   	push   %ebp
  100d3a:	89 e5                	mov    %esp,%ebp
    return is_panic;
  100d3c:	a1 40 ee 10 00       	mov    0x10ee40,%eax
}
  100d41:	5d                   	pop    %ebp
  100d42:	c3                   	ret    

00100d43 <clock_init>:
/* *
 * clock_init - initialize 8253 clock to interrupt 100 times per second,
 * and then enable IRQ_TIMER.
 * */
void
clock_init(void) {
  100d43:	55                   	push   %ebp
  100d44:	89 e5                	mov    %esp,%ebp
  100d46:	83 ec 28             	sub    $0x28,%esp
  100d49:	66 c7 45 f6 43 00    	movw   $0x43,-0xa(%ebp)
  100d4f:	c6 45 f5 34          	movb   $0x34,-0xb(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100d53:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100d57:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100d5b:	ee                   	out    %al,(%dx)
  100d5c:	66 c7 45 f2 40 00    	movw   $0x40,-0xe(%ebp)
  100d62:	c6 45 f1 9c          	movb   $0x9c,-0xf(%ebp)
  100d66:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100d6a:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100d6e:	ee                   	out    %al,(%dx)
  100d6f:	66 c7 45 ee 40 00    	movw   $0x40,-0x12(%ebp)
  100d75:	c6 45 ed 2e          	movb   $0x2e,-0x13(%ebp)
  100d79:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100d7d:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100d81:	ee                   	out    %al,(%dx)
    outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
    outb(IO_TIMER1, TIMER_DIV(100) % 256);
    outb(IO_TIMER1, TIMER_DIV(100) / 256);

    // initialize time counter 'ticks' to zero
    ticks = 0;
  100d82:	c7 05 08 f9 10 00 00 	movl   $0x0,0x10f908
  100d89:	00 00 00 

    cprintf("++ setup timer interrupts\n");
  100d8c:	c7 04 24 c2 35 10 00 	movl   $0x1035c2,(%esp)
  100d93:	e8 7a f5 ff ff       	call   100312 <cprintf>
    pic_enable(IRQ_TIMER);
  100d98:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100d9f:	e8 c1 08 00 00       	call   101665 <pic_enable>
}
  100da4:	c9                   	leave  
  100da5:	c3                   	ret    

00100da6 <delay>:
#include <picirq.h>
#include <trap.h>

/* stupid I/O delay routine necessitated by historical PC design flaws */
static void
delay(void) {
  100da6:	55                   	push   %ebp
  100da7:	89 e5                	mov    %esp,%ebp
  100da9:	83 ec 10             	sub    $0x10,%esp
  100dac:	66 c7 45 fe 84 00    	movw   $0x84,-0x2(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100db2:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  100db6:	89 c2                	mov    %eax,%edx
  100db8:	ec                   	in     (%dx),%al
  100db9:	88 45 fd             	mov    %al,-0x3(%ebp)
  100dbc:	66 c7 45 fa 84 00    	movw   $0x84,-0x6(%ebp)
  100dc2:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100dc6:	89 c2                	mov    %eax,%edx
  100dc8:	ec                   	in     (%dx),%al
  100dc9:	88 45 f9             	mov    %al,-0x7(%ebp)
  100dcc:	66 c7 45 f6 84 00    	movw   $0x84,-0xa(%ebp)
  100dd2:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100dd6:	89 c2                	mov    %eax,%edx
  100dd8:	ec                   	in     (%dx),%al
  100dd9:	88 45 f5             	mov    %al,-0xb(%ebp)
  100ddc:	66 c7 45 f2 84 00    	movw   $0x84,-0xe(%ebp)
  100de2:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100de6:	89 c2                	mov    %eax,%edx
  100de8:	ec                   	in     (%dx),%al
  100de9:	88 45 f1             	mov    %al,-0xf(%ebp)
    inb(0x84);
    inb(0x84);
    inb(0x84);
    inb(0x84);
}
  100dec:	c9                   	leave  
  100ded:	c3                   	ret    

00100dee <cga_init>:
//    -- 数据寄存器 映射 到 端口 0x3D5或0x3B5 
//    -- 索引寄存器 0x3D4或0x3B4,决定在数据寄存器中的数据表示什么。

/* TEXT-mode CGA/VGA display output */
static void
cga_init(void) {
  100dee:	55                   	push   %ebp
  100def:	89 e5                	mov    %esp,%ebp
  100df1:	83 ec 20             	sub    $0x20,%esp
    volatile uint16_t *cp = (uint16_t *)CGA_BUF;   //CGA_BUF: 0xB8000 (彩色显示的显存物理基址)
  100df4:	c7 45 fc 00 80 0b 00 	movl   $0xb8000,-0x4(%ebp)
    uint16_t was = *cp;                                            //保存当前显存0xB8000处的值
  100dfb:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100dfe:	0f b7 00             	movzwl (%eax),%eax
  100e01:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
    *cp = (uint16_t) 0xA55A;                                   // 给这个地址随便写个值，看看能否再读出同样的值
  100e05:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e08:	66 c7 00 5a a5       	movw   $0xa55a,(%eax)
    if (*cp != 0xA55A) {                                            // 如果读不出来，说明没有这块显存，即是单显配置
  100e0d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e10:	0f b7 00             	movzwl (%eax),%eax
  100e13:	66 3d 5a a5          	cmp    $0xa55a,%ax
  100e17:	74 12                	je     100e2b <cga_init+0x3d>
        cp = (uint16_t*)MONO_BUF;                         //设置为单显的显存基址 MONO_BUF： 0xB0000
  100e19:	c7 45 fc 00 00 0b 00 	movl   $0xb0000,-0x4(%ebp)
        addr_6845 = MONO_BASE;                           //设置为单显控制的IO地址，MONO_BASE: 0x3B4
  100e20:	66 c7 05 66 ee 10 00 	movw   $0x3b4,0x10ee66
  100e27:	b4 03 
  100e29:	eb 13                	jmp    100e3e <cga_init+0x50>
    } else {                                                                // 如果读出来了，有这块显存，即是彩显配置
        *cp = was;                                                      //还原原来显存位置的值
  100e2b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e2e:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  100e32:	66 89 10             	mov    %dx,(%eax)
        addr_6845 = CGA_BASE;                               // 设置为彩显控制的IO地址，CGA_BASE: 0x3D4 
  100e35:	66 c7 05 66 ee 10 00 	movw   $0x3d4,0x10ee66
  100e3c:	d4 03 
    // Extract cursor location
    // 6845索引寄存器的index 0x0E（及十进制的14）== 光标位置(高位)
    // 6845索引寄存器的index 0x0F（及十进制的15）== 光标位置(低位)
    // 6845 reg 15 : Cursor Address (Low Byte)
    uint32_t pos;
    outb(addr_6845, 14);                                        
  100e3e:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e45:	0f b7 c0             	movzwl %ax,%eax
  100e48:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
  100e4c:	c6 45 f1 0e          	movb   $0xe,-0xf(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100e50:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100e54:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100e58:	ee                   	out    %al,(%dx)
    pos = inb(addr_6845 + 1) << 8;                       //读出了光标位置(高位)
  100e59:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e60:	83 c0 01             	add    $0x1,%eax
  100e63:	0f b7 c0             	movzwl %ax,%eax
  100e66:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100e6a:	0f b7 45 ee          	movzwl -0x12(%ebp),%eax
  100e6e:	89 c2                	mov    %eax,%edx
  100e70:	ec                   	in     (%dx),%al
  100e71:	88 45 ed             	mov    %al,-0x13(%ebp)
    return data;
  100e74:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100e78:	0f b6 c0             	movzbl %al,%eax
  100e7b:	c1 e0 08             	shl    $0x8,%eax
  100e7e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    outb(addr_6845, 15);
  100e81:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e88:	0f b7 c0             	movzwl %ax,%eax
  100e8b:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
  100e8f:	c6 45 e9 0f          	movb   $0xf,-0x17(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100e93:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100e97:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100e9b:	ee                   	out    %al,(%dx)
    pos |= inb(addr_6845 + 1);                             //读出了光标位置(低位)
  100e9c:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100ea3:	83 c0 01             	add    $0x1,%eax
  100ea6:	0f b7 c0             	movzwl %ax,%eax
  100ea9:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100ead:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
  100eb1:	89 c2                	mov    %eax,%edx
  100eb3:	ec                   	in     (%dx),%al
  100eb4:	88 45 e5             	mov    %al,-0x1b(%ebp)
    return data;
  100eb7:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100ebb:	0f b6 c0             	movzbl %al,%eax
  100ebe:	09 45 f4             	or     %eax,-0xc(%ebp)

    crt_buf = (uint16_t*) cp;                                  //crt_buf是CGA显存起始地址
  100ec1:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100ec4:	a3 60 ee 10 00       	mov    %eax,0x10ee60
    crt_pos = pos;                                                  //crt_pos是CGA当前光标位置
  100ec9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ecc:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
}
  100ed2:	c9                   	leave  
  100ed3:	c3                   	ret    

00100ed4 <serial_init>:

static bool serial_exists = 0;

static void
serial_init(void) {
  100ed4:	55                   	push   %ebp
  100ed5:	89 e5                	mov    %esp,%ebp
  100ed7:	83 ec 48             	sub    $0x48,%esp
  100eda:	66 c7 45 f6 fa 03    	movw   $0x3fa,-0xa(%ebp)
  100ee0:	c6 45 f5 00          	movb   $0x0,-0xb(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100ee4:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100ee8:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100eec:	ee                   	out    %al,(%dx)
  100eed:	66 c7 45 f2 fb 03    	movw   $0x3fb,-0xe(%ebp)
  100ef3:	c6 45 f1 80          	movb   $0x80,-0xf(%ebp)
  100ef7:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100efb:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100eff:	ee                   	out    %al,(%dx)
  100f00:	66 c7 45 ee f8 03    	movw   $0x3f8,-0x12(%ebp)
  100f06:	c6 45 ed 0c          	movb   $0xc,-0x13(%ebp)
  100f0a:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100f0e:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100f12:	ee                   	out    %al,(%dx)
  100f13:	66 c7 45 ea f9 03    	movw   $0x3f9,-0x16(%ebp)
  100f19:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
  100f1d:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100f21:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100f25:	ee                   	out    %al,(%dx)
  100f26:	66 c7 45 e6 fb 03    	movw   $0x3fb,-0x1a(%ebp)
  100f2c:	c6 45 e5 03          	movb   $0x3,-0x1b(%ebp)
  100f30:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100f34:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100f38:	ee                   	out    %al,(%dx)
  100f39:	66 c7 45 e2 fc 03    	movw   $0x3fc,-0x1e(%ebp)
  100f3f:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
  100f43:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  100f47:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  100f4b:	ee                   	out    %al,(%dx)
  100f4c:	66 c7 45 de f9 03    	movw   $0x3f9,-0x22(%ebp)
  100f52:	c6 45 dd 01          	movb   $0x1,-0x23(%ebp)
  100f56:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  100f5a:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  100f5e:	ee                   	out    %al,(%dx)
  100f5f:	66 c7 45 da fd 03    	movw   $0x3fd,-0x26(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100f65:	0f b7 45 da          	movzwl -0x26(%ebp),%eax
  100f69:	89 c2                	mov    %eax,%edx
  100f6b:	ec                   	in     (%dx),%al
  100f6c:	88 45 d9             	mov    %al,-0x27(%ebp)
    return data;
  100f6f:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
    // Enable rcv interrupts
    outb(COM1 + COM_IER, COM_IER_RDI);

    // Clear any preexisting overrun indications and interrupts
    // Serial port doesn't exist if COM_LSR returns 0xFF
    serial_exists = (inb(COM1 + COM_LSR) != 0xFF);
  100f73:	3c ff                	cmp    $0xff,%al
  100f75:	0f 95 c0             	setne  %al
  100f78:	0f b6 c0             	movzbl %al,%eax
  100f7b:	a3 68 ee 10 00       	mov    %eax,0x10ee68
  100f80:	66 c7 45 d6 fa 03    	movw   $0x3fa,-0x2a(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100f86:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
  100f8a:	89 c2                	mov    %eax,%edx
  100f8c:	ec                   	in     (%dx),%al
  100f8d:	88 45 d5             	mov    %al,-0x2b(%ebp)
  100f90:	66 c7 45 d2 f8 03    	movw   $0x3f8,-0x2e(%ebp)
  100f96:	0f b7 45 d2          	movzwl -0x2e(%ebp),%eax
  100f9a:	89 c2                	mov    %eax,%edx
  100f9c:	ec                   	in     (%dx),%al
  100f9d:	88 45 d1             	mov    %al,-0x2f(%ebp)
    (void) inb(COM1+COM_IIR);
    (void) inb(COM1+COM_RX);

    if (serial_exists) {
  100fa0:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  100fa5:	85 c0                	test   %eax,%eax
  100fa7:	74 0c                	je     100fb5 <serial_init+0xe1>
        pic_enable(IRQ_COM1);
  100fa9:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  100fb0:	e8 b0 06 00 00       	call   101665 <pic_enable>
    }
}
  100fb5:	c9                   	leave  
  100fb6:	c3                   	ret    

00100fb7 <lpt_putc_sub>:

static void
lpt_putc_sub(int c) {
  100fb7:	55                   	push   %ebp
  100fb8:	89 e5                	mov    %esp,%ebp
  100fba:	83 ec 20             	sub    $0x20,%esp
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100fbd:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  100fc4:	eb 09                	jmp    100fcf <lpt_putc_sub+0x18>
        delay();
  100fc6:	e8 db fd ff ff       	call   100da6 <delay>
}

static void
lpt_putc_sub(int c) {
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100fcb:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  100fcf:	66 c7 45 fa 79 03    	movw   $0x379,-0x6(%ebp)
  100fd5:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100fd9:	89 c2                	mov    %eax,%edx
  100fdb:	ec                   	in     (%dx),%al
  100fdc:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  100fdf:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  100fe3:	84 c0                	test   %al,%al
  100fe5:	78 09                	js     100ff0 <lpt_putc_sub+0x39>
  100fe7:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  100fee:	7e d6                	jle    100fc6 <lpt_putc_sub+0xf>
        delay();
    }
    outb(LPTPORT + 0, c);
  100ff0:	8b 45 08             	mov    0x8(%ebp),%eax
  100ff3:	0f b6 c0             	movzbl %al,%eax
  100ff6:	66 c7 45 f6 78 03    	movw   $0x378,-0xa(%ebp)
  100ffc:	88 45 f5             	mov    %al,-0xb(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100fff:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  101003:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  101007:	ee                   	out    %al,(%dx)
  101008:	66 c7 45 f2 7a 03    	movw   $0x37a,-0xe(%ebp)
  10100e:	c6 45 f1 0d          	movb   $0xd,-0xf(%ebp)
  101012:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  101016:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  10101a:	ee                   	out    %al,(%dx)
  10101b:	66 c7 45 ee 7a 03    	movw   $0x37a,-0x12(%ebp)
  101021:	c6 45 ed 08          	movb   $0x8,-0x13(%ebp)
  101025:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  101029:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  10102d:	ee                   	out    %al,(%dx)
    outb(LPTPORT + 2, 0x08 | 0x04 | 0x01);
    outb(LPTPORT + 2, 0x08);
}
  10102e:	c9                   	leave  
  10102f:	c3                   	ret    

00101030 <lpt_putc>:

/* lpt_putc - copy console output to parallel port */
static void
lpt_putc(int c) {
  101030:	55                   	push   %ebp
  101031:	89 e5                	mov    %esp,%ebp
  101033:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  101036:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  10103a:	74 0d                	je     101049 <lpt_putc+0x19>
        lpt_putc_sub(c);
  10103c:	8b 45 08             	mov    0x8(%ebp),%eax
  10103f:	89 04 24             	mov    %eax,(%esp)
  101042:	e8 70 ff ff ff       	call   100fb7 <lpt_putc_sub>
  101047:	eb 24                	jmp    10106d <lpt_putc+0x3d>
    }
    else {
        lpt_putc_sub('\b');
  101049:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101050:	e8 62 ff ff ff       	call   100fb7 <lpt_putc_sub>
        lpt_putc_sub(' ');
  101055:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  10105c:	e8 56 ff ff ff       	call   100fb7 <lpt_putc_sub>
        lpt_putc_sub('\b');
  101061:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101068:	e8 4a ff ff ff       	call   100fb7 <lpt_putc_sub>
    }
}
  10106d:	c9                   	leave  
  10106e:	c3                   	ret    

0010106f <cga_putc>:

/* cga_putc - print character to console */
static void
cga_putc(int c) {
  10106f:	55                   	push   %ebp
  101070:	89 e5                	mov    %esp,%ebp
  101072:	53                   	push   %ebx
  101073:	83 ec 34             	sub    $0x34,%esp
    // set black on white
    if (!(c & ~0xFF)) {
  101076:	8b 45 08             	mov    0x8(%ebp),%eax
  101079:	b0 00                	mov    $0x0,%al
  10107b:	85 c0                	test   %eax,%eax
  10107d:	75 07                	jne    101086 <cga_putc+0x17>
        c |= 0x0700;
  10107f:	81 4d 08 00 07 00 00 	orl    $0x700,0x8(%ebp)
    }

    switch (c & 0xff) {
  101086:	8b 45 08             	mov    0x8(%ebp),%eax
  101089:	0f b6 c0             	movzbl %al,%eax
  10108c:	83 f8 0a             	cmp    $0xa,%eax
  10108f:	74 4c                	je     1010dd <cga_putc+0x6e>
  101091:	83 f8 0d             	cmp    $0xd,%eax
  101094:	74 57                	je     1010ed <cga_putc+0x7e>
  101096:	83 f8 08             	cmp    $0x8,%eax
  101099:	0f 85 88 00 00 00    	jne    101127 <cga_putc+0xb8>
    case '\b':
        if (crt_pos > 0) {
  10109f:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1010a6:	66 85 c0             	test   %ax,%ax
  1010a9:	74 30                	je     1010db <cga_putc+0x6c>
            crt_pos --;
  1010ab:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1010b2:	83 e8 01             	sub    $0x1,%eax
  1010b5:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
  1010bb:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  1010c0:	0f b7 15 64 ee 10 00 	movzwl 0x10ee64,%edx
  1010c7:	0f b7 d2             	movzwl %dx,%edx
  1010ca:	01 d2                	add    %edx,%edx
  1010cc:	01 c2                	add    %eax,%edx
  1010ce:	8b 45 08             	mov    0x8(%ebp),%eax
  1010d1:	b0 00                	mov    $0x0,%al
  1010d3:	83 c8 20             	or     $0x20,%eax
  1010d6:	66 89 02             	mov    %ax,(%edx)
        }
        break;
  1010d9:	eb 72                	jmp    10114d <cga_putc+0xde>
  1010db:	eb 70                	jmp    10114d <cga_putc+0xde>
    case '\n':
        crt_pos += CRT_COLS;
  1010dd:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1010e4:	83 c0 50             	add    $0x50,%eax
  1010e7:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
    case '\r':
        crt_pos -= (crt_pos % CRT_COLS);
  1010ed:	0f b7 1d 64 ee 10 00 	movzwl 0x10ee64,%ebx
  1010f4:	0f b7 0d 64 ee 10 00 	movzwl 0x10ee64,%ecx
  1010fb:	0f b7 c1             	movzwl %cx,%eax
  1010fe:	69 c0 cd cc 00 00    	imul   $0xcccd,%eax,%eax
  101104:	c1 e8 10             	shr    $0x10,%eax
  101107:	89 c2                	mov    %eax,%edx
  101109:	66 c1 ea 06          	shr    $0x6,%dx
  10110d:	89 d0                	mov    %edx,%eax
  10110f:	c1 e0 02             	shl    $0x2,%eax
  101112:	01 d0                	add    %edx,%eax
  101114:	c1 e0 04             	shl    $0x4,%eax
  101117:	29 c1                	sub    %eax,%ecx
  101119:	89 ca                	mov    %ecx,%edx
  10111b:	89 d8                	mov    %ebx,%eax
  10111d:	29 d0                	sub    %edx,%eax
  10111f:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
        break;
  101125:	eb 26                	jmp    10114d <cga_putc+0xde>
    default:
        crt_buf[crt_pos ++] = c;     // write the character
  101127:	8b 0d 60 ee 10 00    	mov    0x10ee60,%ecx
  10112d:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101134:	8d 50 01             	lea    0x1(%eax),%edx
  101137:	66 89 15 64 ee 10 00 	mov    %dx,0x10ee64
  10113e:	0f b7 c0             	movzwl %ax,%eax
  101141:	01 c0                	add    %eax,%eax
  101143:	8d 14 01             	lea    (%ecx,%eax,1),%edx
  101146:	8b 45 08             	mov    0x8(%ebp),%eax
  101149:	66 89 02             	mov    %ax,(%edx)
        break;
  10114c:	90                   	nop
    }

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
  10114d:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101154:	66 3d cf 07          	cmp    $0x7cf,%ax
  101158:	76 5b                	jbe    1011b5 <cga_putc+0x146>
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
  10115a:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  10115f:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  101165:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  10116a:	c7 44 24 08 00 0f 00 	movl   $0xf00,0x8(%esp)
  101171:	00 
  101172:	89 54 24 04          	mov    %edx,0x4(%esp)
  101176:	89 04 24             	mov    %eax,(%esp)
  101179:	e8 e6 1f 00 00       	call   103164 <memmove>
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  10117e:	c7 45 f4 80 07 00 00 	movl   $0x780,-0xc(%ebp)
  101185:	eb 15                	jmp    10119c <cga_putc+0x12d>
            crt_buf[i] = 0x0700 | ' ';
  101187:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  10118c:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10118f:	01 d2                	add    %edx,%edx
  101191:	01 d0                	add    %edx,%eax
  101193:	66 c7 00 20 07       	movw   $0x720,(%eax)

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  101198:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  10119c:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
  1011a3:	7e e2                	jle    101187 <cga_putc+0x118>
            crt_buf[i] = 0x0700 | ' ';
        }
        crt_pos -= CRT_COLS;
  1011a5:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1011ac:	83 e8 50             	sub    $0x50,%eax
  1011af:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
    }

    // move that little blinky thing
    outb(addr_6845, 14);
  1011b5:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  1011bc:	0f b7 c0             	movzwl %ax,%eax
  1011bf:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
  1011c3:	c6 45 f1 0e          	movb   $0xe,-0xf(%ebp)
  1011c7:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  1011cb:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  1011cf:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos >> 8);
  1011d0:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1011d7:	66 c1 e8 08          	shr    $0x8,%ax
  1011db:	0f b6 c0             	movzbl %al,%eax
  1011de:	0f b7 15 66 ee 10 00 	movzwl 0x10ee66,%edx
  1011e5:	83 c2 01             	add    $0x1,%edx
  1011e8:	0f b7 d2             	movzwl %dx,%edx
  1011eb:	66 89 55 ee          	mov    %dx,-0x12(%ebp)
  1011ef:	88 45 ed             	mov    %al,-0x13(%ebp)
  1011f2:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  1011f6:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  1011fa:	ee                   	out    %al,(%dx)
    outb(addr_6845, 15);
  1011fb:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  101202:	0f b7 c0             	movzwl %ax,%eax
  101205:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
  101209:	c6 45 e9 0f          	movb   $0xf,-0x17(%ebp)
  10120d:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  101211:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  101215:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos);
  101216:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  10121d:	0f b6 c0             	movzbl %al,%eax
  101220:	0f b7 15 66 ee 10 00 	movzwl 0x10ee66,%edx
  101227:	83 c2 01             	add    $0x1,%edx
  10122a:	0f b7 d2             	movzwl %dx,%edx
  10122d:	66 89 55 e6          	mov    %dx,-0x1a(%ebp)
  101231:	88 45 e5             	mov    %al,-0x1b(%ebp)
  101234:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  101238:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  10123c:	ee                   	out    %al,(%dx)
}
  10123d:	83 c4 34             	add    $0x34,%esp
  101240:	5b                   	pop    %ebx
  101241:	5d                   	pop    %ebp
  101242:	c3                   	ret    

00101243 <serial_putc_sub>:

static void
serial_putc_sub(int c) {
  101243:	55                   	push   %ebp
  101244:	89 e5                	mov    %esp,%ebp
  101246:	83 ec 10             	sub    $0x10,%esp
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  101249:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101250:	eb 09                	jmp    10125b <serial_putc_sub+0x18>
        delay();
  101252:	e8 4f fb ff ff       	call   100da6 <delay>
}

static void
serial_putc_sub(int c) {
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  101257:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  10125b:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101261:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  101265:	89 c2                	mov    %eax,%edx
  101267:	ec                   	in     (%dx),%al
  101268:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  10126b:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  10126f:	0f b6 c0             	movzbl %al,%eax
  101272:	83 e0 20             	and    $0x20,%eax
  101275:	85 c0                	test   %eax,%eax
  101277:	75 09                	jne    101282 <serial_putc_sub+0x3f>
  101279:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  101280:	7e d0                	jle    101252 <serial_putc_sub+0xf>
        delay();
    }
    outb(COM1 + COM_TX, c);
  101282:	8b 45 08             	mov    0x8(%ebp),%eax
  101285:	0f b6 c0             	movzbl %al,%eax
  101288:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  10128e:	88 45 f5             	mov    %al,-0xb(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101291:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  101295:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  101299:	ee                   	out    %al,(%dx)
}
  10129a:	c9                   	leave  
  10129b:	c3                   	ret    

0010129c <serial_putc>:

/* serial_putc - print character to serial port */
static void
serial_putc(int c) {
  10129c:	55                   	push   %ebp
  10129d:	89 e5                	mov    %esp,%ebp
  10129f:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  1012a2:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  1012a6:	74 0d                	je     1012b5 <serial_putc+0x19>
        serial_putc_sub(c);
  1012a8:	8b 45 08             	mov    0x8(%ebp),%eax
  1012ab:	89 04 24             	mov    %eax,(%esp)
  1012ae:	e8 90 ff ff ff       	call   101243 <serial_putc_sub>
  1012b3:	eb 24                	jmp    1012d9 <serial_putc+0x3d>
    }
    else {
        serial_putc_sub('\b');
  1012b5:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  1012bc:	e8 82 ff ff ff       	call   101243 <serial_putc_sub>
        serial_putc_sub(' ');
  1012c1:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  1012c8:	e8 76 ff ff ff       	call   101243 <serial_putc_sub>
        serial_putc_sub('\b');
  1012cd:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  1012d4:	e8 6a ff ff ff       	call   101243 <serial_putc_sub>
    }
}
  1012d9:	c9                   	leave  
  1012da:	c3                   	ret    

001012db <cons_intr>:
/* *
 * cons_intr - called by device interrupt routines to feed input
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
  1012db:	55                   	push   %ebp
  1012dc:	89 e5                	mov    %esp,%ebp
  1012de:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = (*proc)()) != -1) {
  1012e1:	eb 33                	jmp    101316 <cons_intr+0x3b>
        if (c != 0) {
  1012e3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1012e7:	74 2d                	je     101316 <cons_intr+0x3b>
            cons.buf[cons.wpos ++] = c;
  1012e9:	a1 84 f0 10 00       	mov    0x10f084,%eax
  1012ee:	8d 50 01             	lea    0x1(%eax),%edx
  1012f1:	89 15 84 f0 10 00    	mov    %edx,0x10f084
  1012f7:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1012fa:	88 90 80 ee 10 00    	mov    %dl,0x10ee80(%eax)
            if (cons.wpos == CONSBUFSIZE) {
  101300:	a1 84 f0 10 00       	mov    0x10f084,%eax
  101305:	3d 00 02 00 00       	cmp    $0x200,%eax
  10130a:	75 0a                	jne    101316 <cons_intr+0x3b>
                cons.wpos = 0;
  10130c:	c7 05 84 f0 10 00 00 	movl   $0x0,0x10f084
  101313:	00 00 00 
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
    int c;
    while ((c = (*proc)()) != -1) {
  101316:	8b 45 08             	mov    0x8(%ebp),%eax
  101319:	ff d0                	call   *%eax
  10131b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10131e:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
  101322:	75 bf                	jne    1012e3 <cons_intr+0x8>
            if (cons.wpos == CONSBUFSIZE) {
                cons.wpos = 0;
            }
        }
    }
}
  101324:	c9                   	leave  
  101325:	c3                   	ret    

00101326 <serial_proc_data>:

/* serial_proc_data - get data from serial port */
static int
serial_proc_data(void) {
  101326:	55                   	push   %ebp
  101327:	89 e5                	mov    %esp,%ebp
  101329:	83 ec 10             	sub    $0x10,%esp
  10132c:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101332:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  101336:	89 c2                	mov    %eax,%edx
  101338:	ec                   	in     (%dx),%al
  101339:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  10133c:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
    if (!(inb(COM1 + COM_LSR) & COM_LSR_DATA)) {
  101340:	0f b6 c0             	movzbl %al,%eax
  101343:	83 e0 01             	and    $0x1,%eax
  101346:	85 c0                	test   %eax,%eax
  101348:	75 07                	jne    101351 <serial_proc_data+0x2b>
        return -1;
  10134a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10134f:	eb 2a                	jmp    10137b <serial_proc_data+0x55>
  101351:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101357:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10135b:	89 c2                	mov    %eax,%edx
  10135d:	ec                   	in     (%dx),%al
  10135e:	88 45 f5             	mov    %al,-0xb(%ebp)
    return data;
  101361:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
    }
    int c = inb(COM1 + COM_RX);
  101365:	0f b6 c0             	movzbl %al,%eax
  101368:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if (c == 127) {
  10136b:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%ebp)
  10136f:	75 07                	jne    101378 <serial_proc_data+0x52>
        c = '\b';
  101371:	c7 45 fc 08 00 00 00 	movl   $0x8,-0x4(%ebp)
    }
    return c;
  101378:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  10137b:	c9                   	leave  
  10137c:	c3                   	ret    

0010137d <serial_intr>:

/* serial_intr - try to feed input characters from serial port */
void
serial_intr(void) {
  10137d:	55                   	push   %ebp
  10137e:	89 e5                	mov    %esp,%ebp
  101380:	83 ec 18             	sub    $0x18,%esp
    if (serial_exists) {
  101383:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  101388:	85 c0                	test   %eax,%eax
  10138a:	74 0c                	je     101398 <serial_intr+0x1b>
        cons_intr(serial_proc_data);
  10138c:	c7 04 24 26 13 10 00 	movl   $0x101326,(%esp)
  101393:	e8 43 ff ff ff       	call   1012db <cons_intr>
    }
}
  101398:	c9                   	leave  
  101399:	c3                   	ret    

0010139a <kbd_proc_data>:
 *
 * The kbd_proc_data() function gets data from the keyboard.
 * If we finish a character, return it, else 0. And return -1 if no data.
 * */
static int
kbd_proc_data(void) {
  10139a:	55                   	push   %ebp
  10139b:	89 e5                	mov    %esp,%ebp
  10139d:	83 ec 38             	sub    $0x38,%esp
  1013a0:	66 c7 45 f0 64 00    	movw   $0x64,-0x10(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1013a6:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  1013aa:	89 c2                	mov    %eax,%edx
  1013ac:	ec                   	in     (%dx),%al
  1013ad:	88 45 ef             	mov    %al,-0x11(%ebp)
    return data;
  1013b0:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    int c;
    uint8_t data;
    static uint32_t shift;

    if ((inb(KBSTATP) & KBS_DIB) == 0) {
  1013b4:	0f b6 c0             	movzbl %al,%eax
  1013b7:	83 e0 01             	and    $0x1,%eax
  1013ba:	85 c0                	test   %eax,%eax
  1013bc:	75 0a                	jne    1013c8 <kbd_proc_data+0x2e>
        return -1;
  1013be:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1013c3:	e9 59 01 00 00       	jmp    101521 <kbd_proc_data+0x187>
  1013c8:	66 c7 45 ec 60 00    	movw   $0x60,-0x14(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1013ce:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  1013d2:	89 c2                	mov    %eax,%edx
  1013d4:	ec                   	in     (%dx),%al
  1013d5:	88 45 eb             	mov    %al,-0x15(%ebp)
    return data;
  1013d8:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
    }

    data = inb(KBDATAP);
  1013dc:	88 45 f3             	mov    %al,-0xd(%ebp)

    if (data == 0xE0) {
  1013df:	80 7d f3 e0          	cmpb   $0xe0,-0xd(%ebp)
  1013e3:	75 17                	jne    1013fc <kbd_proc_data+0x62>
        // E0 escape character
        shift |= E0ESC;
  1013e5:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1013ea:	83 c8 40             	or     $0x40,%eax
  1013ed:	a3 88 f0 10 00       	mov    %eax,0x10f088
        return 0;
  1013f2:	b8 00 00 00 00       	mov    $0x0,%eax
  1013f7:	e9 25 01 00 00       	jmp    101521 <kbd_proc_data+0x187>
    } else if (data & 0x80) {
  1013fc:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101400:	84 c0                	test   %al,%al
  101402:	79 47                	jns    10144b <kbd_proc_data+0xb1>
        // Key released
        data = (shift & E0ESC ? data : data & 0x7F);
  101404:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101409:	83 e0 40             	and    $0x40,%eax
  10140c:	85 c0                	test   %eax,%eax
  10140e:	75 09                	jne    101419 <kbd_proc_data+0x7f>
  101410:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101414:	83 e0 7f             	and    $0x7f,%eax
  101417:	eb 04                	jmp    10141d <kbd_proc_data+0x83>
  101419:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10141d:	88 45 f3             	mov    %al,-0xd(%ebp)
        shift &= ~(shiftcode[data] | E0ESC);
  101420:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101424:	0f b6 80 40 e0 10 00 	movzbl 0x10e040(%eax),%eax
  10142b:	83 c8 40             	or     $0x40,%eax
  10142e:	0f b6 c0             	movzbl %al,%eax
  101431:	f7 d0                	not    %eax
  101433:	89 c2                	mov    %eax,%edx
  101435:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10143a:	21 d0                	and    %edx,%eax
  10143c:	a3 88 f0 10 00       	mov    %eax,0x10f088
        return 0;
  101441:	b8 00 00 00 00       	mov    $0x0,%eax
  101446:	e9 d6 00 00 00       	jmp    101521 <kbd_proc_data+0x187>
    } else if (shift & E0ESC) {
  10144b:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101450:	83 e0 40             	and    $0x40,%eax
  101453:	85 c0                	test   %eax,%eax
  101455:	74 11                	je     101468 <kbd_proc_data+0xce>
        // Last character was an E0 escape; or with 0x80
        data |= 0x80;
  101457:	80 4d f3 80          	orb    $0x80,-0xd(%ebp)
        shift &= ~E0ESC;
  10145b:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101460:	83 e0 bf             	and    $0xffffffbf,%eax
  101463:	a3 88 f0 10 00       	mov    %eax,0x10f088
    }

    shift |= shiftcode[data];
  101468:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10146c:	0f b6 80 40 e0 10 00 	movzbl 0x10e040(%eax),%eax
  101473:	0f b6 d0             	movzbl %al,%edx
  101476:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10147b:	09 d0                	or     %edx,%eax
  10147d:	a3 88 f0 10 00       	mov    %eax,0x10f088
    shift ^= togglecode[data];
  101482:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101486:	0f b6 80 40 e1 10 00 	movzbl 0x10e140(%eax),%eax
  10148d:	0f b6 d0             	movzbl %al,%edx
  101490:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101495:	31 d0                	xor    %edx,%eax
  101497:	a3 88 f0 10 00       	mov    %eax,0x10f088

    c = charcode[shift & (CTL | SHIFT)][data];
  10149c:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014a1:	83 e0 03             	and    $0x3,%eax
  1014a4:	8b 14 85 40 e5 10 00 	mov    0x10e540(,%eax,4),%edx
  1014ab:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014af:	01 d0                	add    %edx,%eax
  1014b1:	0f b6 00             	movzbl (%eax),%eax
  1014b4:	0f b6 c0             	movzbl %al,%eax
  1014b7:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if (shift & CAPSLOCK) {
  1014ba:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014bf:	83 e0 08             	and    $0x8,%eax
  1014c2:	85 c0                	test   %eax,%eax
  1014c4:	74 22                	je     1014e8 <kbd_proc_data+0x14e>
        if ('a' <= c && c <= 'z')
  1014c6:	83 7d f4 60          	cmpl   $0x60,-0xc(%ebp)
  1014ca:	7e 0c                	jle    1014d8 <kbd_proc_data+0x13e>
  1014cc:	83 7d f4 7a          	cmpl   $0x7a,-0xc(%ebp)
  1014d0:	7f 06                	jg     1014d8 <kbd_proc_data+0x13e>
            c += 'A' - 'a';
  1014d2:	83 6d f4 20          	subl   $0x20,-0xc(%ebp)
  1014d6:	eb 10                	jmp    1014e8 <kbd_proc_data+0x14e>
        else if ('A' <= c && c <= 'Z')
  1014d8:	83 7d f4 40          	cmpl   $0x40,-0xc(%ebp)
  1014dc:	7e 0a                	jle    1014e8 <kbd_proc_data+0x14e>
  1014de:	83 7d f4 5a          	cmpl   $0x5a,-0xc(%ebp)
  1014e2:	7f 04                	jg     1014e8 <kbd_proc_data+0x14e>
            c += 'a' - 'A';
  1014e4:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
    }

    // Process special keys
    // Ctrl-Alt-Del: reboot
    if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
  1014e8:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014ed:	f7 d0                	not    %eax
  1014ef:	83 e0 06             	and    $0x6,%eax
  1014f2:	85 c0                	test   %eax,%eax
  1014f4:	75 28                	jne    10151e <kbd_proc_data+0x184>
  1014f6:	81 7d f4 e9 00 00 00 	cmpl   $0xe9,-0xc(%ebp)
  1014fd:	75 1f                	jne    10151e <kbd_proc_data+0x184>
        cprintf("Rebooting!\n");
  1014ff:	c7 04 24 dd 35 10 00 	movl   $0x1035dd,(%esp)
  101506:	e8 07 ee ff ff       	call   100312 <cprintf>
  10150b:	66 c7 45 e8 92 00    	movw   $0x92,-0x18(%ebp)
  101511:	c6 45 e7 03          	movb   $0x3,-0x19(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101515:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  101519:	0f b7 55 e8          	movzwl -0x18(%ebp),%edx
  10151d:	ee                   	out    %al,(%dx)
        outb(0x92, 0x3); // courtesy of Chris Frost
    }
    return c;
  10151e:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  101521:	c9                   	leave  
  101522:	c3                   	ret    

00101523 <kbd_intr>:

/* kbd_intr - try to feed input characters from keyboard */
static void
kbd_intr(void) {
  101523:	55                   	push   %ebp
  101524:	89 e5                	mov    %esp,%ebp
  101526:	83 ec 18             	sub    $0x18,%esp
    cons_intr(kbd_proc_data);
  101529:	c7 04 24 9a 13 10 00 	movl   $0x10139a,(%esp)
  101530:	e8 a6 fd ff ff       	call   1012db <cons_intr>
}
  101535:	c9                   	leave  
  101536:	c3                   	ret    

00101537 <kbd_init>:

static void
kbd_init(void) {
  101537:	55                   	push   %ebp
  101538:	89 e5                	mov    %esp,%ebp
  10153a:	83 ec 18             	sub    $0x18,%esp
    // drain the kbd buffer
    kbd_intr();
  10153d:	e8 e1 ff ff ff       	call   101523 <kbd_intr>
    pic_enable(IRQ_KBD);
  101542:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  101549:	e8 17 01 00 00       	call   101665 <pic_enable>
}
  10154e:	c9                   	leave  
  10154f:	c3                   	ret    

00101550 <cons_init>:

/* cons_init - initializes the console devices */
void
cons_init(void) {
  101550:	55                   	push   %ebp
  101551:	89 e5                	mov    %esp,%ebp
  101553:	83 ec 18             	sub    $0x18,%esp
    cga_init();
  101556:	e8 93 f8 ff ff       	call   100dee <cga_init>
    serial_init();
  10155b:	e8 74 f9 ff ff       	call   100ed4 <serial_init>
    kbd_init();
  101560:	e8 d2 ff ff ff       	call   101537 <kbd_init>
    if (!serial_exists) {
  101565:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  10156a:	85 c0                	test   %eax,%eax
  10156c:	75 0c                	jne    10157a <cons_init+0x2a>
        cprintf("serial port does not exist!!\n");
  10156e:	c7 04 24 e9 35 10 00 	movl   $0x1035e9,(%esp)
  101575:	e8 98 ed ff ff       	call   100312 <cprintf>
    }
}
  10157a:	c9                   	leave  
  10157b:	c3                   	ret    

0010157c <cons_putc>:

/* cons_putc - print a single character @c to console devices */
void
cons_putc(int c) {
  10157c:	55                   	push   %ebp
  10157d:	89 e5                	mov    %esp,%ebp
  10157f:	83 ec 18             	sub    $0x18,%esp
    lpt_putc(c);
  101582:	8b 45 08             	mov    0x8(%ebp),%eax
  101585:	89 04 24             	mov    %eax,(%esp)
  101588:	e8 a3 fa ff ff       	call   101030 <lpt_putc>
    cga_putc(c);
  10158d:	8b 45 08             	mov    0x8(%ebp),%eax
  101590:	89 04 24             	mov    %eax,(%esp)
  101593:	e8 d7 fa ff ff       	call   10106f <cga_putc>
    serial_putc(c);
  101598:	8b 45 08             	mov    0x8(%ebp),%eax
  10159b:	89 04 24             	mov    %eax,(%esp)
  10159e:	e8 f9 fc ff ff       	call   10129c <serial_putc>
}
  1015a3:	c9                   	leave  
  1015a4:	c3                   	ret    

001015a5 <cons_getc>:
/* *
 * cons_getc - return the next input character from console,
 * or 0 if none waiting.
 * */
int
cons_getc(void) {
  1015a5:	55                   	push   %ebp
  1015a6:	89 e5                	mov    %esp,%ebp
  1015a8:	83 ec 18             	sub    $0x18,%esp
    int c;

    // poll for any pending input characters,
    // so that this function works even when interrupts are disabled
    // (e.g., when called from the kernel monitor).
    serial_intr();
  1015ab:	e8 cd fd ff ff       	call   10137d <serial_intr>
    kbd_intr();
  1015b0:	e8 6e ff ff ff       	call   101523 <kbd_intr>

    // grab the next character from the input buffer.
    if (cons.rpos != cons.wpos) {
  1015b5:	8b 15 80 f0 10 00    	mov    0x10f080,%edx
  1015bb:	a1 84 f0 10 00       	mov    0x10f084,%eax
  1015c0:	39 c2                	cmp    %eax,%edx
  1015c2:	74 36                	je     1015fa <cons_getc+0x55>
        c = cons.buf[cons.rpos ++];
  1015c4:	a1 80 f0 10 00       	mov    0x10f080,%eax
  1015c9:	8d 50 01             	lea    0x1(%eax),%edx
  1015cc:	89 15 80 f0 10 00    	mov    %edx,0x10f080
  1015d2:	0f b6 80 80 ee 10 00 	movzbl 0x10ee80(%eax),%eax
  1015d9:	0f b6 c0             	movzbl %al,%eax
  1015dc:	89 45 f4             	mov    %eax,-0xc(%ebp)
        if (cons.rpos == CONSBUFSIZE) {
  1015df:	a1 80 f0 10 00       	mov    0x10f080,%eax
  1015e4:	3d 00 02 00 00       	cmp    $0x200,%eax
  1015e9:	75 0a                	jne    1015f5 <cons_getc+0x50>
            cons.rpos = 0;
  1015eb:	c7 05 80 f0 10 00 00 	movl   $0x0,0x10f080
  1015f2:	00 00 00 
        }
        return c;
  1015f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1015f8:	eb 05                	jmp    1015ff <cons_getc+0x5a>
    }
    return 0;
  1015fa:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1015ff:	c9                   	leave  
  101600:	c3                   	ret    

00101601 <intr_enable>:
#include <x86.h>
#include <intr.h>

/* intr_enable - enable irq interrupt */
void
intr_enable(void) {
  101601:	55                   	push   %ebp
  101602:	89 e5                	mov    %esp,%ebp
    asm volatile ("lidt (%0)" :: "r" (pd));
}

static inline void
sti(void) {
    asm volatile ("sti");
  101604:	fb                   	sti    
    sti();
}
  101605:	5d                   	pop    %ebp
  101606:	c3                   	ret    

00101607 <intr_disable>:

/* intr_disable - disable irq interrupt */
void
intr_disable(void) {
  101607:	55                   	push   %ebp
  101608:	89 e5                	mov    %esp,%ebp
}

static inline void
cli(void) {
    asm volatile ("cli");
  10160a:	fa                   	cli    
    cli();
}
  10160b:	5d                   	pop    %ebp
  10160c:	c3                   	ret    

0010160d <pic_setmask>:
// Initial IRQ mask has interrupt 2 enabled (for slave 8259A).
static uint16_t irq_mask = 0xFFFF & ~(1 << IRQ_SLAVE);
static bool did_init = 0;

static void
pic_setmask(uint16_t mask) {
  10160d:	55                   	push   %ebp
  10160e:	89 e5                	mov    %esp,%ebp
  101610:	83 ec 14             	sub    $0x14,%esp
  101613:	8b 45 08             	mov    0x8(%ebp),%eax
  101616:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    irq_mask = mask;
  10161a:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  10161e:	66 a3 50 e5 10 00    	mov    %ax,0x10e550
    if (did_init) {
  101624:	a1 8c f0 10 00       	mov    0x10f08c,%eax
  101629:	85 c0                	test   %eax,%eax
  10162b:	74 36                	je     101663 <pic_setmask+0x56>
        outb(IO_PIC1 + 1, mask);
  10162d:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101631:	0f b6 c0             	movzbl %al,%eax
  101634:	66 c7 45 fe 21 00    	movw   $0x21,-0x2(%ebp)
  10163a:	88 45 fd             	mov    %al,-0x3(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10163d:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  101641:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  101645:	ee                   	out    %al,(%dx)
        outb(IO_PIC2 + 1, mask >> 8);
  101646:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  10164a:	66 c1 e8 08          	shr    $0x8,%ax
  10164e:	0f b6 c0             	movzbl %al,%eax
  101651:	66 c7 45 fa a1 00    	movw   $0xa1,-0x6(%ebp)
  101657:	88 45 f9             	mov    %al,-0x7(%ebp)
  10165a:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  10165e:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  101662:	ee                   	out    %al,(%dx)
    }
}
  101663:	c9                   	leave  
  101664:	c3                   	ret    

00101665 <pic_enable>:

void
pic_enable(unsigned int irq) {
  101665:	55                   	push   %ebp
  101666:	89 e5                	mov    %esp,%ebp
  101668:	83 ec 04             	sub    $0x4,%esp
    pic_setmask(irq_mask & ~(1 << irq));
  10166b:	8b 45 08             	mov    0x8(%ebp),%eax
  10166e:	ba 01 00 00 00       	mov    $0x1,%edx
  101673:	89 c1                	mov    %eax,%ecx
  101675:	d3 e2                	shl    %cl,%edx
  101677:	89 d0                	mov    %edx,%eax
  101679:	f7 d0                	not    %eax
  10167b:	89 c2                	mov    %eax,%edx
  10167d:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  101684:	21 d0                	and    %edx,%eax
  101686:	0f b7 c0             	movzwl %ax,%eax
  101689:	89 04 24             	mov    %eax,(%esp)
  10168c:	e8 7c ff ff ff       	call   10160d <pic_setmask>
}
  101691:	c9                   	leave  
  101692:	c3                   	ret    

00101693 <pic_init>:

/* pic_init - initialize the 8259A interrupt controllers */
void
pic_init(void) {
  101693:	55                   	push   %ebp
  101694:	89 e5                	mov    %esp,%ebp
  101696:	83 ec 44             	sub    $0x44,%esp
    did_init = 1;
  101699:	c7 05 8c f0 10 00 01 	movl   $0x1,0x10f08c
  1016a0:	00 00 00 
  1016a3:	66 c7 45 fe 21 00    	movw   $0x21,-0x2(%ebp)
  1016a9:	c6 45 fd ff          	movb   $0xff,-0x3(%ebp)
  1016ad:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  1016b1:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  1016b5:	ee                   	out    %al,(%dx)
  1016b6:	66 c7 45 fa a1 00    	movw   $0xa1,-0x6(%ebp)
  1016bc:	c6 45 f9 ff          	movb   $0xff,-0x7(%ebp)
  1016c0:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  1016c4:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  1016c8:	ee                   	out    %al,(%dx)
  1016c9:	66 c7 45 f6 20 00    	movw   $0x20,-0xa(%ebp)
  1016cf:	c6 45 f5 11          	movb   $0x11,-0xb(%ebp)
  1016d3:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  1016d7:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  1016db:	ee                   	out    %al,(%dx)
  1016dc:	66 c7 45 f2 21 00    	movw   $0x21,-0xe(%ebp)
  1016e2:	c6 45 f1 20          	movb   $0x20,-0xf(%ebp)
  1016e6:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  1016ea:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  1016ee:	ee                   	out    %al,(%dx)
  1016ef:	66 c7 45 ee 21 00    	movw   $0x21,-0x12(%ebp)
  1016f5:	c6 45 ed 04          	movb   $0x4,-0x13(%ebp)
  1016f9:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  1016fd:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101701:	ee                   	out    %al,(%dx)
  101702:	66 c7 45 ea 21 00    	movw   $0x21,-0x16(%ebp)
  101708:	c6 45 e9 03          	movb   $0x3,-0x17(%ebp)
  10170c:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  101710:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  101714:	ee                   	out    %al,(%dx)
  101715:	66 c7 45 e6 a0 00    	movw   $0xa0,-0x1a(%ebp)
  10171b:	c6 45 e5 11          	movb   $0x11,-0x1b(%ebp)
  10171f:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  101723:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  101727:	ee                   	out    %al,(%dx)
  101728:	66 c7 45 e2 a1 00    	movw   $0xa1,-0x1e(%ebp)
  10172e:	c6 45 e1 28          	movb   $0x28,-0x1f(%ebp)
  101732:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  101736:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  10173a:	ee                   	out    %al,(%dx)
  10173b:	66 c7 45 de a1 00    	movw   $0xa1,-0x22(%ebp)
  101741:	c6 45 dd 02          	movb   $0x2,-0x23(%ebp)
  101745:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  101749:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  10174d:	ee                   	out    %al,(%dx)
  10174e:	66 c7 45 da a1 00    	movw   $0xa1,-0x26(%ebp)
  101754:	c6 45 d9 03          	movb   $0x3,-0x27(%ebp)
  101758:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  10175c:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  101760:	ee                   	out    %al,(%dx)
  101761:	66 c7 45 d6 20 00    	movw   $0x20,-0x2a(%ebp)
  101767:	c6 45 d5 68          	movb   $0x68,-0x2b(%ebp)
  10176b:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  10176f:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  101773:	ee                   	out    %al,(%dx)
  101774:	66 c7 45 d2 20 00    	movw   $0x20,-0x2e(%ebp)
  10177a:	c6 45 d1 0a          	movb   $0xa,-0x2f(%ebp)
  10177e:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  101782:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  101786:	ee                   	out    %al,(%dx)
  101787:	66 c7 45 ce a0 00    	movw   $0xa0,-0x32(%ebp)
  10178d:	c6 45 cd 68          	movb   $0x68,-0x33(%ebp)
  101791:	0f b6 45 cd          	movzbl -0x33(%ebp),%eax
  101795:	0f b7 55 ce          	movzwl -0x32(%ebp),%edx
  101799:	ee                   	out    %al,(%dx)
  10179a:	66 c7 45 ca a0 00    	movw   $0xa0,-0x36(%ebp)
  1017a0:	c6 45 c9 0a          	movb   $0xa,-0x37(%ebp)
  1017a4:	0f b6 45 c9          	movzbl -0x37(%ebp),%eax
  1017a8:	0f b7 55 ca          	movzwl -0x36(%ebp),%edx
  1017ac:	ee                   	out    %al,(%dx)
    outb(IO_PIC1, 0x0a);    // read IRR by default

    outb(IO_PIC2, 0x68);    // OCW3
    outb(IO_PIC2, 0x0a);    // OCW3

    if (irq_mask != 0xFFFF) {
  1017ad:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  1017b4:	66 83 f8 ff          	cmp    $0xffff,%ax
  1017b8:	74 12                	je     1017cc <pic_init+0x139>
        pic_setmask(irq_mask);
  1017ba:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  1017c1:	0f b7 c0             	movzwl %ax,%eax
  1017c4:	89 04 24             	mov    %eax,(%esp)
  1017c7:	e8 41 fe ff ff       	call   10160d <pic_setmask>
    }
}
  1017cc:	c9                   	leave  
  1017cd:	c3                   	ret    

001017ce <print_ticks>:
#include <console.h>
#include <kdebug.h>

#define TICK_NUM 100

static void print_ticks() {
  1017ce:	55                   	push   %ebp
  1017cf:	89 e5                	mov    %esp,%ebp
  1017d1:	83 ec 18             	sub    $0x18,%esp
    cprintf("%d ticks\n",TICK_NUM);
  1017d4:	c7 44 24 04 64 00 00 	movl   $0x64,0x4(%esp)
  1017db:	00 
  1017dc:	c7 04 24 20 36 10 00 	movl   $0x103620,(%esp)
  1017e3:	e8 2a eb ff ff       	call   100312 <cprintf>
#ifdef DEBUG_GRADE
    cprintf("End of Test.\n");
    panic("EOT: kernel seems ok.");
#endif
}
  1017e8:	c9                   	leave  
  1017e9:	c3                   	ret    

001017ea <idt_init>:
    sizeof(idt) - 1, (uintptr_t)idt
};

/* idt_init - initialize IDT to each of the entry points in kern/trap/vectors.S */
void
idt_init(void) {
  1017ea:	55                   	push   %ebp
  1017eb:	89 e5                	mov    %esp,%ebp
      *     Can you see idt[256] in this file? Yes, it's IDT! you can use SETGATE macro to setup each item of IDT
      * (3) After setup the contents of IDT, you will let CPU know where is the IDT by using 'lidt' instruction.
      *     You don't know the meaning of this instruction? just google it! and check the libs/x86.h to know more.
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
}
  1017ed:	5d                   	pop    %ebp
  1017ee:	c3                   	ret    

001017ef <trapname>:

static const char *
trapname(int trapno) {
  1017ef:	55                   	push   %ebp
  1017f0:	89 e5                	mov    %esp,%ebp
        "Alignment Check",
        "Machine-Check",
        "SIMD Floating-Point Exception"
    };

    if (trapno < sizeof(excnames)/sizeof(const char * const)) {
  1017f2:	8b 45 08             	mov    0x8(%ebp),%eax
  1017f5:	83 f8 13             	cmp    $0x13,%eax
  1017f8:	77 0c                	ja     101806 <trapname+0x17>
        return excnames[trapno];
  1017fa:	8b 45 08             	mov    0x8(%ebp),%eax
  1017fd:	8b 04 85 80 39 10 00 	mov    0x103980(,%eax,4),%eax
  101804:	eb 18                	jmp    10181e <trapname+0x2f>
    }
    if (trapno >= IRQ_OFFSET && trapno < IRQ_OFFSET + 16) {
  101806:	83 7d 08 1f          	cmpl   $0x1f,0x8(%ebp)
  10180a:	7e 0d                	jle    101819 <trapname+0x2a>
  10180c:	83 7d 08 2f          	cmpl   $0x2f,0x8(%ebp)
  101810:	7f 07                	jg     101819 <trapname+0x2a>
        return "Hardware Interrupt";
  101812:	b8 2a 36 10 00       	mov    $0x10362a,%eax
  101817:	eb 05                	jmp    10181e <trapname+0x2f>
    }
    return "(unknown trap)";
  101819:	b8 3d 36 10 00       	mov    $0x10363d,%eax
}
  10181e:	5d                   	pop    %ebp
  10181f:	c3                   	ret    

00101820 <trap_in_kernel>:

/* trap_in_kernel - test if trap happened in kernel */
bool
trap_in_kernel(struct trapframe *tf) {
  101820:	55                   	push   %ebp
  101821:	89 e5                	mov    %esp,%ebp
    return (tf->tf_cs == (uint16_t)KERNEL_CS);
  101823:	8b 45 08             	mov    0x8(%ebp),%eax
  101826:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  10182a:	66 83 f8 08          	cmp    $0x8,%ax
  10182e:	0f 94 c0             	sete   %al
  101831:	0f b6 c0             	movzbl %al,%eax
}
  101834:	5d                   	pop    %ebp
  101835:	c3                   	ret    

00101836 <print_trapframe>:
    "TF", "IF", "DF", "OF", NULL, NULL, "NT", NULL,
    "RF", "VM", "AC", "VIF", "VIP", "ID", NULL, NULL,
};

void
print_trapframe(struct trapframe *tf) {
  101836:	55                   	push   %ebp
  101837:	89 e5                	mov    %esp,%ebp
  101839:	83 ec 28             	sub    $0x28,%esp
    cprintf("trapframe at %p\n", tf);
  10183c:	8b 45 08             	mov    0x8(%ebp),%eax
  10183f:	89 44 24 04          	mov    %eax,0x4(%esp)
  101843:	c7 04 24 7e 36 10 00 	movl   $0x10367e,(%esp)
  10184a:	e8 c3 ea ff ff       	call   100312 <cprintf>
    print_regs(&tf->tf_regs);
  10184f:	8b 45 08             	mov    0x8(%ebp),%eax
  101852:	89 04 24             	mov    %eax,(%esp)
  101855:	e8 a1 01 00 00       	call   1019fb <print_regs>
    cprintf("  ds   0x----%04x\n", tf->tf_ds);
  10185a:	8b 45 08             	mov    0x8(%ebp),%eax
  10185d:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
  101861:	0f b7 c0             	movzwl %ax,%eax
  101864:	89 44 24 04          	mov    %eax,0x4(%esp)
  101868:	c7 04 24 8f 36 10 00 	movl   $0x10368f,(%esp)
  10186f:	e8 9e ea ff ff       	call   100312 <cprintf>
    cprintf("  es   0x----%04x\n", tf->tf_es);
  101874:	8b 45 08             	mov    0x8(%ebp),%eax
  101877:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  10187b:	0f b7 c0             	movzwl %ax,%eax
  10187e:	89 44 24 04          	mov    %eax,0x4(%esp)
  101882:	c7 04 24 a2 36 10 00 	movl   $0x1036a2,(%esp)
  101889:	e8 84 ea ff ff       	call   100312 <cprintf>
    cprintf("  fs   0x----%04x\n", tf->tf_fs);
  10188e:	8b 45 08             	mov    0x8(%ebp),%eax
  101891:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  101895:	0f b7 c0             	movzwl %ax,%eax
  101898:	89 44 24 04          	mov    %eax,0x4(%esp)
  10189c:	c7 04 24 b5 36 10 00 	movl   $0x1036b5,(%esp)
  1018a3:	e8 6a ea ff ff       	call   100312 <cprintf>
    cprintf("  gs   0x----%04x\n", tf->tf_gs);
  1018a8:	8b 45 08             	mov    0x8(%ebp),%eax
  1018ab:	0f b7 40 20          	movzwl 0x20(%eax),%eax
  1018af:	0f b7 c0             	movzwl %ax,%eax
  1018b2:	89 44 24 04          	mov    %eax,0x4(%esp)
  1018b6:	c7 04 24 c8 36 10 00 	movl   $0x1036c8,(%esp)
  1018bd:	e8 50 ea ff ff       	call   100312 <cprintf>
    cprintf("  trap 0x%08x %s\n", tf->tf_trapno, trapname(tf->tf_trapno));
  1018c2:	8b 45 08             	mov    0x8(%ebp),%eax
  1018c5:	8b 40 30             	mov    0x30(%eax),%eax
  1018c8:	89 04 24             	mov    %eax,(%esp)
  1018cb:	e8 1f ff ff ff       	call   1017ef <trapname>
  1018d0:	8b 55 08             	mov    0x8(%ebp),%edx
  1018d3:	8b 52 30             	mov    0x30(%edx),%edx
  1018d6:	89 44 24 08          	mov    %eax,0x8(%esp)
  1018da:	89 54 24 04          	mov    %edx,0x4(%esp)
  1018de:	c7 04 24 db 36 10 00 	movl   $0x1036db,(%esp)
  1018e5:	e8 28 ea ff ff       	call   100312 <cprintf>
    cprintf("  err  0x%08x\n", tf->tf_err);
  1018ea:	8b 45 08             	mov    0x8(%ebp),%eax
  1018ed:	8b 40 34             	mov    0x34(%eax),%eax
  1018f0:	89 44 24 04          	mov    %eax,0x4(%esp)
  1018f4:	c7 04 24 ed 36 10 00 	movl   $0x1036ed,(%esp)
  1018fb:	e8 12 ea ff ff       	call   100312 <cprintf>
    cprintf("  eip  0x%08x\n", tf->tf_eip);
  101900:	8b 45 08             	mov    0x8(%ebp),%eax
  101903:	8b 40 38             	mov    0x38(%eax),%eax
  101906:	89 44 24 04          	mov    %eax,0x4(%esp)
  10190a:	c7 04 24 fc 36 10 00 	movl   $0x1036fc,(%esp)
  101911:	e8 fc e9 ff ff       	call   100312 <cprintf>
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
  101916:	8b 45 08             	mov    0x8(%ebp),%eax
  101919:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  10191d:	0f b7 c0             	movzwl %ax,%eax
  101920:	89 44 24 04          	mov    %eax,0x4(%esp)
  101924:	c7 04 24 0b 37 10 00 	movl   $0x10370b,(%esp)
  10192b:	e8 e2 e9 ff ff       	call   100312 <cprintf>
    cprintf("  flag 0x%08x ", tf->tf_eflags);
  101930:	8b 45 08             	mov    0x8(%ebp),%eax
  101933:	8b 40 40             	mov    0x40(%eax),%eax
  101936:	89 44 24 04          	mov    %eax,0x4(%esp)
  10193a:	c7 04 24 1e 37 10 00 	movl   $0x10371e,(%esp)
  101941:	e8 cc e9 ff ff       	call   100312 <cprintf>

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101946:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  10194d:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  101954:	eb 3e                	jmp    101994 <print_trapframe+0x15e>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
  101956:	8b 45 08             	mov    0x8(%ebp),%eax
  101959:	8b 50 40             	mov    0x40(%eax),%edx
  10195c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10195f:	21 d0                	and    %edx,%eax
  101961:	85 c0                	test   %eax,%eax
  101963:	74 28                	je     10198d <print_trapframe+0x157>
  101965:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101968:	8b 04 85 80 e5 10 00 	mov    0x10e580(,%eax,4),%eax
  10196f:	85 c0                	test   %eax,%eax
  101971:	74 1a                	je     10198d <print_trapframe+0x157>
            cprintf("%s,", IA32flags[i]);
  101973:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101976:	8b 04 85 80 e5 10 00 	mov    0x10e580(,%eax,4),%eax
  10197d:	89 44 24 04          	mov    %eax,0x4(%esp)
  101981:	c7 04 24 2d 37 10 00 	movl   $0x10372d,(%esp)
  101988:	e8 85 e9 ff ff       	call   100312 <cprintf>
    cprintf("  eip  0x%08x\n", tf->tf_eip);
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
    cprintf("  flag 0x%08x ", tf->tf_eflags);

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  10198d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  101991:	d1 65 f0             	shll   -0x10(%ebp)
  101994:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101997:	83 f8 17             	cmp    $0x17,%eax
  10199a:	76 ba                	jbe    101956 <print_trapframe+0x120>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
            cprintf("%s,", IA32flags[i]);
        }
    }
    cprintf("IOPL=%d\n", (tf->tf_eflags & FL_IOPL_MASK) >> 12);
  10199c:	8b 45 08             	mov    0x8(%ebp),%eax
  10199f:	8b 40 40             	mov    0x40(%eax),%eax
  1019a2:	25 00 30 00 00       	and    $0x3000,%eax
  1019a7:	c1 e8 0c             	shr    $0xc,%eax
  1019aa:	89 44 24 04          	mov    %eax,0x4(%esp)
  1019ae:	c7 04 24 31 37 10 00 	movl   $0x103731,(%esp)
  1019b5:	e8 58 e9 ff ff       	call   100312 <cprintf>

    if (!trap_in_kernel(tf)) {
  1019ba:	8b 45 08             	mov    0x8(%ebp),%eax
  1019bd:	89 04 24             	mov    %eax,(%esp)
  1019c0:	e8 5b fe ff ff       	call   101820 <trap_in_kernel>
  1019c5:	85 c0                	test   %eax,%eax
  1019c7:	75 30                	jne    1019f9 <print_trapframe+0x1c3>
        cprintf("  esp  0x%08x\n", tf->tf_esp);
  1019c9:	8b 45 08             	mov    0x8(%ebp),%eax
  1019cc:	8b 40 44             	mov    0x44(%eax),%eax
  1019cf:	89 44 24 04          	mov    %eax,0x4(%esp)
  1019d3:	c7 04 24 3a 37 10 00 	movl   $0x10373a,(%esp)
  1019da:	e8 33 e9 ff ff       	call   100312 <cprintf>
        cprintf("  ss   0x----%04x\n", tf->tf_ss);
  1019df:	8b 45 08             	mov    0x8(%ebp),%eax
  1019e2:	0f b7 40 48          	movzwl 0x48(%eax),%eax
  1019e6:	0f b7 c0             	movzwl %ax,%eax
  1019e9:	89 44 24 04          	mov    %eax,0x4(%esp)
  1019ed:	c7 04 24 49 37 10 00 	movl   $0x103749,(%esp)
  1019f4:	e8 19 e9 ff ff       	call   100312 <cprintf>
    }
}
  1019f9:	c9                   	leave  
  1019fa:	c3                   	ret    

001019fb <print_regs>:

void
print_regs(struct pushregs *regs) {
  1019fb:	55                   	push   %ebp
  1019fc:	89 e5                	mov    %esp,%ebp
  1019fe:	83 ec 18             	sub    $0x18,%esp
    cprintf("  edi  0x%08x\n", regs->reg_edi);
  101a01:	8b 45 08             	mov    0x8(%ebp),%eax
  101a04:	8b 00                	mov    (%eax),%eax
  101a06:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a0a:	c7 04 24 5c 37 10 00 	movl   $0x10375c,(%esp)
  101a11:	e8 fc e8 ff ff       	call   100312 <cprintf>
    cprintf("  esi  0x%08x\n", regs->reg_esi);
  101a16:	8b 45 08             	mov    0x8(%ebp),%eax
  101a19:	8b 40 04             	mov    0x4(%eax),%eax
  101a1c:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a20:	c7 04 24 6b 37 10 00 	movl   $0x10376b,(%esp)
  101a27:	e8 e6 e8 ff ff       	call   100312 <cprintf>
    cprintf("  ebp  0x%08x\n", regs->reg_ebp);
  101a2c:	8b 45 08             	mov    0x8(%ebp),%eax
  101a2f:	8b 40 08             	mov    0x8(%eax),%eax
  101a32:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a36:	c7 04 24 7a 37 10 00 	movl   $0x10377a,(%esp)
  101a3d:	e8 d0 e8 ff ff       	call   100312 <cprintf>
    cprintf("  oesp 0x%08x\n", regs->reg_oesp);
  101a42:	8b 45 08             	mov    0x8(%ebp),%eax
  101a45:	8b 40 0c             	mov    0xc(%eax),%eax
  101a48:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a4c:	c7 04 24 89 37 10 00 	movl   $0x103789,(%esp)
  101a53:	e8 ba e8 ff ff       	call   100312 <cprintf>
    cprintf("  ebx  0x%08x\n", regs->reg_ebx);
  101a58:	8b 45 08             	mov    0x8(%ebp),%eax
  101a5b:	8b 40 10             	mov    0x10(%eax),%eax
  101a5e:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a62:	c7 04 24 98 37 10 00 	movl   $0x103798,(%esp)
  101a69:	e8 a4 e8 ff ff       	call   100312 <cprintf>
    cprintf("  edx  0x%08x\n", regs->reg_edx);
  101a6e:	8b 45 08             	mov    0x8(%ebp),%eax
  101a71:	8b 40 14             	mov    0x14(%eax),%eax
  101a74:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a78:	c7 04 24 a7 37 10 00 	movl   $0x1037a7,(%esp)
  101a7f:	e8 8e e8 ff ff       	call   100312 <cprintf>
    cprintf("  ecx  0x%08x\n", regs->reg_ecx);
  101a84:	8b 45 08             	mov    0x8(%ebp),%eax
  101a87:	8b 40 18             	mov    0x18(%eax),%eax
  101a8a:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a8e:	c7 04 24 b6 37 10 00 	movl   $0x1037b6,(%esp)
  101a95:	e8 78 e8 ff ff       	call   100312 <cprintf>
    cprintf("  eax  0x%08x\n", regs->reg_eax);
  101a9a:	8b 45 08             	mov    0x8(%ebp),%eax
  101a9d:	8b 40 1c             	mov    0x1c(%eax),%eax
  101aa0:	89 44 24 04          	mov    %eax,0x4(%esp)
  101aa4:	c7 04 24 c5 37 10 00 	movl   $0x1037c5,(%esp)
  101aab:	e8 62 e8 ff ff       	call   100312 <cprintf>
}
  101ab0:	c9                   	leave  
  101ab1:	c3                   	ret    

00101ab2 <trap_dispatch>:

/* trap_dispatch - dispatch based on what type of trap occurred */
static void
trap_dispatch(struct trapframe *tf) {
  101ab2:	55                   	push   %ebp
  101ab3:	89 e5                	mov    %esp,%ebp
  101ab5:	83 ec 28             	sub    $0x28,%esp
    char c;

    switch (tf->tf_trapno) {
  101ab8:	8b 45 08             	mov    0x8(%ebp),%eax
  101abb:	8b 40 30             	mov    0x30(%eax),%eax
  101abe:	83 f8 2f             	cmp    $0x2f,%eax
  101ac1:	77 1e                	ja     101ae1 <trap_dispatch+0x2f>
  101ac3:	83 f8 2e             	cmp    $0x2e,%eax
  101ac6:	0f 83 bf 00 00 00    	jae    101b8b <trap_dispatch+0xd9>
  101acc:	83 f8 21             	cmp    $0x21,%eax
  101acf:	74 40                	je     101b11 <trap_dispatch+0x5f>
  101ad1:	83 f8 24             	cmp    $0x24,%eax
  101ad4:	74 15                	je     101aeb <trap_dispatch+0x39>
  101ad6:	83 f8 20             	cmp    $0x20,%eax
  101ad9:	0f 84 af 00 00 00    	je     101b8e <trap_dispatch+0xdc>
  101adf:	eb 72                	jmp    101b53 <trap_dispatch+0xa1>
  101ae1:	83 e8 78             	sub    $0x78,%eax
  101ae4:	83 f8 01             	cmp    $0x1,%eax
  101ae7:	77 6a                	ja     101b53 <trap_dispatch+0xa1>
  101ae9:	eb 4c                	jmp    101b37 <trap_dispatch+0x85>
         * (2) Every TICK_NUM cycle, you can print some info using a funciton, such as print_ticks().
         * (3) Too Simple? Yes, I think so!
         */
        break;
    case IRQ_OFFSET + IRQ_COM1:
        c = cons_getc();
  101aeb:	e8 b5 fa ff ff       	call   1015a5 <cons_getc>
  101af0:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("serial [%03d] %c\n", c, c);
  101af3:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101af7:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101afb:	89 54 24 08          	mov    %edx,0x8(%esp)
  101aff:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b03:	c7 04 24 d4 37 10 00 	movl   $0x1037d4,(%esp)
  101b0a:	e8 03 e8 ff ff       	call   100312 <cprintf>
        break;
  101b0f:	eb 7e                	jmp    101b8f <trap_dispatch+0xdd>
    case IRQ_OFFSET + IRQ_KBD:
        c = cons_getc();
  101b11:	e8 8f fa ff ff       	call   1015a5 <cons_getc>
  101b16:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("kbd [%03d] %c\n", c, c);
  101b19:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101b1d:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101b21:	89 54 24 08          	mov    %edx,0x8(%esp)
  101b25:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b29:	c7 04 24 e6 37 10 00 	movl   $0x1037e6,(%esp)
  101b30:	e8 dd e7 ff ff       	call   100312 <cprintf>
        break;
  101b35:	eb 58                	jmp    101b8f <trap_dispatch+0xdd>
    //LAB1 CHALLENGE 1 : YOUR CODE you should modify below codes.
    case T_SWITCH_TOU:
    case T_SWITCH_TOK:
        panic("T_SWITCH_** ??\n");
  101b37:	c7 44 24 08 f5 37 10 	movl   $0x1037f5,0x8(%esp)
  101b3e:	00 
  101b3f:	c7 44 24 04 a2 00 00 	movl   $0xa2,0x4(%esp)
  101b46:	00 
  101b47:	c7 04 24 05 38 10 00 	movl   $0x103805,(%esp)
  101b4e:	e8 34 f1 ff ff       	call   100c87 <__panic>
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
    default:
        // in kernel, it must be a mistake
        if ((tf->tf_cs & 3) == 0) {
  101b53:	8b 45 08             	mov    0x8(%ebp),%eax
  101b56:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101b5a:	0f b7 c0             	movzwl %ax,%eax
  101b5d:	83 e0 03             	and    $0x3,%eax
  101b60:	85 c0                	test   %eax,%eax
  101b62:	75 2b                	jne    101b8f <trap_dispatch+0xdd>
            print_trapframe(tf);
  101b64:	8b 45 08             	mov    0x8(%ebp),%eax
  101b67:	89 04 24             	mov    %eax,(%esp)
  101b6a:	e8 c7 fc ff ff       	call   101836 <print_trapframe>
            panic("unexpected trap in kernel.\n");
  101b6f:	c7 44 24 08 16 38 10 	movl   $0x103816,0x8(%esp)
  101b76:	00 
  101b77:	c7 44 24 04 ac 00 00 	movl   $0xac,0x4(%esp)
  101b7e:	00 
  101b7f:	c7 04 24 05 38 10 00 	movl   $0x103805,(%esp)
  101b86:	e8 fc f0 ff ff       	call   100c87 <__panic>
        panic("T_SWITCH_** ??\n");
        break;
    case IRQ_OFFSET + IRQ_IDE1:
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
  101b8b:	90                   	nop
  101b8c:	eb 01                	jmp    101b8f <trap_dispatch+0xdd>
        /* handle the timer interrupt */
        /* (1) After a timer interrupt, you should record this event using a global variable (increase it), such as ticks in kern/driver/clock.c
         * (2) Every TICK_NUM cycle, you can print some info using a funciton, such as print_ticks().
         * (3) Too Simple? Yes, I think so!
         */
        break;
  101b8e:	90                   	nop
        if ((tf->tf_cs & 3) == 0) {
            print_trapframe(tf);
            panic("unexpected trap in kernel.\n");
        }
    }
}
  101b8f:	c9                   	leave  
  101b90:	c3                   	ret    

00101b91 <trap>:
 * trap - handles or dispatches an exception/interrupt. if and when trap() returns,
 * the code in kern/trap/trapentry.S restores the old CPU state saved in the
 * trapframe and then uses the iret instruction to return from the exception.
 * */
void
trap(struct trapframe *tf) {
  101b91:	55                   	push   %ebp
  101b92:	89 e5                	mov    %esp,%ebp
  101b94:	83 ec 18             	sub    $0x18,%esp
    // dispatch based on what type of trap occurred
    trap_dispatch(tf);
  101b97:	8b 45 08             	mov    0x8(%ebp),%eax
  101b9a:	89 04 24             	mov    %eax,(%esp)
  101b9d:	e8 10 ff ff ff       	call   101ab2 <trap_dispatch>
}
  101ba2:	c9                   	leave  
  101ba3:	c3                   	ret    

00101ba4 <__alltraps>:
.text
.globl __alltraps
__alltraps:
    # push registers to build a trap frame
    # therefore make the stack look like a struct trapframe
    pushl %ds
  101ba4:	1e                   	push   %ds
    pushl %es
  101ba5:	06                   	push   %es
    pushl %fs
  101ba6:	0f a0                	push   %fs
    pushl %gs
  101ba8:	0f a8                	push   %gs
    pushal
  101baa:	60                   	pusha  

    # load GD_KDATA into %ds and %es to set up data segments for kernel
    movl $GD_KDATA, %eax
  101bab:	b8 10 00 00 00       	mov    $0x10,%eax
    movw %ax, %ds
  101bb0:	8e d8                	mov    %eax,%ds
    movw %ax, %es
  101bb2:	8e c0                	mov    %eax,%es

    # push %esp to pass a pointer to the trapframe as an argument to trap()
    pushl %esp
  101bb4:	54                   	push   %esp

    # call trap(tf), where tf=%esp
    call trap
  101bb5:	e8 d7 ff ff ff       	call   101b91 <trap>

    # pop the pushed stack pointer
    popl %esp
  101bba:	5c                   	pop    %esp

00101bbb <__trapret>:

    # return falls through to trapret...
.globl __trapret
__trapret:
    # restore registers from stack
    popal
  101bbb:	61                   	popa   

    # restore %ds, %es, %fs and %gs
    popl %gs
  101bbc:	0f a9                	pop    %gs
    popl %fs
  101bbe:	0f a1                	pop    %fs
    popl %es
  101bc0:	07                   	pop    %es
    popl %ds
  101bc1:	1f                   	pop    %ds

    # get rid of the trap number and error code
    addl $0x8, %esp
  101bc2:	83 c4 08             	add    $0x8,%esp
    iret
  101bc5:	cf                   	iret   

00101bc6 <vector0>:
# handler
.text
.globl __alltraps
.globl vector0
vector0:
  pushl $0
  101bc6:	6a 00                	push   $0x0
  pushl $0
  101bc8:	6a 00                	push   $0x0
  jmp __alltraps
  101bca:	e9 d5 ff ff ff       	jmp    101ba4 <__alltraps>

00101bcf <vector1>:
.globl vector1
vector1:
  pushl $0
  101bcf:	6a 00                	push   $0x0
  pushl $1
  101bd1:	6a 01                	push   $0x1
  jmp __alltraps
  101bd3:	e9 cc ff ff ff       	jmp    101ba4 <__alltraps>

00101bd8 <vector2>:
.globl vector2
vector2:
  pushl $0
  101bd8:	6a 00                	push   $0x0
  pushl $2
  101bda:	6a 02                	push   $0x2
  jmp __alltraps
  101bdc:	e9 c3 ff ff ff       	jmp    101ba4 <__alltraps>

00101be1 <vector3>:
.globl vector3
vector3:
  pushl $0
  101be1:	6a 00                	push   $0x0
  pushl $3
  101be3:	6a 03                	push   $0x3
  jmp __alltraps
  101be5:	e9 ba ff ff ff       	jmp    101ba4 <__alltraps>

00101bea <vector4>:
.globl vector4
vector4:
  pushl $0
  101bea:	6a 00                	push   $0x0
  pushl $4
  101bec:	6a 04                	push   $0x4
  jmp __alltraps
  101bee:	e9 b1 ff ff ff       	jmp    101ba4 <__alltraps>

00101bf3 <vector5>:
.globl vector5
vector5:
  pushl $0
  101bf3:	6a 00                	push   $0x0
  pushl $5
  101bf5:	6a 05                	push   $0x5
  jmp __alltraps
  101bf7:	e9 a8 ff ff ff       	jmp    101ba4 <__alltraps>

00101bfc <vector6>:
.globl vector6
vector6:
  pushl $0
  101bfc:	6a 00                	push   $0x0
  pushl $6
  101bfe:	6a 06                	push   $0x6
  jmp __alltraps
  101c00:	e9 9f ff ff ff       	jmp    101ba4 <__alltraps>

00101c05 <vector7>:
.globl vector7
vector7:
  pushl $0
  101c05:	6a 00                	push   $0x0
  pushl $7
  101c07:	6a 07                	push   $0x7
  jmp __alltraps
  101c09:	e9 96 ff ff ff       	jmp    101ba4 <__alltraps>

00101c0e <vector8>:
.globl vector8
vector8:
  pushl $8
  101c0e:	6a 08                	push   $0x8
  jmp __alltraps
  101c10:	e9 8f ff ff ff       	jmp    101ba4 <__alltraps>

00101c15 <vector9>:
.globl vector9
vector9:
  pushl $9
  101c15:	6a 09                	push   $0x9
  jmp __alltraps
  101c17:	e9 88 ff ff ff       	jmp    101ba4 <__alltraps>

00101c1c <vector10>:
.globl vector10
vector10:
  pushl $10
  101c1c:	6a 0a                	push   $0xa
  jmp __alltraps
  101c1e:	e9 81 ff ff ff       	jmp    101ba4 <__alltraps>

00101c23 <vector11>:
.globl vector11
vector11:
  pushl $11
  101c23:	6a 0b                	push   $0xb
  jmp __alltraps
  101c25:	e9 7a ff ff ff       	jmp    101ba4 <__alltraps>

00101c2a <vector12>:
.globl vector12
vector12:
  pushl $12
  101c2a:	6a 0c                	push   $0xc
  jmp __alltraps
  101c2c:	e9 73 ff ff ff       	jmp    101ba4 <__alltraps>

00101c31 <vector13>:
.globl vector13
vector13:
  pushl $13
  101c31:	6a 0d                	push   $0xd
  jmp __alltraps
  101c33:	e9 6c ff ff ff       	jmp    101ba4 <__alltraps>

00101c38 <vector14>:
.globl vector14
vector14:
  pushl $14
  101c38:	6a 0e                	push   $0xe
  jmp __alltraps
  101c3a:	e9 65 ff ff ff       	jmp    101ba4 <__alltraps>

00101c3f <vector15>:
.globl vector15
vector15:
  pushl $0
  101c3f:	6a 00                	push   $0x0
  pushl $15
  101c41:	6a 0f                	push   $0xf
  jmp __alltraps
  101c43:	e9 5c ff ff ff       	jmp    101ba4 <__alltraps>

00101c48 <vector16>:
.globl vector16
vector16:
  pushl $0
  101c48:	6a 00                	push   $0x0
  pushl $16
  101c4a:	6a 10                	push   $0x10
  jmp __alltraps
  101c4c:	e9 53 ff ff ff       	jmp    101ba4 <__alltraps>

00101c51 <vector17>:
.globl vector17
vector17:
  pushl $17
  101c51:	6a 11                	push   $0x11
  jmp __alltraps
  101c53:	e9 4c ff ff ff       	jmp    101ba4 <__alltraps>

00101c58 <vector18>:
.globl vector18
vector18:
  pushl $0
  101c58:	6a 00                	push   $0x0
  pushl $18
  101c5a:	6a 12                	push   $0x12
  jmp __alltraps
  101c5c:	e9 43 ff ff ff       	jmp    101ba4 <__alltraps>

00101c61 <vector19>:
.globl vector19
vector19:
  pushl $0
  101c61:	6a 00                	push   $0x0
  pushl $19
  101c63:	6a 13                	push   $0x13
  jmp __alltraps
  101c65:	e9 3a ff ff ff       	jmp    101ba4 <__alltraps>

00101c6a <vector20>:
.globl vector20
vector20:
  pushl $0
  101c6a:	6a 00                	push   $0x0
  pushl $20
  101c6c:	6a 14                	push   $0x14
  jmp __alltraps
  101c6e:	e9 31 ff ff ff       	jmp    101ba4 <__alltraps>

00101c73 <vector21>:
.globl vector21
vector21:
  pushl $0
  101c73:	6a 00                	push   $0x0
  pushl $21
  101c75:	6a 15                	push   $0x15
  jmp __alltraps
  101c77:	e9 28 ff ff ff       	jmp    101ba4 <__alltraps>

00101c7c <vector22>:
.globl vector22
vector22:
  pushl $0
  101c7c:	6a 00                	push   $0x0
  pushl $22
  101c7e:	6a 16                	push   $0x16
  jmp __alltraps
  101c80:	e9 1f ff ff ff       	jmp    101ba4 <__alltraps>

00101c85 <vector23>:
.globl vector23
vector23:
  pushl $0
  101c85:	6a 00                	push   $0x0
  pushl $23
  101c87:	6a 17                	push   $0x17
  jmp __alltraps
  101c89:	e9 16 ff ff ff       	jmp    101ba4 <__alltraps>

00101c8e <vector24>:
.globl vector24
vector24:
  pushl $0
  101c8e:	6a 00                	push   $0x0
  pushl $24
  101c90:	6a 18                	push   $0x18
  jmp __alltraps
  101c92:	e9 0d ff ff ff       	jmp    101ba4 <__alltraps>

00101c97 <vector25>:
.globl vector25
vector25:
  pushl $0
  101c97:	6a 00                	push   $0x0
  pushl $25
  101c99:	6a 19                	push   $0x19
  jmp __alltraps
  101c9b:	e9 04 ff ff ff       	jmp    101ba4 <__alltraps>

00101ca0 <vector26>:
.globl vector26
vector26:
  pushl $0
  101ca0:	6a 00                	push   $0x0
  pushl $26
  101ca2:	6a 1a                	push   $0x1a
  jmp __alltraps
  101ca4:	e9 fb fe ff ff       	jmp    101ba4 <__alltraps>

00101ca9 <vector27>:
.globl vector27
vector27:
  pushl $0
  101ca9:	6a 00                	push   $0x0
  pushl $27
  101cab:	6a 1b                	push   $0x1b
  jmp __alltraps
  101cad:	e9 f2 fe ff ff       	jmp    101ba4 <__alltraps>

00101cb2 <vector28>:
.globl vector28
vector28:
  pushl $0
  101cb2:	6a 00                	push   $0x0
  pushl $28
  101cb4:	6a 1c                	push   $0x1c
  jmp __alltraps
  101cb6:	e9 e9 fe ff ff       	jmp    101ba4 <__alltraps>

00101cbb <vector29>:
.globl vector29
vector29:
  pushl $0
  101cbb:	6a 00                	push   $0x0
  pushl $29
  101cbd:	6a 1d                	push   $0x1d
  jmp __alltraps
  101cbf:	e9 e0 fe ff ff       	jmp    101ba4 <__alltraps>

00101cc4 <vector30>:
.globl vector30
vector30:
  pushl $0
  101cc4:	6a 00                	push   $0x0
  pushl $30
  101cc6:	6a 1e                	push   $0x1e
  jmp __alltraps
  101cc8:	e9 d7 fe ff ff       	jmp    101ba4 <__alltraps>

00101ccd <vector31>:
.globl vector31
vector31:
  pushl $0
  101ccd:	6a 00                	push   $0x0
  pushl $31
  101ccf:	6a 1f                	push   $0x1f
  jmp __alltraps
  101cd1:	e9 ce fe ff ff       	jmp    101ba4 <__alltraps>

00101cd6 <vector32>:
.globl vector32
vector32:
  pushl $0
  101cd6:	6a 00                	push   $0x0
  pushl $32
  101cd8:	6a 20                	push   $0x20
  jmp __alltraps
  101cda:	e9 c5 fe ff ff       	jmp    101ba4 <__alltraps>

00101cdf <vector33>:
.globl vector33
vector33:
  pushl $0
  101cdf:	6a 00                	push   $0x0
  pushl $33
  101ce1:	6a 21                	push   $0x21
  jmp __alltraps
  101ce3:	e9 bc fe ff ff       	jmp    101ba4 <__alltraps>

00101ce8 <vector34>:
.globl vector34
vector34:
  pushl $0
  101ce8:	6a 00                	push   $0x0
  pushl $34
  101cea:	6a 22                	push   $0x22
  jmp __alltraps
  101cec:	e9 b3 fe ff ff       	jmp    101ba4 <__alltraps>

00101cf1 <vector35>:
.globl vector35
vector35:
  pushl $0
  101cf1:	6a 00                	push   $0x0
  pushl $35
  101cf3:	6a 23                	push   $0x23
  jmp __alltraps
  101cf5:	e9 aa fe ff ff       	jmp    101ba4 <__alltraps>

00101cfa <vector36>:
.globl vector36
vector36:
  pushl $0
  101cfa:	6a 00                	push   $0x0
  pushl $36
  101cfc:	6a 24                	push   $0x24
  jmp __alltraps
  101cfe:	e9 a1 fe ff ff       	jmp    101ba4 <__alltraps>

00101d03 <vector37>:
.globl vector37
vector37:
  pushl $0
  101d03:	6a 00                	push   $0x0
  pushl $37
  101d05:	6a 25                	push   $0x25
  jmp __alltraps
  101d07:	e9 98 fe ff ff       	jmp    101ba4 <__alltraps>

00101d0c <vector38>:
.globl vector38
vector38:
  pushl $0
  101d0c:	6a 00                	push   $0x0
  pushl $38
  101d0e:	6a 26                	push   $0x26
  jmp __alltraps
  101d10:	e9 8f fe ff ff       	jmp    101ba4 <__alltraps>

00101d15 <vector39>:
.globl vector39
vector39:
  pushl $0
  101d15:	6a 00                	push   $0x0
  pushl $39
  101d17:	6a 27                	push   $0x27
  jmp __alltraps
  101d19:	e9 86 fe ff ff       	jmp    101ba4 <__alltraps>

00101d1e <vector40>:
.globl vector40
vector40:
  pushl $0
  101d1e:	6a 00                	push   $0x0
  pushl $40
  101d20:	6a 28                	push   $0x28
  jmp __alltraps
  101d22:	e9 7d fe ff ff       	jmp    101ba4 <__alltraps>

00101d27 <vector41>:
.globl vector41
vector41:
  pushl $0
  101d27:	6a 00                	push   $0x0
  pushl $41
  101d29:	6a 29                	push   $0x29
  jmp __alltraps
  101d2b:	e9 74 fe ff ff       	jmp    101ba4 <__alltraps>

00101d30 <vector42>:
.globl vector42
vector42:
  pushl $0
  101d30:	6a 00                	push   $0x0
  pushl $42
  101d32:	6a 2a                	push   $0x2a
  jmp __alltraps
  101d34:	e9 6b fe ff ff       	jmp    101ba4 <__alltraps>

00101d39 <vector43>:
.globl vector43
vector43:
  pushl $0
  101d39:	6a 00                	push   $0x0
  pushl $43
  101d3b:	6a 2b                	push   $0x2b
  jmp __alltraps
  101d3d:	e9 62 fe ff ff       	jmp    101ba4 <__alltraps>

00101d42 <vector44>:
.globl vector44
vector44:
  pushl $0
  101d42:	6a 00                	push   $0x0
  pushl $44
  101d44:	6a 2c                	push   $0x2c
  jmp __alltraps
  101d46:	e9 59 fe ff ff       	jmp    101ba4 <__alltraps>

00101d4b <vector45>:
.globl vector45
vector45:
  pushl $0
  101d4b:	6a 00                	push   $0x0
  pushl $45
  101d4d:	6a 2d                	push   $0x2d
  jmp __alltraps
  101d4f:	e9 50 fe ff ff       	jmp    101ba4 <__alltraps>

00101d54 <vector46>:
.globl vector46
vector46:
  pushl $0
  101d54:	6a 00                	push   $0x0
  pushl $46
  101d56:	6a 2e                	push   $0x2e
  jmp __alltraps
  101d58:	e9 47 fe ff ff       	jmp    101ba4 <__alltraps>

00101d5d <vector47>:
.globl vector47
vector47:
  pushl $0
  101d5d:	6a 00                	push   $0x0
  pushl $47
  101d5f:	6a 2f                	push   $0x2f
  jmp __alltraps
  101d61:	e9 3e fe ff ff       	jmp    101ba4 <__alltraps>

00101d66 <vector48>:
.globl vector48
vector48:
  pushl $0
  101d66:	6a 00                	push   $0x0
  pushl $48
  101d68:	6a 30                	push   $0x30
  jmp __alltraps
  101d6a:	e9 35 fe ff ff       	jmp    101ba4 <__alltraps>

00101d6f <vector49>:
.globl vector49
vector49:
  pushl $0
  101d6f:	6a 00                	push   $0x0
  pushl $49
  101d71:	6a 31                	push   $0x31
  jmp __alltraps
  101d73:	e9 2c fe ff ff       	jmp    101ba4 <__alltraps>

00101d78 <vector50>:
.globl vector50
vector50:
  pushl $0
  101d78:	6a 00                	push   $0x0
  pushl $50
  101d7a:	6a 32                	push   $0x32
  jmp __alltraps
  101d7c:	e9 23 fe ff ff       	jmp    101ba4 <__alltraps>

00101d81 <vector51>:
.globl vector51
vector51:
  pushl $0
  101d81:	6a 00                	push   $0x0
  pushl $51
  101d83:	6a 33                	push   $0x33
  jmp __alltraps
  101d85:	e9 1a fe ff ff       	jmp    101ba4 <__alltraps>

00101d8a <vector52>:
.globl vector52
vector52:
  pushl $0
  101d8a:	6a 00                	push   $0x0
  pushl $52
  101d8c:	6a 34                	push   $0x34
  jmp __alltraps
  101d8e:	e9 11 fe ff ff       	jmp    101ba4 <__alltraps>

00101d93 <vector53>:
.globl vector53
vector53:
  pushl $0
  101d93:	6a 00                	push   $0x0
  pushl $53
  101d95:	6a 35                	push   $0x35
  jmp __alltraps
  101d97:	e9 08 fe ff ff       	jmp    101ba4 <__alltraps>

00101d9c <vector54>:
.globl vector54
vector54:
  pushl $0
  101d9c:	6a 00                	push   $0x0
  pushl $54
  101d9e:	6a 36                	push   $0x36
  jmp __alltraps
  101da0:	e9 ff fd ff ff       	jmp    101ba4 <__alltraps>

00101da5 <vector55>:
.globl vector55
vector55:
  pushl $0
  101da5:	6a 00                	push   $0x0
  pushl $55
  101da7:	6a 37                	push   $0x37
  jmp __alltraps
  101da9:	e9 f6 fd ff ff       	jmp    101ba4 <__alltraps>

00101dae <vector56>:
.globl vector56
vector56:
  pushl $0
  101dae:	6a 00                	push   $0x0
  pushl $56
  101db0:	6a 38                	push   $0x38
  jmp __alltraps
  101db2:	e9 ed fd ff ff       	jmp    101ba4 <__alltraps>

00101db7 <vector57>:
.globl vector57
vector57:
  pushl $0
  101db7:	6a 00                	push   $0x0
  pushl $57
  101db9:	6a 39                	push   $0x39
  jmp __alltraps
  101dbb:	e9 e4 fd ff ff       	jmp    101ba4 <__alltraps>

00101dc0 <vector58>:
.globl vector58
vector58:
  pushl $0
  101dc0:	6a 00                	push   $0x0
  pushl $58
  101dc2:	6a 3a                	push   $0x3a
  jmp __alltraps
  101dc4:	e9 db fd ff ff       	jmp    101ba4 <__alltraps>

00101dc9 <vector59>:
.globl vector59
vector59:
  pushl $0
  101dc9:	6a 00                	push   $0x0
  pushl $59
  101dcb:	6a 3b                	push   $0x3b
  jmp __alltraps
  101dcd:	e9 d2 fd ff ff       	jmp    101ba4 <__alltraps>

00101dd2 <vector60>:
.globl vector60
vector60:
  pushl $0
  101dd2:	6a 00                	push   $0x0
  pushl $60
  101dd4:	6a 3c                	push   $0x3c
  jmp __alltraps
  101dd6:	e9 c9 fd ff ff       	jmp    101ba4 <__alltraps>

00101ddb <vector61>:
.globl vector61
vector61:
  pushl $0
  101ddb:	6a 00                	push   $0x0
  pushl $61
  101ddd:	6a 3d                	push   $0x3d
  jmp __alltraps
  101ddf:	e9 c0 fd ff ff       	jmp    101ba4 <__alltraps>

00101de4 <vector62>:
.globl vector62
vector62:
  pushl $0
  101de4:	6a 00                	push   $0x0
  pushl $62
  101de6:	6a 3e                	push   $0x3e
  jmp __alltraps
  101de8:	e9 b7 fd ff ff       	jmp    101ba4 <__alltraps>

00101ded <vector63>:
.globl vector63
vector63:
  pushl $0
  101ded:	6a 00                	push   $0x0
  pushl $63
  101def:	6a 3f                	push   $0x3f
  jmp __alltraps
  101df1:	e9 ae fd ff ff       	jmp    101ba4 <__alltraps>

00101df6 <vector64>:
.globl vector64
vector64:
  pushl $0
  101df6:	6a 00                	push   $0x0
  pushl $64
  101df8:	6a 40                	push   $0x40
  jmp __alltraps
  101dfa:	e9 a5 fd ff ff       	jmp    101ba4 <__alltraps>

00101dff <vector65>:
.globl vector65
vector65:
  pushl $0
  101dff:	6a 00                	push   $0x0
  pushl $65
  101e01:	6a 41                	push   $0x41
  jmp __alltraps
  101e03:	e9 9c fd ff ff       	jmp    101ba4 <__alltraps>

00101e08 <vector66>:
.globl vector66
vector66:
  pushl $0
  101e08:	6a 00                	push   $0x0
  pushl $66
  101e0a:	6a 42                	push   $0x42
  jmp __alltraps
  101e0c:	e9 93 fd ff ff       	jmp    101ba4 <__alltraps>

00101e11 <vector67>:
.globl vector67
vector67:
  pushl $0
  101e11:	6a 00                	push   $0x0
  pushl $67
  101e13:	6a 43                	push   $0x43
  jmp __alltraps
  101e15:	e9 8a fd ff ff       	jmp    101ba4 <__alltraps>

00101e1a <vector68>:
.globl vector68
vector68:
  pushl $0
  101e1a:	6a 00                	push   $0x0
  pushl $68
  101e1c:	6a 44                	push   $0x44
  jmp __alltraps
  101e1e:	e9 81 fd ff ff       	jmp    101ba4 <__alltraps>

00101e23 <vector69>:
.globl vector69
vector69:
  pushl $0
  101e23:	6a 00                	push   $0x0
  pushl $69
  101e25:	6a 45                	push   $0x45
  jmp __alltraps
  101e27:	e9 78 fd ff ff       	jmp    101ba4 <__alltraps>

00101e2c <vector70>:
.globl vector70
vector70:
  pushl $0
  101e2c:	6a 00                	push   $0x0
  pushl $70
  101e2e:	6a 46                	push   $0x46
  jmp __alltraps
  101e30:	e9 6f fd ff ff       	jmp    101ba4 <__alltraps>

00101e35 <vector71>:
.globl vector71
vector71:
  pushl $0
  101e35:	6a 00                	push   $0x0
  pushl $71
  101e37:	6a 47                	push   $0x47
  jmp __alltraps
  101e39:	e9 66 fd ff ff       	jmp    101ba4 <__alltraps>

00101e3e <vector72>:
.globl vector72
vector72:
  pushl $0
  101e3e:	6a 00                	push   $0x0
  pushl $72
  101e40:	6a 48                	push   $0x48
  jmp __alltraps
  101e42:	e9 5d fd ff ff       	jmp    101ba4 <__alltraps>

00101e47 <vector73>:
.globl vector73
vector73:
  pushl $0
  101e47:	6a 00                	push   $0x0
  pushl $73
  101e49:	6a 49                	push   $0x49
  jmp __alltraps
  101e4b:	e9 54 fd ff ff       	jmp    101ba4 <__alltraps>

00101e50 <vector74>:
.globl vector74
vector74:
  pushl $0
  101e50:	6a 00                	push   $0x0
  pushl $74
  101e52:	6a 4a                	push   $0x4a
  jmp __alltraps
  101e54:	e9 4b fd ff ff       	jmp    101ba4 <__alltraps>

00101e59 <vector75>:
.globl vector75
vector75:
  pushl $0
  101e59:	6a 00                	push   $0x0
  pushl $75
  101e5b:	6a 4b                	push   $0x4b
  jmp __alltraps
  101e5d:	e9 42 fd ff ff       	jmp    101ba4 <__alltraps>

00101e62 <vector76>:
.globl vector76
vector76:
  pushl $0
  101e62:	6a 00                	push   $0x0
  pushl $76
  101e64:	6a 4c                	push   $0x4c
  jmp __alltraps
  101e66:	e9 39 fd ff ff       	jmp    101ba4 <__alltraps>

00101e6b <vector77>:
.globl vector77
vector77:
  pushl $0
  101e6b:	6a 00                	push   $0x0
  pushl $77
  101e6d:	6a 4d                	push   $0x4d
  jmp __alltraps
  101e6f:	e9 30 fd ff ff       	jmp    101ba4 <__alltraps>

00101e74 <vector78>:
.globl vector78
vector78:
  pushl $0
  101e74:	6a 00                	push   $0x0
  pushl $78
  101e76:	6a 4e                	push   $0x4e
  jmp __alltraps
  101e78:	e9 27 fd ff ff       	jmp    101ba4 <__alltraps>

00101e7d <vector79>:
.globl vector79
vector79:
  pushl $0
  101e7d:	6a 00                	push   $0x0
  pushl $79
  101e7f:	6a 4f                	push   $0x4f
  jmp __alltraps
  101e81:	e9 1e fd ff ff       	jmp    101ba4 <__alltraps>

00101e86 <vector80>:
.globl vector80
vector80:
  pushl $0
  101e86:	6a 00                	push   $0x0
  pushl $80
  101e88:	6a 50                	push   $0x50
  jmp __alltraps
  101e8a:	e9 15 fd ff ff       	jmp    101ba4 <__alltraps>

00101e8f <vector81>:
.globl vector81
vector81:
  pushl $0
  101e8f:	6a 00                	push   $0x0
  pushl $81
  101e91:	6a 51                	push   $0x51
  jmp __alltraps
  101e93:	e9 0c fd ff ff       	jmp    101ba4 <__alltraps>

00101e98 <vector82>:
.globl vector82
vector82:
  pushl $0
  101e98:	6a 00                	push   $0x0
  pushl $82
  101e9a:	6a 52                	push   $0x52
  jmp __alltraps
  101e9c:	e9 03 fd ff ff       	jmp    101ba4 <__alltraps>

00101ea1 <vector83>:
.globl vector83
vector83:
  pushl $0
  101ea1:	6a 00                	push   $0x0
  pushl $83
  101ea3:	6a 53                	push   $0x53
  jmp __alltraps
  101ea5:	e9 fa fc ff ff       	jmp    101ba4 <__alltraps>

00101eaa <vector84>:
.globl vector84
vector84:
  pushl $0
  101eaa:	6a 00                	push   $0x0
  pushl $84
  101eac:	6a 54                	push   $0x54
  jmp __alltraps
  101eae:	e9 f1 fc ff ff       	jmp    101ba4 <__alltraps>

00101eb3 <vector85>:
.globl vector85
vector85:
  pushl $0
  101eb3:	6a 00                	push   $0x0
  pushl $85
  101eb5:	6a 55                	push   $0x55
  jmp __alltraps
  101eb7:	e9 e8 fc ff ff       	jmp    101ba4 <__alltraps>

00101ebc <vector86>:
.globl vector86
vector86:
  pushl $0
  101ebc:	6a 00                	push   $0x0
  pushl $86
  101ebe:	6a 56                	push   $0x56
  jmp __alltraps
  101ec0:	e9 df fc ff ff       	jmp    101ba4 <__alltraps>

00101ec5 <vector87>:
.globl vector87
vector87:
  pushl $0
  101ec5:	6a 00                	push   $0x0
  pushl $87
  101ec7:	6a 57                	push   $0x57
  jmp __alltraps
  101ec9:	e9 d6 fc ff ff       	jmp    101ba4 <__alltraps>

00101ece <vector88>:
.globl vector88
vector88:
  pushl $0
  101ece:	6a 00                	push   $0x0
  pushl $88
  101ed0:	6a 58                	push   $0x58
  jmp __alltraps
  101ed2:	e9 cd fc ff ff       	jmp    101ba4 <__alltraps>

00101ed7 <vector89>:
.globl vector89
vector89:
  pushl $0
  101ed7:	6a 00                	push   $0x0
  pushl $89
  101ed9:	6a 59                	push   $0x59
  jmp __alltraps
  101edb:	e9 c4 fc ff ff       	jmp    101ba4 <__alltraps>

00101ee0 <vector90>:
.globl vector90
vector90:
  pushl $0
  101ee0:	6a 00                	push   $0x0
  pushl $90
  101ee2:	6a 5a                	push   $0x5a
  jmp __alltraps
  101ee4:	e9 bb fc ff ff       	jmp    101ba4 <__alltraps>

00101ee9 <vector91>:
.globl vector91
vector91:
  pushl $0
  101ee9:	6a 00                	push   $0x0
  pushl $91
  101eeb:	6a 5b                	push   $0x5b
  jmp __alltraps
  101eed:	e9 b2 fc ff ff       	jmp    101ba4 <__alltraps>

00101ef2 <vector92>:
.globl vector92
vector92:
  pushl $0
  101ef2:	6a 00                	push   $0x0
  pushl $92
  101ef4:	6a 5c                	push   $0x5c
  jmp __alltraps
  101ef6:	e9 a9 fc ff ff       	jmp    101ba4 <__alltraps>

00101efb <vector93>:
.globl vector93
vector93:
  pushl $0
  101efb:	6a 00                	push   $0x0
  pushl $93
  101efd:	6a 5d                	push   $0x5d
  jmp __alltraps
  101eff:	e9 a0 fc ff ff       	jmp    101ba4 <__alltraps>

00101f04 <vector94>:
.globl vector94
vector94:
  pushl $0
  101f04:	6a 00                	push   $0x0
  pushl $94
  101f06:	6a 5e                	push   $0x5e
  jmp __alltraps
  101f08:	e9 97 fc ff ff       	jmp    101ba4 <__alltraps>

00101f0d <vector95>:
.globl vector95
vector95:
  pushl $0
  101f0d:	6a 00                	push   $0x0
  pushl $95
  101f0f:	6a 5f                	push   $0x5f
  jmp __alltraps
  101f11:	e9 8e fc ff ff       	jmp    101ba4 <__alltraps>

00101f16 <vector96>:
.globl vector96
vector96:
  pushl $0
  101f16:	6a 00                	push   $0x0
  pushl $96
  101f18:	6a 60                	push   $0x60
  jmp __alltraps
  101f1a:	e9 85 fc ff ff       	jmp    101ba4 <__alltraps>

00101f1f <vector97>:
.globl vector97
vector97:
  pushl $0
  101f1f:	6a 00                	push   $0x0
  pushl $97
  101f21:	6a 61                	push   $0x61
  jmp __alltraps
  101f23:	e9 7c fc ff ff       	jmp    101ba4 <__alltraps>

00101f28 <vector98>:
.globl vector98
vector98:
  pushl $0
  101f28:	6a 00                	push   $0x0
  pushl $98
  101f2a:	6a 62                	push   $0x62
  jmp __alltraps
  101f2c:	e9 73 fc ff ff       	jmp    101ba4 <__alltraps>

00101f31 <vector99>:
.globl vector99
vector99:
  pushl $0
  101f31:	6a 00                	push   $0x0
  pushl $99
  101f33:	6a 63                	push   $0x63
  jmp __alltraps
  101f35:	e9 6a fc ff ff       	jmp    101ba4 <__alltraps>

00101f3a <vector100>:
.globl vector100
vector100:
  pushl $0
  101f3a:	6a 00                	push   $0x0
  pushl $100
  101f3c:	6a 64                	push   $0x64
  jmp __alltraps
  101f3e:	e9 61 fc ff ff       	jmp    101ba4 <__alltraps>

00101f43 <vector101>:
.globl vector101
vector101:
  pushl $0
  101f43:	6a 00                	push   $0x0
  pushl $101
  101f45:	6a 65                	push   $0x65
  jmp __alltraps
  101f47:	e9 58 fc ff ff       	jmp    101ba4 <__alltraps>

00101f4c <vector102>:
.globl vector102
vector102:
  pushl $0
  101f4c:	6a 00                	push   $0x0
  pushl $102
  101f4e:	6a 66                	push   $0x66
  jmp __alltraps
  101f50:	e9 4f fc ff ff       	jmp    101ba4 <__alltraps>

00101f55 <vector103>:
.globl vector103
vector103:
  pushl $0
  101f55:	6a 00                	push   $0x0
  pushl $103
  101f57:	6a 67                	push   $0x67
  jmp __alltraps
  101f59:	e9 46 fc ff ff       	jmp    101ba4 <__alltraps>

00101f5e <vector104>:
.globl vector104
vector104:
  pushl $0
  101f5e:	6a 00                	push   $0x0
  pushl $104
  101f60:	6a 68                	push   $0x68
  jmp __alltraps
  101f62:	e9 3d fc ff ff       	jmp    101ba4 <__alltraps>

00101f67 <vector105>:
.globl vector105
vector105:
  pushl $0
  101f67:	6a 00                	push   $0x0
  pushl $105
  101f69:	6a 69                	push   $0x69
  jmp __alltraps
  101f6b:	e9 34 fc ff ff       	jmp    101ba4 <__alltraps>

00101f70 <vector106>:
.globl vector106
vector106:
  pushl $0
  101f70:	6a 00                	push   $0x0
  pushl $106
  101f72:	6a 6a                	push   $0x6a
  jmp __alltraps
  101f74:	e9 2b fc ff ff       	jmp    101ba4 <__alltraps>

00101f79 <vector107>:
.globl vector107
vector107:
  pushl $0
  101f79:	6a 00                	push   $0x0
  pushl $107
  101f7b:	6a 6b                	push   $0x6b
  jmp __alltraps
  101f7d:	e9 22 fc ff ff       	jmp    101ba4 <__alltraps>

00101f82 <vector108>:
.globl vector108
vector108:
  pushl $0
  101f82:	6a 00                	push   $0x0
  pushl $108
  101f84:	6a 6c                	push   $0x6c
  jmp __alltraps
  101f86:	e9 19 fc ff ff       	jmp    101ba4 <__alltraps>

00101f8b <vector109>:
.globl vector109
vector109:
  pushl $0
  101f8b:	6a 00                	push   $0x0
  pushl $109
  101f8d:	6a 6d                	push   $0x6d
  jmp __alltraps
  101f8f:	e9 10 fc ff ff       	jmp    101ba4 <__alltraps>

00101f94 <vector110>:
.globl vector110
vector110:
  pushl $0
  101f94:	6a 00                	push   $0x0
  pushl $110
  101f96:	6a 6e                	push   $0x6e
  jmp __alltraps
  101f98:	e9 07 fc ff ff       	jmp    101ba4 <__alltraps>

00101f9d <vector111>:
.globl vector111
vector111:
  pushl $0
  101f9d:	6a 00                	push   $0x0
  pushl $111
  101f9f:	6a 6f                	push   $0x6f
  jmp __alltraps
  101fa1:	e9 fe fb ff ff       	jmp    101ba4 <__alltraps>

00101fa6 <vector112>:
.globl vector112
vector112:
  pushl $0
  101fa6:	6a 00                	push   $0x0
  pushl $112
  101fa8:	6a 70                	push   $0x70
  jmp __alltraps
  101faa:	e9 f5 fb ff ff       	jmp    101ba4 <__alltraps>

00101faf <vector113>:
.globl vector113
vector113:
  pushl $0
  101faf:	6a 00                	push   $0x0
  pushl $113
  101fb1:	6a 71                	push   $0x71
  jmp __alltraps
  101fb3:	e9 ec fb ff ff       	jmp    101ba4 <__alltraps>

00101fb8 <vector114>:
.globl vector114
vector114:
  pushl $0
  101fb8:	6a 00                	push   $0x0
  pushl $114
  101fba:	6a 72                	push   $0x72
  jmp __alltraps
  101fbc:	e9 e3 fb ff ff       	jmp    101ba4 <__alltraps>

00101fc1 <vector115>:
.globl vector115
vector115:
  pushl $0
  101fc1:	6a 00                	push   $0x0
  pushl $115
  101fc3:	6a 73                	push   $0x73
  jmp __alltraps
  101fc5:	e9 da fb ff ff       	jmp    101ba4 <__alltraps>

00101fca <vector116>:
.globl vector116
vector116:
  pushl $0
  101fca:	6a 00                	push   $0x0
  pushl $116
  101fcc:	6a 74                	push   $0x74
  jmp __alltraps
  101fce:	e9 d1 fb ff ff       	jmp    101ba4 <__alltraps>

00101fd3 <vector117>:
.globl vector117
vector117:
  pushl $0
  101fd3:	6a 00                	push   $0x0
  pushl $117
  101fd5:	6a 75                	push   $0x75
  jmp __alltraps
  101fd7:	e9 c8 fb ff ff       	jmp    101ba4 <__alltraps>

00101fdc <vector118>:
.globl vector118
vector118:
  pushl $0
  101fdc:	6a 00                	push   $0x0
  pushl $118
  101fde:	6a 76                	push   $0x76
  jmp __alltraps
  101fe0:	e9 bf fb ff ff       	jmp    101ba4 <__alltraps>

00101fe5 <vector119>:
.globl vector119
vector119:
  pushl $0
  101fe5:	6a 00                	push   $0x0
  pushl $119
  101fe7:	6a 77                	push   $0x77
  jmp __alltraps
  101fe9:	e9 b6 fb ff ff       	jmp    101ba4 <__alltraps>

00101fee <vector120>:
.globl vector120
vector120:
  pushl $0
  101fee:	6a 00                	push   $0x0
  pushl $120
  101ff0:	6a 78                	push   $0x78
  jmp __alltraps
  101ff2:	e9 ad fb ff ff       	jmp    101ba4 <__alltraps>

00101ff7 <vector121>:
.globl vector121
vector121:
  pushl $0
  101ff7:	6a 00                	push   $0x0
  pushl $121
  101ff9:	6a 79                	push   $0x79
  jmp __alltraps
  101ffb:	e9 a4 fb ff ff       	jmp    101ba4 <__alltraps>

00102000 <vector122>:
.globl vector122
vector122:
  pushl $0
  102000:	6a 00                	push   $0x0
  pushl $122
  102002:	6a 7a                	push   $0x7a
  jmp __alltraps
  102004:	e9 9b fb ff ff       	jmp    101ba4 <__alltraps>

00102009 <vector123>:
.globl vector123
vector123:
  pushl $0
  102009:	6a 00                	push   $0x0
  pushl $123
  10200b:	6a 7b                	push   $0x7b
  jmp __alltraps
  10200d:	e9 92 fb ff ff       	jmp    101ba4 <__alltraps>

00102012 <vector124>:
.globl vector124
vector124:
  pushl $0
  102012:	6a 00                	push   $0x0
  pushl $124
  102014:	6a 7c                	push   $0x7c
  jmp __alltraps
  102016:	e9 89 fb ff ff       	jmp    101ba4 <__alltraps>

0010201b <vector125>:
.globl vector125
vector125:
  pushl $0
  10201b:	6a 00                	push   $0x0
  pushl $125
  10201d:	6a 7d                	push   $0x7d
  jmp __alltraps
  10201f:	e9 80 fb ff ff       	jmp    101ba4 <__alltraps>

00102024 <vector126>:
.globl vector126
vector126:
  pushl $0
  102024:	6a 00                	push   $0x0
  pushl $126
  102026:	6a 7e                	push   $0x7e
  jmp __alltraps
  102028:	e9 77 fb ff ff       	jmp    101ba4 <__alltraps>

0010202d <vector127>:
.globl vector127
vector127:
  pushl $0
  10202d:	6a 00                	push   $0x0
  pushl $127
  10202f:	6a 7f                	push   $0x7f
  jmp __alltraps
  102031:	e9 6e fb ff ff       	jmp    101ba4 <__alltraps>

00102036 <vector128>:
.globl vector128
vector128:
  pushl $0
  102036:	6a 00                	push   $0x0
  pushl $128
  102038:	68 80 00 00 00       	push   $0x80
  jmp __alltraps
  10203d:	e9 62 fb ff ff       	jmp    101ba4 <__alltraps>

00102042 <vector129>:
.globl vector129
vector129:
  pushl $0
  102042:	6a 00                	push   $0x0
  pushl $129
  102044:	68 81 00 00 00       	push   $0x81
  jmp __alltraps
  102049:	e9 56 fb ff ff       	jmp    101ba4 <__alltraps>

0010204e <vector130>:
.globl vector130
vector130:
  pushl $0
  10204e:	6a 00                	push   $0x0
  pushl $130
  102050:	68 82 00 00 00       	push   $0x82
  jmp __alltraps
  102055:	e9 4a fb ff ff       	jmp    101ba4 <__alltraps>

0010205a <vector131>:
.globl vector131
vector131:
  pushl $0
  10205a:	6a 00                	push   $0x0
  pushl $131
  10205c:	68 83 00 00 00       	push   $0x83
  jmp __alltraps
  102061:	e9 3e fb ff ff       	jmp    101ba4 <__alltraps>

00102066 <vector132>:
.globl vector132
vector132:
  pushl $0
  102066:	6a 00                	push   $0x0
  pushl $132
  102068:	68 84 00 00 00       	push   $0x84
  jmp __alltraps
  10206d:	e9 32 fb ff ff       	jmp    101ba4 <__alltraps>

00102072 <vector133>:
.globl vector133
vector133:
  pushl $0
  102072:	6a 00                	push   $0x0
  pushl $133
  102074:	68 85 00 00 00       	push   $0x85
  jmp __alltraps
  102079:	e9 26 fb ff ff       	jmp    101ba4 <__alltraps>

0010207e <vector134>:
.globl vector134
vector134:
  pushl $0
  10207e:	6a 00                	push   $0x0
  pushl $134
  102080:	68 86 00 00 00       	push   $0x86
  jmp __alltraps
  102085:	e9 1a fb ff ff       	jmp    101ba4 <__alltraps>

0010208a <vector135>:
.globl vector135
vector135:
  pushl $0
  10208a:	6a 00                	push   $0x0
  pushl $135
  10208c:	68 87 00 00 00       	push   $0x87
  jmp __alltraps
  102091:	e9 0e fb ff ff       	jmp    101ba4 <__alltraps>

00102096 <vector136>:
.globl vector136
vector136:
  pushl $0
  102096:	6a 00                	push   $0x0
  pushl $136
  102098:	68 88 00 00 00       	push   $0x88
  jmp __alltraps
  10209d:	e9 02 fb ff ff       	jmp    101ba4 <__alltraps>

001020a2 <vector137>:
.globl vector137
vector137:
  pushl $0
  1020a2:	6a 00                	push   $0x0
  pushl $137
  1020a4:	68 89 00 00 00       	push   $0x89
  jmp __alltraps
  1020a9:	e9 f6 fa ff ff       	jmp    101ba4 <__alltraps>

001020ae <vector138>:
.globl vector138
vector138:
  pushl $0
  1020ae:	6a 00                	push   $0x0
  pushl $138
  1020b0:	68 8a 00 00 00       	push   $0x8a
  jmp __alltraps
  1020b5:	e9 ea fa ff ff       	jmp    101ba4 <__alltraps>

001020ba <vector139>:
.globl vector139
vector139:
  pushl $0
  1020ba:	6a 00                	push   $0x0
  pushl $139
  1020bc:	68 8b 00 00 00       	push   $0x8b
  jmp __alltraps
  1020c1:	e9 de fa ff ff       	jmp    101ba4 <__alltraps>

001020c6 <vector140>:
.globl vector140
vector140:
  pushl $0
  1020c6:	6a 00                	push   $0x0
  pushl $140
  1020c8:	68 8c 00 00 00       	push   $0x8c
  jmp __alltraps
  1020cd:	e9 d2 fa ff ff       	jmp    101ba4 <__alltraps>

001020d2 <vector141>:
.globl vector141
vector141:
  pushl $0
  1020d2:	6a 00                	push   $0x0
  pushl $141
  1020d4:	68 8d 00 00 00       	push   $0x8d
  jmp __alltraps
  1020d9:	e9 c6 fa ff ff       	jmp    101ba4 <__alltraps>

001020de <vector142>:
.globl vector142
vector142:
  pushl $0
  1020de:	6a 00                	push   $0x0
  pushl $142
  1020e0:	68 8e 00 00 00       	push   $0x8e
  jmp __alltraps
  1020e5:	e9 ba fa ff ff       	jmp    101ba4 <__alltraps>

001020ea <vector143>:
.globl vector143
vector143:
  pushl $0
  1020ea:	6a 00                	push   $0x0
  pushl $143
  1020ec:	68 8f 00 00 00       	push   $0x8f
  jmp __alltraps
  1020f1:	e9 ae fa ff ff       	jmp    101ba4 <__alltraps>

001020f6 <vector144>:
.globl vector144
vector144:
  pushl $0
  1020f6:	6a 00                	push   $0x0
  pushl $144
  1020f8:	68 90 00 00 00       	push   $0x90
  jmp __alltraps
  1020fd:	e9 a2 fa ff ff       	jmp    101ba4 <__alltraps>

00102102 <vector145>:
.globl vector145
vector145:
  pushl $0
  102102:	6a 00                	push   $0x0
  pushl $145
  102104:	68 91 00 00 00       	push   $0x91
  jmp __alltraps
  102109:	e9 96 fa ff ff       	jmp    101ba4 <__alltraps>

0010210e <vector146>:
.globl vector146
vector146:
  pushl $0
  10210e:	6a 00                	push   $0x0
  pushl $146
  102110:	68 92 00 00 00       	push   $0x92
  jmp __alltraps
  102115:	e9 8a fa ff ff       	jmp    101ba4 <__alltraps>

0010211a <vector147>:
.globl vector147
vector147:
  pushl $0
  10211a:	6a 00                	push   $0x0
  pushl $147
  10211c:	68 93 00 00 00       	push   $0x93
  jmp __alltraps
  102121:	e9 7e fa ff ff       	jmp    101ba4 <__alltraps>

00102126 <vector148>:
.globl vector148
vector148:
  pushl $0
  102126:	6a 00                	push   $0x0
  pushl $148
  102128:	68 94 00 00 00       	push   $0x94
  jmp __alltraps
  10212d:	e9 72 fa ff ff       	jmp    101ba4 <__alltraps>

00102132 <vector149>:
.globl vector149
vector149:
  pushl $0
  102132:	6a 00                	push   $0x0
  pushl $149
  102134:	68 95 00 00 00       	push   $0x95
  jmp __alltraps
  102139:	e9 66 fa ff ff       	jmp    101ba4 <__alltraps>

0010213e <vector150>:
.globl vector150
vector150:
  pushl $0
  10213e:	6a 00                	push   $0x0
  pushl $150
  102140:	68 96 00 00 00       	push   $0x96
  jmp __alltraps
  102145:	e9 5a fa ff ff       	jmp    101ba4 <__alltraps>

0010214a <vector151>:
.globl vector151
vector151:
  pushl $0
  10214a:	6a 00                	push   $0x0
  pushl $151
  10214c:	68 97 00 00 00       	push   $0x97
  jmp __alltraps
  102151:	e9 4e fa ff ff       	jmp    101ba4 <__alltraps>

00102156 <vector152>:
.globl vector152
vector152:
  pushl $0
  102156:	6a 00                	push   $0x0
  pushl $152
  102158:	68 98 00 00 00       	push   $0x98
  jmp __alltraps
  10215d:	e9 42 fa ff ff       	jmp    101ba4 <__alltraps>

00102162 <vector153>:
.globl vector153
vector153:
  pushl $0
  102162:	6a 00                	push   $0x0
  pushl $153
  102164:	68 99 00 00 00       	push   $0x99
  jmp __alltraps
  102169:	e9 36 fa ff ff       	jmp    101ba4 <__alltraps>

0010216e <vector154>:
.globl vector154
vector154:
  pushl $0
  10216e:	6a 00                	push   $0x0
  pushl $154
  102170:	68 9a 00 00 00       	push   $0x9a
  jmp __alltraps
  102175:	e9 2a fa ff ff       	jmp    101ba4 <__alltraps>

0010217a <vector155>:
.globl vector155
vector155:
  pushl $0
  10217a:	6a 00                	push   $0x0
  pushl $155
  10217c:	68 9b 00 00 00       	push   $0x9b
  jmp __alltraps
  102181:	e9 1e fa ff ff       	jmp    101ba4 <__alltraps>

00102186 <vector156>:
.globl vector156
vector156:
  pushl $0
  102186:	6a 00                	push   $0x0
  pushl $156
  102188:	68 9c 00 00 00       	push   $0x9c
  jmp __alltraps
  10218d:	e9 12 fa ff ff       	jmp    101ba4 <__alltraps>

00102192 <vector157>:
.globl vector157
vector157:
  pushl $0
  102192:	6a 00                	push   $0x0
  pushl $157
  102194:	68 9d 00 00 00       	push   $0x9d
  jmp __alltraps
  102199:	e9 06 fa ff ff       	jmp    101ba4 <__alltraps>

0010219e <vector158>:
.globl vector158
vector158:
  pushl $0
  10219e:	6a 00                	push   $0x0
  pushl $158
  1021a0:	68 9e 00 00 00       	push   $0x9e
  jmp __alltraps
  1021a5:	e9 fa f9 ff ff       	jmp    101ba4 <__alltraps>

001021aa <vector159>:
.globl vector159
vector159:
  pushl $0
  1021aa:	6a 00                	push   $0x0
  pushl $159
  1021ac:	68 9f 00 00 00       	push   $0x9f
  jmp __alltraps
  1021b1:	e9 ee f9 ff ff       	jmp    101ba4 <__alltraps>

001021b6 <vector160>:
.globl vector160
vector160:
  pushl $0
  1021b6:	6a 00                	push   $0x0
  pushl $160
  1021b8:	68 a0 00 00 00       	push   $0xa0
  jmp __alltraps
  1021bd:	e9 e2 f9 ff ff       	jmp    101ba4 <__alltraps>

001021c2 <vector161>:
.globl vector161
vector161:
  pushl $0
  1021c2:	6a 00                	push   $0x0
  pushl $161
  1021c4:	68 a1 00 00 00       	push   $0xa1
  jmp __alltraps
  1021c9:	e9 d6 f9 ff ff       	jmp    101ba4 <__alltraps>

001021ce <vector162>:
.globl vector162
vector162:
  pushl $0
  1021ce:	6a 00                	push   $0x0
  pushl $162
  1021d0:	68 a2 00 00 00       	push   $0xa2
  jmp __alltraps
  1021d5:	e9 ca f9 ff ff       	jmp    101ba4 <__alltraps>

001021da <vector163>:
.globl vector163
vector163:
  pushl $0
  1021da:	6a 00                	push   $0x0
  pushl $163
  1021dc:	68 a3 00 00 00       	push   $0xa3
  jmp __alltraps
  1021e1:	e9 be f9 ff ff       	jmp    101ba4 <__alltraps>

001021e6 <vector164>:
.globl vector164
vector164:
  pushl $0
  1021e6:	6a 00                	push   $0x0
  pushl $164
  1021e8:	68 a4 00 00 00       	push   $0xa4
  jmp __alltraps
  1021ed:	e9 b2 f9 ff ff       	jmp    101ba4 <__alltraps>

001021f2 <vector165>:
.globl vector165
vector165:
  pushl $0
  1021f2:	6a 00                	push   $0x0
  pushl $165
  1021f4:	68 a5 00 00 00       	push   $0xa5
  jmp __alltraps
  1021f9:	e9 a6 f9 ff ff       	jmp    101ba4 <__alltraps>

001021fe <vector166>:
.globl vector166
vector166:
  pushl $0
  1021fe:	6a 00                	push   $0x0
  pushl $166
  102200:	68 a6 00 00 00       	push   $0xa6
  jmp __alltraps
  102205:	e9 9a f9 ff ff       	jmp    101ba4 <__alltraps>

0010220a <vector167>:
.globl vector167
vector167:
  pushl $0
  10220a:	6a 00                	push   $0x0
  pushl $167
  10220c:	68 a7 00 00 00       	push   $0xa7
  jmp __alltraps
  102211:	e9 8e f9 ff ff       	jmp    101ba4 <__alltraps>

00102216 <vector168>:
.globl vector168
vector168:
  pushl $0
  102216:	6a 00                	push   $0x0
  pushl $168
  102218:	68 a8 00 00 00       	push   $0xa8
  jmp __alltraps
  10221d:	e9 82 f9 ff ff       	jmp    101ba4 <__alltraps>

00102222 <vector169>:
.globl vector169
vector169:
  pushl $0
  102222:	6a 00                	push   $0x0
  pushl $169
  102224:	68 a9 00 00 00       	push   $0xa9
  jmp __alltraps
  102229:	e9 76 f9 ff ff       	jmp    101ba4 <__alltraps>

0010222e <vector170>:
.globl vector170
vector170:
  pushl $0
  10222e:	6a 00                	push   $0x0
  pushl $170
  102230:	68 aa 00 00 00       	push   $0xaa
  jmp __alltraps
  102235:	e9 6a f9 ff ff       	jmp    101ba4 <__alltraps>

0010223a <vector171>:
.globl vector171
vector171:
  pushl $0
  10223a:	6a 00                	push   $0x0
  pushl $171
  10223c:	68 ab 00 00 00       	push   $0xab
  jmp __alltraps
  102241:	e9 5e f9 ff ff       	jmp    101ba4 <__alltraps>

00102246 <vector172>:
.globl vector172
vector172:
  pushl $0
  102246:	6a 00                	push   $0x0
  pushl $172
  102248:	68 ac 00 00 00       	push   $0xac
  jmp __alltraps
  10224d:	e9 52 f9 ff ff       	jmp    101ba4 <__alltraps>

00102252 <vector173>:
.globl vector173
vector173:
  pushl $0
  102252:	6a 00                	push   $0x0
  pushl $173
  102254:	68 ad 00 00 00       	push   $0xad
  jmp __alltraps
  102259:	e9 46 f9 ff ff       	jmp    101ba4 <__alltraps>

0010225e <vector174>:
.globl vector174
vector174:
  pushl $0
  10225e:	6a 00                	push   $0x0
  pushl $174
  102260:	68 ae 00 00 00       	push   $0xae
  jmp __alltraps
  102265:	e9 3a f9 ff ff       	jmp    101ba4 <__alltraps>

0010226a <vector175>:
.globl vector175
vector175:
  pushl $0
  10226a:	6a 00                	push   $0x0
  pushl $175
  10226c:	68 af 00 00 00       	push   $0xaf
  jmp __alltraps
  102271:	e9 2e f9 ff ff       	jmp    101ba4 <__alltraps>

00102276 <vector176>:
.globl vector176
vector176:
  pushl $0
  102276:	6a 00                	push   $0x0
  pushl $176
  102278:	68 b0 00 00 00       	push   $0xb0
  jmp __alltraps
  10227d:	e9 22 f9 ff ff       	jmp    101ba4 <__alltraps>

00102282 <vector177>:
.globl vector177
vector177:
  pushl $0
  102282:	6a 00                	push   $0x0
  pushl $177
  102284:	68 b1 00 00 00       	push   $0xb1
  jmp __alltraps
  102289:	e9 16 f9 ff ff       	jmp    101ba4 <__alltraps>

0010228e <vector178>:
.globl vector178
vector178:
  pushl $0
  10228e:	6a 00                	push   $0x0
  pushl $178
  102290:	68 b2 00 00 00       	push   $0xb2
  jmp __alltraps
  102295:	e9 0a f9 ff ff       	jmp    101ba4 <__alltraps>

0010229a <vector179>:
.globl vector179
vector179:
  pushl $0
  10229a:	6a 00                	push   $0x0
  pushl $179
  10229c:	68 b3 00 00 00       	push   $0xb3
  jmp __alltraps
  1022a1:	e9 fe f8 ff ff       	jmp    101ba4 <__alltraps>

001022a6 <vector180>:
.globl vector180
vector180:
  pushl $0
  1022a6:	6a 00                	push   $0x0
  pushl $180
  1022a8:	68 b4 00 00 00       	push   $0xb4
  jmp __alltraps
  1022ad:	e9 f2 f8 ff ff       	jmp    101ba4 <__alltraps>

001022b2 <vector181>:
.globl vector181
vector181:
  pushl $0
  1022b2:	6a 00                	push   $0x0
  pushl $181
  1022b4:	68 b5 00 00 00       	push   $0xb5
  jmp __alltraps
  1022b9:	e9 e6 f8 ff ff       	jmp    101ba4 <__alltraps>

001022be <vector182>:
.globl vector182
vector182:
  pushl $0
  1022be:	6a 00                	push   $0x0
  pushl $182
  1022c0:	68 b6 00 00 00       	push   $0xb6
  jmp __alltraps
  1022c5:	e9 da f8 ff ff       	jmp    101ba4 <__alltraps>

001022ca <vector183>:
.globl vector183
vector183:
  pushl $0
  1022ca:	6a 00                	push   $0x0
  pushl $183
  1022cc:	68 b7 00 00 00       	push   $0xb7
  jmp __alltraps
  1022d1:	e9 ce f8 ff ff       	jmp    101ba4 <__alltraps>

001022d6 <vector184>:
.globl vector184
vector184:
  pushl $0
  1022d6:	6a 00                	push   $0x0
  pushl $184
  1022d8:	68 b8 00 00 00       	push   $0xb8
  jmp __alltraps
  1022dd:	e9 c2 f8 ff ff       	jmp    101ba4 <__alltraps>

001022e2 <vector185>:
.globl vector185
vector185:
  pushl $0
  1022e2:	6a 00                	push   $0x0
  pushl $185
  1022e4:	68 b9 00 00 00       	push   $0xb9
  jmp __alltraps
  1022e9:	e9 b6 f8 ff ff       	jmp    101ba4 <__alltraps>

001022ee <vector186>:
.globl vector186
vector186:
  pushl $0
  1022ee:	6a 00                	push   $0x0
  pushl $186
  1022f0:	68 ba 00 00 00       	push   $0xba
  jmp __alltraps
  1022f5:	e9 aa f8 ff ff       	jmp    101ba4 <__alltraps>

001022fa <vector187>:
.globl vector187
vector187:
  pushl $0
  1022fa:	6a 00                	push   $0x0
  pushl $187
  1022fc:	68 bb 00 00 00       	push   $0xbb
  jmp __alltraps
  102301:	e9 9e f8 ff ff       	jmp    101ba4 <__alltraps>

00102306 <vector188>:
.globl vector188
vector188:
  pushl $0
  102306:	6a 00                	push   $0x0
  pushl $188
  102308:	68 bc 00 00 00       	push   $0xbc
  jmp __alltraps
  10230d:	e9 92 f8 ff ff       	jmp    101ba4 <__alltraps>

00102312 <vector189>:
.globl vector189
vector189:
  pushl $0
  102312:	6a 00                	push   $0x0
  pushl $189
  102314:	68 bd 00 00 00       	push   $0xbd
  jmp __alltraps
  102319:	e9 86 f8 ff ff       	jmp    101ba4 <__alltraps>

0010231e <vector190>:
.globl vector190
vector190:
  pushl $0
  10231e:	6a 00                	push   $0x0
  pushl $190
  102320:	68 be 00 00 00       	push   $0xbe
  jmp __alltraps
  102325:	e9 7a f8 ff ff       	jmp    101ba4 <__alltraps>

0010232a <vector191>:
.globl vector191
vector191:
  pushl $0
  10232a:	6a 00                	push   $0x0
  pushl $191
  10232c:	68 bf 00 00 00       	push   $0xbf
  jmp __alltraps
  102331:	e9 6e f8 ff ff       	jmp    101ba4 <__alltraps>

00102336 <vector192>:
.globl vector192
vector192:
  pushl $0
  102336:	6a 00                	push   $0x0
  pushl $192
  102338:	68 c0 00 00 00       	push   $0xc0
  jmp __alltraps
  10233d:	e9 62 f8 ff ff       	jmp    101ba4 <__alltraps>

00102342 <vector193>:
.globl vector193
vector193:
  pushl $0
  102342:	6a 00                	push   $0x0
  pushl $193
  102344:	68 c1 00 00 00       	push   $0xc1
  jmp __alltraps
  102349:	e9 56 f8 ff ff       	jmp    101ba4 <__alltraps>

0010234e <vector194>:
.globl vector194
vector194:
  pushl $0
  10234e:	6a 00                	push   $0x0
  pushl $194
  102350:	68 c2 00 00 00       	push   $0xc2
  jmp __alltraps
  102355:	e9 4a f8 ff ff       	jmp    101ba4 <__alltraps>

0010235a <vector195>:
.globl vector195
vector195:
  pushl $0
  10235a:	6a 00                	push   $0x0
  pushl $195
  10235c:	68 c3 00 00 00       	push   $0xc3
  jmp __alltraps
  102361:	e9 3e f8 ff ff       	jmp    101ba4 <__alltraps>

00102366 <vector196>:
.globl vector196
vector196:
  pushl $0
  102366:	6a 00                	push   $0x0
  pushl $196
  102368:	68 c4 00 00 00       	push   $0xc4
  jmp __alltraps
  10236d:	e9 32 f8 ff ff       	jmp    101ba4 <__alltraps>

00102372 <vector197>:
.globl vector197
vector197:
  pushl $0
  102372:	6a 00                	push   $0x0
  pushl $197
  102374:	68 c5 00 00 00       	push   $0xc5
  jmp __alltraps
  102379:	e9 26 f8 ff ff       	jmp    101ba4 <__alltraps>

0010237e <vector198>:
.globl vector198
vector198:
  pushl $0
  10237e:	6a 00                	push   $0x0
  pushl $198
  102380:	68 c6 00 00 00       	push   $0xc6
  jmp __alltraps
  102385:	e9 1a f8 ff ff       	jmp    101ba4 <__alltraps>

0010238a <vector199>:
.globl vector199
vector199:
  pushl $0
  10238a:	6a 00                	push   $0x0
  pushl $199
  10238c:	68 c7 00 00 00       	push   $0xc7
  jmp __alltraps
  102391:	e9 0e f8 ff ff       	jmp    101ba4 <__alltraps>

00102396 <vector200>:
.globl vector200
vector200:
  pushl $0
  102396:	6a 00                	push   $0x0
  pushl $200
  102398:	68 c8 00 00 00       	push   $0xc8
  jmp __alltraps
  10239d:	e9 02 f8 ff ff       	jmp    101ba4 <__alltraps>

001023a2 <vector201>:
.globl vector201
vector201:
  pushl $0
  1023a2:	6a 00                	push   $0x0
  pushl $201
  1023a4:	68 c9 00 00 00       	push   $0xc9
  jmp __alltraps
  1023a9:	e9 f6 f7 ff ff       	jmp    101ba4 <__alltraps>

001023ae <vector202>:
.globl vector202
vector202:
  pushl $0
  1023ae:	6a 00                	push   $0x0
  pushl $202
  1023b0:	68 ca 00 00 00       	push   $0xca
  jmp __alltraps
  1023b5:	e9 ea f7 ff ff       	jmp    101ba4 <__alltraps>

001023ba <vector203>:
.globl vector203
vector203:
  pushl $0
  1023ba:	6a 00                	push   $0x0
  pushl $203
  1023bc:	68 cb 00 00 00       	push   $0xcb
  jmp __alltraps
  1023c1:	e9 de f7 ff ff       	jmp    101ba4 <__alltraps>

001023c6 <vector204>:
.globl vector204
vector204:
  pushl $0
  1023c6:	6a 00                	push   $0x0
  pushl $204
  1023c8:	68 cc 00 00 00       	push   $0xcc
  jmp __alltraps
  1023cd:	e9 d2 f7 ff ff       	jmp    101ba4 <__alltraps>

001023d2 <vector205>:
.globl vector205
vector205:
  pushl $0
  1023d2:	6a 00                	push   $0x0
  pushl $205
  1023d4:	68 cd 00 00 00       	push   $0xcd
  jmp __alltraps
  1023d9:	e9 c6 f7 ff ff       	jmp    101ba4 <__alltraps>

001023de <vector206>:
.globl vector206
vector206:
  pushl $0
  1023de:	6a 00                	push   $0x0
  pushl $206
  1023e0:	68 ce 00 00 00       	push   $0xce
  jmp __alltraps
  1023e5:	e9 ba f7 ff ff       	jmp    101ba4 <__alltraps>

001023ea <vector207>:
.globl vector207
vector207:
  pushl $0
  1023ea:	6a 00                	push   $0x0
  pushl $207
  1023ec:	68 cf 00 00 00       	push   $0xcf
  jmp __alltraps
  1023f1:	e9 ae f7 ff ff       	jmp    101ba4 <__alltraps>

001023f6 <vector208>:
.globl vector208
vector208:
  pushl $0
  1023f6:	6a 00                	push   $0x0
  pushl $208
  1023f8:	68 d0 00 00 00       	push   $0xd0
  jmp __alltraps
  1023fd:	e9 a2 f7 ff ff       	jmp    101ba4 <__alltraps>

00102402 <vector209>:
.globl vector209
vector209:
  pushl $0
  102402:	6a 00                	push   $0x0
  pushl $209
  102404:	68 d1 00 00 00       	push   $0xd1
  jmp __alltraps
  102409:	e9 96 f7 ff ff       	jmp    101ba4 <__alltraps>

0010240e <vector210>:
.globl vector210
vector210:
  pushl $0
  10240e:	6a 00                	push   $0x0
  pushl $210
  102410:	68 d2 00 00 00       	push   $0xd2
  jmp __alltraps
  102415:	e9 8a f7 ff ff       	jmp    101ba4 <__alltraps>

0010241a <vector211>:
.globl vector211
vector211:
  pushl $0
  10241a:	6a 00                	push   $0x0
  pushl $211
  10241c:	68 d3 00 00 00       	push   $0xd3
  jmp __alltraps
  102421:	e9 7e f7 ff ff       	jmp    101ba4 <__alltraps>

00102426 <vector212>:
.globl vector212
vector212:
  pushl $0
  102426:	6a 00                	push   $0x0
  pushl $212
  102428:	68 d4 00 00 00       	push   $0xd4
  jmp __alltraps
  10242d:	e9 72 f7 ff ff       	jmp    101ba4 <__alltraps>

00102432 <vector213>:
.globl vector213
vector213:
  pushl $0
  102432:	6a 00                	push   $0x0
  pushl $213
  102434:	68 d5 00 00 00       	push   $0xd5
  jmp __alltraps
  102439:	e9 66 f7 ff ff       	jmp    101ba4 <__alltraps>

0010243e <vector214>:
.globl vector214
vector214:
  pushl $0
  10243e:	6a 00                	push   $0x0
  pushl $214
  102440:	68 d6 00 00 00       	push   $0xd6
  jmp __alltraps
  102445:	e9 5a f7 ff ff       	jmp    101ba4 <__alltraps>

0010244a <vector215>:
.globl vector215
vector215:
  pushl $0
  10244a:	6a 00                	push   $0x0
  pushl $215
  10244c:	68 d7 00 00 00       	push   $0xd7
  jmp __alltraps
  102451:	e9 4e f7 ff ff       	jmp    101ba4 <__alltraps>

00102456 <vector216>:
.globl vector216
vector216:
  pushl $0
  102456:	6a 00                	push   $0x0
  pushl $216
  102458:	68 d8 00 00 00       	push   $0xd8
  jmp __alltraps
  10245d:	e9 42 f7 ff ff       	jmp    101ba4 <__alltraps>

00102462 <vector217>:
.globl vector217
vector217:
  pushl $0
  102462:	6a 00                	push   $0x0
  pushl $217
  102464:	68 d9 00 00 00       	push   $0xd9
  jmp __alltraps
  102469:	e9 36 f7 ff ff       	jmp    101ba4 <__alltraps>

0010246e <vector218>:
.globl vector218
vector218:
  pushl $0
  10246e:	6a 00                	push   $0x0
  pushl $218
  102470:	68 da 00 00 00       	push   $0xda
  jmp __alltraps
  102475:	e9 2a f7 ff ff       	jmp    101ba4 <__alltraps>

0010247a <vector219>:
.globl vector219
vector219:
  pushl $0
  10247a:	6a 00                	push   $0x0
  pushl $219
  10247c:	68 db 00 00 00       	push   $0xdb
  jmp __alltraps
  102481:	e9 1e f7 ff ff       	jmp    101ba4 <__alltraps>

00102486 <vector220>:
.globl vector220
vector220:
  pushl $0
  102486:	6a 00                	push   $0x0
  pushl $220
  102488:	68 dc 00 00 00       	push   $0xdc
  jmp __alltraps
  10248d:	e9 12 f7 ff ff       	jmp    101ba4 <__alltraps>

00102492 <vector221>:
.globl vector221
vector221:
  pushl $0
  102492:	6a 00                	push   $0x0
  pushl $221
  102494:	68 dd 00 00 00       	push   $0xdd
  jmp __alltraps
  102499:	e9 06 f7 ff ff       	jmp    101ba4 <__alltraps>

0010249e <vector222>:
.globl vector222
vector222:
  pushl $0
  10249e:	6a 00                	push   $0x0
  pushl $222
  1024a0:	68 de 00 00 00       	push   $0xde
  jmp __alltraps
  1024a5:	e9 fa f6 ff ff       	jmp    101ba4 <__alltraps>

001024aa <vector223>:
.globl vector223
vector223:
  pushl $0
  1024aa:	6a 00                	push   $0x0
  pushl $223
  1024ac:	68 df 00 00 00       	push   $0xdf
  jmp __alltraps
  1024b1:	e9 ee f6 ff ff       	jmp    101ba4 <__alltraps>

001024b6 <vector224>:
.globl vector224
vector224:
  pushl $0
  1024b6:	6a 00                	push   $0x0
  pushl $224
  1024b8:	68 e0 00 00 00       	push   $0xe0
  jmp __alltraps
  1024bd:	e9 e2 f6 ff ff       	jmp    101ba4 <__alltraps>

001024c2 <vector225>:
.globl vector225
vector225:
  pushl $0
  1024c2:	6a 00                	push   $0x0
  pushl $225
  1024c4:	68 e1 00 00 00       	push   $0xe1
  jmp __alltraps
  1024c9:	e9 d6 f6 ff ff       	jmp    101ba4 <__alltraps>

001024ce <vector226>:
.globl vector226
vector226:
  pushl $0
  1024ce:	6a 00                	push   $0x0
  pushl $226
  1024d0:	68 e2 00 00 00       	push   $0xe2
  jmp __alltraps
  1024d5:	e9 ca f6 ff ff       	jmp    101ba4 <__alltraps>

001024da <vector227>:
.globl vector227
vector227:
  pushl $0
  1024da:	6a 00                	push   $0x0
  pushl $227
  1024dc:	68 e3 00 00 00       	push   $0xe3
  jmp __alltraps
  1024e1:	e9 be f6 ff ff       	jmp    101ba4 <__alltraps>

001024e6 <vector228>:
.globl vector228
vector228:
  pushl $0
  1024e6:	6a 00                	push   $0x0
  pushl $228
  1024e8:	68 e4 00 00 00       	push   $0xe4
  jmp __alltraps
  1024ed:	e9 b2 f6 ff ff       	jmp    101ba4 <__alltraps>

001024f2 <vector229>:
.globl vector229
vector229:
  pushl $0
  1024f2:	6a 00                	push   $0x0
  pushl $229
  1024f4:	68 e5 00 00 00       	push   $0xe5
  jmp __alltraps
  1024f9:	e9 a6 f6 ff ff       	jmp    101ba4 <__alltraps>

001024fe <vector230>:
.globl vector230
vector230:
  pushl $0
  1024fe:	6a 00                	push   $0x0
  pushl $230
  102500:	68 e6 00 00 00       	push   $0xe6
  jmp __alltraps
  102505:	e9 9a f6 ff ff       	jmp    101ba4 <__alltraps>

0010250a <vector231>:
.globl vector231
vector231:
  pushl $0
  10250a:	6a 00                	push   $0x0
  pushl $231
  10250c:	68 e7 00 00 00       	push   $0xe7
  jmp __alltraps
  102511:	e9 8e f6 ff ff       	jmp    101ba4 <__alltraps>

00102516 <vector232>:
.globl vector232
vector232:
  pushl $0
  102516:	6a 00                	push   $0x0
  pushl $232
  102518:	68 e8 00 00 00       	push   $0xe8
  jmp __alltraps
  10251d:	e9 82 f6 ff ff       	jmp    101ba4 <__alltraps>

00102522 <vector233>:
.globl vector233
vector233:
  pushl $0
  102522:	6a 00                	push   $0x0
  pushl $233
  102524:	68 e9 00 00 00       	push   $0xe9
  jmp __alltraps
  102529:	e9 76 f6 ff ff       	jmp    101ba4 <__alltraps>

0010252e <vector234>:
.globl vector234
vector234:
  pushl $0
  10252e:	6a 00                	push   $0x0
  pushl $234
  102530:	68 ea 00 00 00       	push   $0xea
  jmp __alltraps
  102535:	e9 6a f6 ff ff       	jmp    101ba4 <__alltraps>

0010253a <vector235>:
.globl vector235
vector235:
  pushl $0
  10253a:	6a 00                	push   $0x0
  pushl $235
  10253c:	68 eb 00 00 00       	push   $0xeb
  jmp __alltraps
  102541:	e9 5e f6 ff ff       	jmp    101ba4 <__alltraps>

00102546 <vector236>:
.globl vector236
vector236:
  pushl $0
  102546:	6a 00                	push   $0x0
  pushl $236
  102548:	68 ec 00 00 00       	push   $0xec
  jmp __alltraps
  10254d:	e9 52 f6 ff ff       	jmp    101ba4 <__alltraps>

00102552 <vector237>:
.globl vector237
vector237:
  pushl $0
  102552:	6a 00                	push   $0x0
  pushl $237
  102554:	68 ed 00 00 00       	push   $0xed
  jmp __alltraps
  102559:	e9 46 f6 ff ff       	jmp    101ba4 <__alltraps>

0010255e <vector238>:
.globl vector238
vector238:
  pushl $0
  10255e:	6a 00                	push   $0x0
  pushl $238
  102560:	68 ee 00 00 00       	push   $0xee
  jmp __alltraps
  102565:	e9 3a f6 ff ff       	jmp    101ba4 <__alltraps>

0010256a <vector239>:
.globl vector239
vector239:
  pushl $0
  10256a:	6a 00                	push   $0x0
  pushl $239
  10256c:	68 ef 00 00 00       	push   $0xef
  jmp __alltraps
  102571:	e9 2e f6 ff ff       	jmp    101ba4 <__alltraps>

00102576 <vector240>:
.globl vector240
vector240:
  pushl $0
  102576:	6a 00                	push   $0x0
  pushl $240
  102578:	68 f0 00 00 00       	push   $0xf0
  jmp __alltraps
  10257d:	e9 22 f6 ff ff       	jmp    101ba4 <__alltraps>

00102582 <vector241>:
.globl vector241
vector241:
  pushl $0
  102582:	6a 00                	push   $0x0
  pushl $241
  102584:	68 f1 00 00 00       	push   $0xf1
  jmp __alltraps
  102589:	e9 16 f6 ff ff       	jmp    101ba4 <__alltraps>

0010258e <vector242>:
.globl vector242
vector242:
  pushl $0
  10258e:	6a 00                	push   $0x0
  pushl $242
  102590:	68 f2 00 00 00       	push   $0xf2
  jmp __alltraps
  102595:	e9 0a f6 ff ff       	jmp    101ba4 <__alltraps>

0010259a <vector243>:
.globl vector243
vector243:
  pushl $0
  10259a:	6a 00                	push   $0x0
  pushl $243
  10259c:	68 f3 00 00 00       	push   $0xf3
  jmp __alltraps
  1025a1:	e9 fe f5 ff ff       	jmp    101ba4 <__alltraps>

001025a6 <vector244>:
.globl vector244
vector244:
  pushl $0
  1025a6:	6a 00                	push   $0x0
  pushl $244
  1025a8:	68 f4 00 00 00       	push   $0xf4
  jmp __alltraps
  1025ad:	e9 f2 f5 ff ff       	jmp    101ba4 <__alltraps>

001025b2 <vector245>:
.globl vector245
vector245:
  pushl $0
  1025b2:	6a 00                	push   $0x0
  pushl $245
  1025b4:	68 f5 00 00 00       	push   $0xf5
  jmp __alltraps
  1025b9:	e9 e6 f5 ff ff       	jmp    101ba4 <__alltraps>

001025be <vector246>:
.globl vector246
vector246:
  pushl $0
  1025be:	6a 00                	push   $0x0
  pushl $246
  1025c0:	68 f6 00 00 00       	push   $0xf6
  jmp __alltraps
  1025c5:	e9 da f5 ff ff       	jmp    101ba4 <__alltraps>

001025ca <vector247>:
.globl vector247
vector247:
  pushl $0
  1025ca:	6a 00                	push   $0x0
  pushl $247
  1025cc:	68 f7 00 00 00       	push   $0xf7
  jmp __alltraps
  1025d1:	e9 ce f5 ff ff       	jmp    101ba4 <__alltraps>

001025d6 <vector248>:
.globl vector248
vector248:
  pushl $0
  1025d6:	6a 00                	push   $0x0
  pushl $248
  1025d8:	68 f8 00 00 00       	push   $0xf8
  jmp __alltraps
  1025dd:	e9 c2 f5 ff ff       	jmp    101ba4 <__alltraps>

001025e2 <vector249>:
.globl vector249
vector249:
  pushl $0
  1025e2:	6a 00                	push   $0x0
  pushl $249
  1025e4:	68 f9 00 00 00       	push   $0xf9
  jmp __alltraps
  1025e9:	e9 b6 f5 ff ff       	jmp    101ba4 <__alltraps>

001025ee <vector250>:
.globl vector250
vector250:
  pushl $0
  1025ee:	6a 00                	push   $0x0
  pushl $250
  1025f0:	68 fa 00 00 00       	push   $0xfa
  jmp __alltraps
  1025f5:	e9 aa f5 ff ff       	jmp    101ba4 <__alltraps>

001025fa <vector251>:
.globl vector251
vector251:
  pushl $0
  1025fa:	6a 00                	push   $0x0
  pushl $251
  1025fc:	68 fb 00 00 00       	push   $0xfb
  jmp __alltraps
  102601:	e9 9e f5 ff ff       	jmp    101ba4 <__alltraps>

00102606 <vector252>:
.globl vector252
vector252:
  pushl $0
  102606:	6a 00                	push   $0x0
  pushl $252
  102608:	68 fc 00 00 00       	push   $0xfc
  jmp __alltraps
  10260d:	e9 92 f5 ff ff       	jmp    101ba4 <__alltraps>

00102612 <vector253>:
.globl vector253
vector253:
  pushl $0
  102612:	6a 00                	push   $0x0
  pushl $253
  102614:	68 fd 00 00 00       	push   $0xfd
  jmp __alltraps
  102619:	e9 86 f5 ff ff       	jmp    101ba4 <__alltraps>

0010261e <vector254>:
.globl vector254
vector254:
  pushl $0
  10261e:	6a 00                	push   $0x0
  pushl $254
  102620:	68 fe 00 00 00       	push   $0xfe
  jmp __alltraps
  102625:	e9 7a f5 ff ff       	jmp    101ba4 <__alltraps>

0010262a <vector255>:
.globl vector255
vector255:
  pushl $0
  10262a:	6a 00                	push   $0x0
  pushl $255
  10262c:	68 ff 00 00 00       	push   $0xff
  jmp __alltraps
  102631:	e9 6e f5 ff ff       	jmp    101ba4 <__alltraps>

00102636 <lgdt>:
/* *
 * lgdt - load the global descriptor table register and reset the
 * data/code segement registers for kernel.
 * */
static inline void
lgdt(struct pseudodesc *pd) {
  102636:	55                   	push   %ebp
  102637:	89 e5                	mov    %esp,%ebp
    asm volatile ("lgdt (%0)" :: "r" (pd));
  102639:	8b 45 08             	mov    0x8(%ebp),%eax
  10263c:	0f 01 10             	lgdtl  (%eax)
    asm volatile ("movw %%ax, %%gs" :: "a" (USER_DS));
  10263f:	b8 23 00 00 00       	mov    $0x23,%eax
  102644:	8e e8                	mov    %eax,%gs
    asm volatile ("movw %%ax, %%fs" :: "a" (USER_DS));
  102646:	b8 23 00 00 00       	mov    $0x23,%eax
  10264b:	8e e0                	mov    %eax,%fs
    asm volatile ("movw %%ax, %%es" :: "a" (KERNEL_DS));
  10264d:	b8 10 00 00 00       	mov    $0x10,%eax
  102652:	8e c0                	mov    %eax,%es
    asm volatile ("movw %%ax, %%ds" :: "a" (KERNEL_DS));
  102654:	b8 10 00 00 00       	mov    $0x10,%eax
  102659:	8e d8                	mov    %eax,%ds
    asm volatile ("movw %%ax, %%ss" :: "a" (KERNEL_DS));
  10265b:	b8 10 00 00 00       	mov    $0x10,%eax
  102660:	8e d0                	mov    %eax,%ss
    // reload cs
    asm volatile ("ljmp %0, $1f\n 1:\n" :: "i" (KERNEL_CS));
  102662:	ea 69 26 10 00 08 00 	ljmp   $0x8,$0x102669
}
  102669:	5d                   	pop    %ebp
  10266a:	c3                   	ret    

0010266b <gdt_init>:
/* temporary kernel stack */
uint8_t stack0[1024];

/* gdt_init - initialize the default GDT and TSS */
static void
gdt_init(void) {
  10266b:	55                   	push   %ebp
  10266c:	89 e5                	mov    %esp,%ebp
  10266e:	83 ec 14             	sub    $0x14,%esp
    // Setup a TSS so that we can get the right stack when we trap from
    // user to the kernel. But not safe here, it's only a temporary value,
    // it will be set to KSTACKTOP in lab2.
    ts.ts_esp0 = (uint32_t)&stack0 + sizeof(stack0);
  102671:	b8 20 f9 10 00       	mov    $0x10f920,%eax
  102676:	05 00 04 00 00       	add    $0x400,%eax
  10267b:	a3 a4 f8 10 00       	mov    %eax,0x10f8a4
    ts.ts_ss0 = KERNEL_DS;
  102680:	66 c7 05 a8 f8 10 00 	movw   $0x10,0x10f8a8
  102687:	10 00 

    // initialize the TSS filed of the gdt
    gdt[SEG_TSS] = SEG16(STS_T32A, (uint32_t)&ts, sizeof(ts), DPL_KERNEL);
  102689:	66 c7 05 08 ea 10 00 	movw   $0x68,0x10ea08
  102690:	68 00 
  102692:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  102697:	66 a3 0a ea 10 00    	mov    %ax,0x10ea0a
  10269d:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  1026a2:	c1 e8 10             	shr    $0x10,%eax
  1026a5:	a2 0c ea 10 00       	mov    %al,0x10ea0c
  1026aa:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  1026b1:	83 e0 f0             	and    $0xfffffff0,%eax
  1026b4:	83 c8 09             	or     $0x9,%eax
  1026b7:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  1026bc:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  1026c3:	83 c8 10             	or     $0x10,%eax
  1026c6:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  1026cb:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  1026d2:	83 e0 9f             	and    $0xffffff9f,%eax
  1026d5:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  1026da:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  1026e1:	83 c8 80             	or     $0xffffff80,%eax
  1026e4:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  1026e9:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  1026f0:	83 e0 f0             	and    $0xfffffff0,%eax
  1026f3:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  1026f8:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  1026ff:	83 e0 ef             	and    $0xffffffef,%eax
  102702:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102707:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  10270e:	83 e0 df             	and    $0xffffffdf,%eax
  102711:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102716:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  10271d:	83 c8 40             	or     $0x40,%eax
  102720:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102725:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  10272c:	83 e0 7f             	and    $0x7f,%eax
  10272f:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102734:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  102739:	c1 e8 18             	shr    $0x18,%eax
  10273c:	a2 0f ea 10 00       	mov    %al,0x10ea0f
    gdt[SEG_TSS].sd_s = 0;
  102741:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102748:	83 e0 ef             	and    $0xffffffef,%eax
  10274b:	a2 0d ea 10 00       	mov    %al,0x10ea0d

    // reload all segment registers
    lgdt(&gdt_pd);
  102750:	c7 04 24 10 ea 10 00 	movl   $0x10ea10,(%esp)
  102757:	e8 da fe ff ff       	call   102636 <lgdt>
  10275c:	66 c7 45 fe 28 00    	movw   $0x28,-0x2(%ebp)
    asm volatile ("cli");
}

static inline void
ltr(uint16_t sel) {
    asm volatile ("ltr %0" :: "r" (sel));
  102762:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  102766:	0f 00 d8             	ltr    %ax

    // load the TSS
    ltr(GD_TSS);
}
  102769:	c9                   	leave  
  10276a:	c3                   	ret    

0010276b <pmm_init>:

/* pmm_init - initialize the physical memory management */
void
pmm_init(void) {
  10276b:	55                   	push   %ebp
  10276c:	89 e5                	mov    %esp,%ebp
    gdt_init();
  10276e:	e8 f8 fe ff ff       	call   10266b <gdt_init>
}
  102773:	5d                   	pop    %ebp
  102774:	c3                   	ret    

00102775 <printnum>:
 * @width:         maximum number of digits, if the actual width is less than @width, use @padc instead
 * @padc:        character that padded on the left if the actual width is less than @width
 * */
static void
printnum(void (*putch)(int, void*), void *putdat,
        unsigned long long num, unsigned base, int width, int padc) {
  102775:	55                   	push   %ebp
  102776:	89 e5                	mov    %esp,%ebp
  102778:	83 ec 58             	sub    $0x58,%esp
  10277b:	8b 45 10             	mov    0x10(%ebp),%eax
  10277e:	89 45 d0             	mov    %eax,-0x30(%ebp)
  102781:	8b 45 14             	mov    0x14(%ebp),%eax
  102784:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    unsigned long long result = num;
  102787:	8b 45 d0             	mov    -0x30(%ebp),%eax
  10278a:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10278d:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102790:	89 55 ec             	mov    %edx,-0x14(%ebp)
    unsigned mod = do_div(result, base);
  102793:	8b 45 18             	mov    0x18(%ebp),%eax
  102796:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102799:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10279c:	8b 55 ec             	mov    -0x14(%ebp),%edx
  10279f:	89 45 e0             	mov    %eax,-0x20(%ebp)
  1027a2:	89 55 f0             	mov    %edx,-0x10(%ebp)
  1027a5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1027a8:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1027ab:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  1027af:	74 1c                	je     1027cd <printnum+0x58>
  1027b1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1027b4:	ba 00 00 00 00       	mov    $0x0,%edx
  1027b9:	f7 75 e4             	divl   -0x1c(%ebp)
  1027bc:	89 55 f4             	mov    %edx,-0xc(%ebp)
  1027bf:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1027c2:	ba 00 00 00 00       	mov    $0x0,%edx
  1027c7:	f7 75 e4             	divl   -0x1c(%ebp)
  1027ca:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1027cd:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1027d0:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1027d3:	f7 75 e4             	divl   -0x1c(%ebp)
  1027d6:	89 45 e0             	mov    %eax,-0x20(%ebp)
  1027d9:	89 55 dc             	mov    %edx,-0x24(%ebp)
  1027dc:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1027df:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1027e2:	89 45 e8             	mov    %eax,-0x18(%ebp)
  1027e5:	89 55 ec             	mov    %edx,-0x14(%ebp)
  1027e8:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1027eb:	89 45 d8             	mov    %eax,-0x28(%ebp)

    // first recursively print all preceding (more significant) digits
    if (num >= base) {
  1027ee:	8b 45 18             	mov    0x18(%ebp),%eax
  1027f1:	ba 00 00 00 00       	mov    $0x0,%edx
  1027f6:	3b 55 d4             	cmp    -0x2c(%ebp),%edx
  1027f9:	77 56                	ja     102851 <printnum+0xdc>
  1027fb:	3b 55 d4             	cmp    -0x2c(%ebp),%edx
  1027fe:	72 05                	jb     102805 <printnum+0x90>
  102800:	3b 45 d0             	cmp    -0x30(%ebp),%eax
  102803:	77 4c                	ja     102851 <printnum+0xdc>
        printnum(putch, putdat, result, base, width - 1, padc);
  102805:	8b 45 1c             	mov    0x1c(%ebp),%eax
  102808:	8d 50 ff             	lea    -0x1(%eax),%edx
  10280b:	8b 45 20             	mov    0x20(%ebp),%eax
  10280e:	89 44 24 18          	mov    %eax,0x18(%esp)
  102812:	89 54 24 14          	mov    %edx,0x14(%esp)
  102816:	8b 45 18             	mov    0x18(%ebp),%eax
  102819:	89 44 24 10          	mov    %eax,0x10(%esp)
  10281d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102820:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102823:	89 44 24 08          	mov    %eax,0x8(%esp)
  102827:	89 54 24 0c          	mov    %edx,0xc(%esp)
  10282b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10282e:	89 44 24 04          	mov    %eax,0x4(%esp)
  102832:	8b 45 08             	mov    0x8(%ebp),%eax
  102835:	89 04 24             	mov    %eax,(%esp)
  102838:	e8 38 ff ff ff       	call   102775 <printnum>
  10283d:	eb 1c                	jmp    10285b <printnum+0xe6>
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
            putch(padc, putdat);
  10283f:	8b 45 0c             	mov    0xc(%ebp),%eax
  102842:	89 44 24 04          	mov    %eax,0x4(%esp)
  102846:	8b 45 20             	mov    0x20(%ebp),%eax
  102849:	89 04 24             	mov    %eax,(%esp)
  10284c:	8b 45 08             	mov    0x8(%ebp),%eax
  10284f:	ff d0                	call   *%eax
    // first recursively print all preceding (more significant) digits
    if (num >= base) {
        printnum(putch, putdat, result, base, width - 1, padc);
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
  102851:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
  102855:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
  102859:	7f e4                	jg     10283f <printnum+0xca>
            putch(padc, putdat);
    }
    // then print this (the least significant) digit
    putch("0123456789abcdef"[mod], putdat);
  10285b:	8b 45 d8             	mov    -0x28(%ebp),%eax
  10285e:	05 50 3a 10 00       	add    $0x103a50,%eax
  102863:	0f b6 00             	movzbl (%eax),%eax
  102866:	0f be c0             	movsbl %al,%eax
  102869:	8b 55 0c             	mov    0xc(%ebp),%edx
  10286c:	89 54 24 04          	mov    %edx,0x4(%esp)
  102870:	89 04 24             	mov    %eax,(%esp)
  102873:	8b 45 08             	mov    0x8(%ebp),%eax
  102876:	ff d0                	call   *%eax
}
  102878:	c9                   	leave  
  102879:	c3                   	ret    

0010287a <getuint>:
 * getuint - get an unsigned int of various possible sizes from a varargs list
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static unsigned long long
getuint(va_list *ap, int lflag) {
  10287a:	55                   	push   %ebp
  10287b:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  10287d:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102881:	7e 14                	jle    102897 <getuint+0x1d>
        return va_arg(*ap, unsigned long long);
  102883:	8b 45 08             	mov    0x8(%ebp),%eax
  102886:	8b 00                	mov    (%eax),%eax
  102888:	8d 48 08             	lea    0x8(%eax),%ecx
  10288b:	8b 55 08             	mov    0x8(%ebp),%edx
  10288e:	89 0a                	mov    %ecx,(%edx)
  102890:	8b 50 04             	mov    0x4(%eax),%edx
  102893:	8b 00                	mov    (%eax),%eax
  102895:	eb 30                	jmp    1028c7 <getuint+0x4d>
    }
    else if (lflag) {
  102897:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  10289b:	74 16                	je     1028b3 <getuint+0x39>
        return va_arg(*ap, unsigned long);
  10289d:	8b 45 08             	mov    0x8(%ebp),%eax
  1028a0:	8b 00                	mov    (%eax),%eax
  1028a2:	8d 48 04             	lea    0x4(%eax),%ecx
  1028a5:	8b 55 08             	mov    0x8(%ebp),%edx
  1028a8:	89 0a                	mov    %ecx,(%edx)
  1028aa:	8b 00                	mov    (%eax),%eax
  1028ac:	ba 00 00 00 00       	mov    $0x0,%edx
  1028b1:	eb 14                	jmp    1028c7 <getuint+0x4d>
    }
    else {
        return va_arg(*ap, unsigned int);
  1028b3:	8b 45 08             	mov    0x8(%ebp),%eax
  1028b6:	8b 00                	mov    (%eax),%eax
  1028b8:	8d 48 04             	lea    0x4(%eax),%ecx
  1028bb:	8b 55 08             	mov    0x8(%ebp),%edx
  1028be:	89 0a                	mov    %ecx,(%edx)
  1028c0:	8b 00                	mov    (%eax),%eax
  1028c2:	ba 00 00 00 00       	mov    $0x0,%edx
    }
}
  1028c7:	5d                   	pop    %ebp
  1028c8:	c3                   	ret    

001028c9 <getint>:
 * getint - same as getuint but signed, we can't use getuint because of sign extension
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static long long
getint(va_list *ap, int lflag) {
  1028c9:	55                   	push   %ebp
  1028ca:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  1028cc:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  1028d0:	7e 14                	jle    1028e6 <getint+0x1d>
        return va_arg(*ap, long long);
  1028d2:	8b 45 08             	mov    0x8(%ebp),%eax
  1028d5:	8b 00                	mov    (%eax),%eax
  1028d7:	8d 48 08             	lea    0x8(%eax),%ecx
  1028da:	8b 55 08             	mov    0x8(%ebp),%edx
  1028dd:	89 0a                	mov    %ecx,(%edx)
  1028df:	8b 50 04             	mov    0x4(%eax),%edx
  1028e2:	8b 00                	mov    (%eax),%eax
  1028e4:	eb 28                	jmp    10290e <getint+0x45>
    }
    else if (lflag) {
  1028e6:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  1028ea:	74 12                	je     1028fe <getint+0x35>
        return va_arg(*ap, long);
  1028ec:	8b 45 08             	mov    0x8(%ebp),%eax
  1028ef:	8b 00                	mov    (%eax),%eax
  1028f1:	8d 48 04             	lea    0x4(%eax),%ecx
  1028f4:	8b 55 08             	mov    0x8(%ebp),%edx
  1028f7:	89 0a                	mov    %ecx,(%edx)
  1028f9:	8b 00                	mov    (%eax),%eax
  1028fb:	99                   	cltd   
  1028fc:	eb 10                	jmp    10290e <getint+0x45>
    }
    else {
        return va_arg(*ap, int);
  1028fe:	8b 45 08             	mov    0x8(%ebp),%eax
  102901:	8b 00                	mov    (%eax),%eax
  102903:	8d 48 04             	lea    0x4(%eax),%ecx
  102906:	8b 55 08             	mov    0x8(%ebp),%edx
  102909:	89 0a                	mov    %ecx,(%edx)
  10290b:	8b 00                	mov    (%eax),%eax
  10290d:	99                   	cltd   
    }
}
  10290e:	5d                   	pop    %ebp
  10290f:	c3                   	ret    

00102910 <printfmt>:
 * @putch:        specified putch function, print a single character
 * @putdat:        used by @putch function
 * @fmt:        the format string to use
 * */
void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
  102910:	55                   	push   %ebp
  102911:	89 e5                	mov    %esp,%ebp
  102913:	83 ec 28             	sub    $0x28,%esp
    va_list ap;

    va_start(ap, fmt);
  102916:	8d 45 14             	lea    0x14(%ebp),%eax
  102919:	89 45 f4             	mov    %eax,-0xc(%ebp)
    vprintfmt(putch, putdat, fmt, ap);
  10291c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10291f:	89 44 24 0c          	mov    %eax,0xc(%esp)
  102923:	8b 45 10             	mov    0x10(%ebp),%eax
  102926:	89 44 24 08          	mov    %eax,0x8(%esp)
  10292a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10292d:	89 44 24 04          	mov    %eax,0x4(%esp)
  102931:	8b 45 08             	mov    0x8(%ebp),%eax
  102934:	89 04 24             	mov    %eax,(%esp)
  102937:	e8 02 00 00 00       	call   10293e <vprintfmt>
    va_end(ap);
}
  10293c:	c9                   	leave  
  10293d:	c3                   	ret    

0010293e <vprintfmt>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want printfmt() instead.
 * */
void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap) {
  10293e:	55                   	push   %ebp
  10293f:	89 e5                	mov    %esp,%ebp
  102941:	56                   	push   %esi
  102942:	53                   	push   %ebx
  102943:	83 ec 40             	sub    $0x40,%esp
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102946:	eb 18                	jmp    102960 <vprintfmt+0x22>
            if (ch == '\0') {
  102948:	85 db                	test   %ebx,%ebx
  10294a:	75 05                	jne    102951 <vprintfmt+0x13>
                return;
  10294c:	e9 d1 03 00 00       	jmp    102d22 <vprintfmt+0x3e4>
            }
            putch(ch, putdat);
  102951:	8b 45 0c             	mov    0xc(%ebp),%eax
  102954:	89 44 24 04          	mov    %eax,0x4(%esp)
  102958:	89 1c 24             	mov    %ebx,(%esp)
  10295b:	8b 45 08             	mov    0x8(%ebp),%eax
  10295e:	ff d0                	call   *%eax
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102960:	8b 45 10             	mov    0x10(%ebp),%eax
  102963:	8d 50 01             	lea    0x1(%eax),%edx
  102966:	89 55 10             	mov    %edx,0x10(%ebp)
  102969:	0f b6 00             	movzbl (%eax),%eax
  10296c:	0f b6 d8             	movzbl %al,%ebx
  10296f:	83 fb 25             	cmp    $0x25,%ebx
  102972:	75 d4                	jne    102948 <vprintfmt+0xa>
            }
            putch(ch, putdat);
        }

        // Process a %-escape sequence
        char padc = ' ';
  102974:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
        width = precision = -1;
  102978:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
  10297f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102982:	89 45 e8             	mov    %eax,-0x18(%ebp)
        lflag = altflag = 0;
  102985:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  10298c:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10298f:	89 45 e0             	mov    %eax,-0x20(%ebp)

    reswitch:
        switch (ch = *(unsigned char *)fmt ++) {
  102992:	8b 45 10             	mov    0x10(%ebp),%eax
  102995:	8d 50 01             	lea    0x1(%eax),%edx
  102998:	89 55 10             	mov    %edx,0x10(%ebp)
  10299b:	0f b6 00             	movzbl (%eax),%eax
  10299e:	0f b6 d8             	movzbl %al,%ebx
  1029a1:	8d 43 dd             	lea    -0x23(%ebx),%eax
  1029a4:	83 f8 55             	cmp    $0x55,%eax
  1029a7:	0f 87 44 03 00 00    	ja     102cf1 <vprintfmt+0x3b3>
  1029ad:	8b 04 85 74 3a 10 00 	mov    0x103a74(,%eax,4),%eax
  1029b4:	ff e0                	jmp    *%eax

        // flag to pad on the right
        case '-':
            padc = '-';
  1029b6:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
            goto reswitch;
  1029ba:	eb d6                	jmp    102992 <vprintfmt+0x54>

        // flag to pad with 0's instead of spaces
        case '0':
            padc = '0';
  1029bc:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
            goto reswitch;
  1029c0:	eb d0                	jmp    102992 <vprintfmt+0x54>

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  1029c2:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
                precision = precision * 10 + ch - '0';
  1029c9:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  1029cc:	89 d0                	mov    %edx,%eax
  1029ce:	c1 e0 02             	shl    $0x2,%eax
  1029d1:	01 d0                	add    %edx,%eax
  1029d3:	01 c0                	add    %eax,%eax
  1029d5:	01 d8                	add    %ebx,%eax
  1029d7:	83 e8 30             	sub    $0x30,%eax
  1029da:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                ch = *fmt;
  1029dd:	8b 45 10             	mov    0x10(%ebp),%eax
  1029e0:	0f b6 00             	movzbl (%eax),%eax
  1029e3:	0f be d8             	movsbl %al,%ebx
                if (ch < '0' || ch > '9') {
  1029e6:	83 fb 2f             	cmp    $0x2f,%ebx
  1029e9:	7e 0b                	jle    1029f6 <vprintfmt+0xb8>
  1029eb:	83 fb 39             	cmp    $0x39,%ebx
  1029ee:	7f 06                	jg     1029f6 <vprintfmt+0xb8>
            padc = '0';
            goto reswitch;

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  1029f0:	83 45 10 01          	addl   $0x1,0x10(%ebp)
                precision = precision * 10 + ch - '0';
                ch = *fmt;
                if (ch < '0' || ch > '9') {
                    break;
                }
            }
  1029f4:	eb d3                	jmp    1029c9 <vprintfmt+0x8b>
            goto process_precision;
  1029f6:	eb 33                	jmp    102a2b <vprintfmt+0xed>

        case '*':
            precision = va_arg(ap, int);
  1029f8:	8b 45 14             	mov    0x14(%ebp),%eax
  1029fb:	8d 50 04             	lea    0x4(%eax),%edx
  1029fe:	89 55 14             	mov    %edx,0x14(%ebp)
  102a01:	8b 00                	mov    (%eax),%eax
  102a03:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            goto process_precision;
  102a06:	eb 23                	jmp    102a2b <vprintfmt+0xed>

        case '.':
            if (width < 0)
  102a08:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102a0c:	79 0c                	jns    102a1a <vprintfmt+0xdc>
                width = 0;
  102a0e:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
            goto reswitch;
  102a15:	e9 78 ff ff ff       	jmp    102992 <vprintfmt+0x54>
  102a1a:	e9 73 ff ff ff       	jmp    102992 <vprintfmt+0x54>

        case '#':
            altflag = 1;
  102a1f:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
            goto reswitch;
  102a26:	e9 67 ff ff ff       	jmp    102992 <vprintfmt+0x54>

        process_precision:
            if (width < 0)
  102a2b:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102a2f:	79 12                	jns    102a43 <vprintfmt+0x105>
                width = precision, precision = -1;
  102a31:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102a34:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102a37:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
            goto reswitch;
  102a3e:	e9 4f ff ff ff       	jmp    102992 <vprintfmt+0x54>
  102a43:	e9 4a ff ff ff       	jmp    102992 <vprintfmt+0x54>

        // long flag (doubled for long long)
        case 'l':
            lflag ++;
  102a48:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
            goto reswitch;
  102a4c:	e9 41 ff ff ff       	jmp    102992 <vprintfmt+0x54>

        // character
        case 'c':
            putch(va_arg(ap, int), putdat);
  102a51:	8b 45 14             	mov    0x14(%ebp),%eax
  102a54:	8d 50 04             	lea    0x4(%eax),%edx
  102a57:	89 55 14             	mov    %edx,0x14(%ebp)
  102a5a:	8b 00                	mov    (%eax),%eax
  102a5c:	8b 55 0c             	mov    0xc(%ebp),%edx
  102a5f:	89 54 24 04          	mov    %edx,0x4(%esp)
  102a63:	89 04 24             	mov    %eax,(%esp)
  102a66:	8b 45 08             	mov    0x8(%ebp),%eax
  102a69:	ff d0                	call   *%eax
            break;
  102a6b:	e9 ac 02 00 00       	jmp    102d1c <vprintfmt+0x3de>

        // error message
        case 'e':
            err = va_arg(ap, int);
  102a70:	8b 45 14             	mov    0x14(%ebp),%eax
  102a73:	8d 50 04             	lea    0x4(%eax),%edx
  102a76:	89 55 14             	mov    %edx,0x14(%ebp)
  102a79:	8b 18                	mov    (%eax),%ebx
            if (err < 0) {
  102a7b:	85 db                	test   %ebx,%ebx
  102a7d:	79 02                	jns    102a81 <vprintfmt+0x143>
                err = -err;
  102a7f:	f7 db                	neg    %ebx
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
  102a81:	83 fb 06             	cmp    $0x6,%ebx
  102a84:	7f 0b                	jg     102a91 <vprintfmt+0x153>
  102a86:	8b 34 9d 34 3a 10 00 	mov    0x103a34(,%ebx,4),%esi
  102a8d:	85 f6                	test   %esi,%esi
  102a8f:	75 23                	jne    102ab4 <vprintfmt+0x176>
                printfmt(putch, putdat, "error %d", err);
  102a91:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  102a95:	c7 44 24 08 61 3a 10 	movl   $0x103a61,0x8(%esp)
  102a9c:	00 
  102a9d:	8b 45 0c             	mov    0xc(%ebp),%eax
  102aa0:	89 44 24 04          	mov    %eax,0x4(%esp)
  102aa4:	8b 45 08             	mov    0x8(%ebp),%eax
  102aa7:	89 04 24             	mov    %eax,(%esp)
  102aaa:	e8 61 fe ff ff       	call   102910 <printfmt>
            }
            else {
                printfmt(putch, putdat, "%s", p);
            }
            break;
  102aaf:	e9 68 02 00 00       	jmp    102d1c <vprintfmt+0x3de>
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
                printfmt(putch, putdat, "error %d", err);
            }
            else {
                printfmt(putch, putdat, "%s", p);
  102ab4:	89 74 24 0c          	mov    %esi,0xc(%esp)
  102ab8:	c7 44 24 08 6a 3a 10 	movl   $0x103a6a,0x8(%esp)
  102abf:	00 
  102ac0:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ac3:	89 44 24 04          	mov    %eax,0x4(%esp)
  102ac7:	8b 45 08             	mov    0x8(%ebp),%eax
  102aca:	89 04 24             	mov    %eax,(%esp)
  102acd:	e8 3e fe ff ff       	call   102910 <printfmt>
            }
            break;
  102ad2:	e9 45 02 00 00       	jmp    102d1c <vprintfmt+0x3de>

        // string
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
  102ad7:	8b 45 14             	mov    0x14(%ebp),%eax
  102ada:	8d 50 04             	lea    0x4(%eax),%edx
  102add:	89 55 14             	mov    %edx,0x14(%ebp)
  102ae0:	8b 30                	mov    (%eax),%esi
  102ae2:	85 f6                	test   %esi,%esi
  102ae4:	75 05                	jne    102aeb <vprintfmt+0x1ad>
                p = "(null)";
  102ae6:	be 6d 3a 10 00       	mov    $0x103a6d,%esi
            }
            if (width > 0 && padc != '-') {
  102aeb:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102aef:	7e 3e                	jle    102b2f <vprintfmt+0x1f1>
  102af1:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
  102af5:	74 38                	je     102b2f <vprintfmt+0x1f1>
                for (width -= strnlen(p, precision); width > 0; width --) {
  102af7:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  102afa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102afd:	89 44 24 04          	mov    %eax,0x4(%esp)
  102b01:	89 34 24             	mov    %esi,(%esp)
  102b04:	e8 15 03 00 00       	call   102e1e <strnlen>
  102b09:	29 c3                	sub    %eax,%ebx
  102b0b:	89 d8                	mov    %ebx,%eax
  102b0d:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102b10:	eb 17                	jmp    102b29 <vprintfmt+0x1eb>
                    putch(padc, putdat);
  102b12:	0f be 45 db          	movsbl -0x25(%ebp),%eax
  102b16:	8b 55 0c             	mov    0xc(%ebp),%edx
  102b19:	89 54 24 04          	mov    %edx,0x4(%esp)
  102b1d:	89 04 24             	mov    %eax,(%esp)
  102b20:	8b 45 08             	mov    0x8(%ebp),%eax
  102b23:	ff d0                	call   *%eax
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
                p = "(null)";
            }
            if (width > 0 && padc != '-') {
                for (width -= strnlen(p, precision); width > 0; width --) {
  102b25:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  102b29:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102b2d:	7f e3                	jg     102b12 <vprintfmt+0x1d4>
                    putch(padc, putdat);
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  102b2f:	eb 38                	jmp    102b69 <vprintfmt+0x22b>
                if (altflag && (ch < ' ' || ch > '~')) {
  102b31:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  102b35:	74 1f                	je     102b56 <vprintfmt+0x218>
  102b37:	83 fb 1f             	cmp    $0x1f,%ebx
  102b3a:	7e 05                	jle    102b41 <vprintfmt+0x203>
  102b3c:	83 fb 7e             	cmp    $0x7e,%ebx
  102b3f:	7e 15                	jle    102b56 <vprintfmt+0x218>
                    putch('?', putdat);
  102b41:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b44:	89 44 24 04          	mov    %eax,0x4(%esp)
  102b48:	c7 04 24 3f 00 00 00 	movl   $0x3f,(%esp)
  102b4f:	8b 45 08             	mov    0x8(%ebp),%eax
  102b52:	ff d0                	call   *%eax
  102b54:	eb 0f                	jmp    102b65 <vprintfmt+0x227>
                }
                else {
                    putch(ch, putdat);
  102b56:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b59:	89 44 24 04          	mov    %eax,0x4(%esp)
  102b5d:	89 1c 24             	mov    %ebx,(%esp)
  102b60:	8b 45 08             	mov    0x8(%ebp),%eax
  102b63:	ff d0                	call   *%eax
            if (width > 0 && padc != '-') {
                for (width -= strnlen(p, precision); width > 0; width --) {
                    putch(padc, putdat);
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  102b65:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  102b69:	89 f0                	mov    %esi,%eax
  102b6b:	8d 70 01             	lea    0x1(%eax),%esi
  102b6e:	0f b6 00             	movzbl (%eax),%eax
  102b71:	0f be d8             	movsbl %al,%ebx
  102b74:	85 db                	test   %ebx,%ebx
  102b76:	74 10                	je     102b88 <vprintfmt+0x24a>
  102b78:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  102b7c:	78 b3                	js     102b31 <vprintfmt+0x1f3>
  102b7e:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
  102b82:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  102b86:	79 a9                	jns    102b31 <vprintfmt+0x1f3>
                }
                else {
                    putch(ch, putdat);
                }
            }
            for (; width > 0; width --) {
  102b88:	eb 17                	jmp    102ba1 <vprintfmt+0x263>
                putch(' ', putdat);
  102b8a:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b8d:	89 44 24 04          	mov    %eax,0x4(%esp)
  102b91:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  102b98:	8b 45 08             	mov    0x8(%ebp),%eax
  102b9b:	ff d0                	call   *%eax
                }
                else {
                    putch(ch, putdat);
                }
            }
            for (; width > 0; width --) {
  102b9d:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  102ba1:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102ba5:	7f e3                	jg     102b8a <vprintfmt+0x24c>
                putch(' ', putdat);
            }
            break;
  102ba7:	e9 70 01 00 00       	jmp    102d1c <vprintfmt+0x3de>

        // (signed) decimal
        case 'd':
            num = getint(&ap, lflag);
  102bac:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102baf:	89 44 24 04          	mov    %eax,0x4(%esp)
  102bb3:	8d 45 14             	lea    0x14(%ebp),%eax
  102bb6:	89 04 24             	mov    %eax,(%esp)
  102bb9:	e8 0b fd ff ff       	call   1028c9 <getint>
  102bbe:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102bc1:	89 55 f4             	mov    %edx,-0xc(%ebp)
            if ((long long)num < 0) {
  102bc4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102bc7:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102bca:	85 d2                	test   %edx,%edx
  102bcc:	79 26                	jns    102bf4 <vprintfmt+0x2b6>
                putch('-', putdat);
  102bce:	8b 45 0c             	mov    0xc(%ebp),%eax
  102bd1:	89 44 24 04          	mov    %eax,0x4(%esp)
  102bd5:	c7 04 24 2d 00 00 00 	movl   $0x2d,(%esp)
  102bdc:	8b 45 08             	mov    0x8(%ebp),%eax
  102bdf:	ff d0                	call   *%eax
                num = -(long long)num;
  102be1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102be4:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102be7:	f7 d8                	neg    %eax
  102be9:	83 d2 00             	adc    $0x0,%edx
  102bec:	f7 da                	neg    %edx
  102bee:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102bf1:	89 55 f4             	mov    %edx,-0xc(%ebp)
            }
            base = 10;
  102bf4:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  102bfb:	e9 a8 00 00 00       	jmp    102ca8 <vprintfmt+0x36a>

        // unsigned decimal
        case 'u':
            num = getuint(&ap, lflag);
  102c00:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102c03:	89 44 24 04          	mov    %eax,0x4(%esp)
  102c07:	8d 45 14             	lea    0x14(%ebp),%eax
  102c0a:	89 04 24             	mov    %eax,(%esp)
  102c0d:	e8 68 fc ff ff       	call   10287a <getuint>
  102c12:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102c15:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 10;
  102c18:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  102c1f:	e9 84 00 00 00       	jmp    102ca8 <vprintfmt+0x36a>

        // (unsigned) octal
        case 'o':
            num = getuint(&ap, lflag);
  102c24:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102c27:	89 44 24 04          	mov    %eax,0x4(%esp)
  102c2b:	8d 45 14             	lea    0x14(%ebp),%eax
  102c2e:	89 04 24             	mov    %eax,(%esp)
  102c31:	e8 44 fc ff ff       	call   10287a <getuint>
  102c36:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102c39:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 8;
  102c3c:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
            goto number;
  102c43:	eb 63                	jmp    102ca8 <vprintfmt+0x36a>

        // pointer
        case 'p':
            putch('0', putdat);
  102c45:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c48:	89 44 24 04          	mov    %eax,0x4(%esp)
  102c4c:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
  102c53:	8b 45 08             	mov    0x8(%ebp),%eax
  102c56:	ff d0                	call   *%eax
            putch('x', putdat);
  102c58:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c5b:	89 44 24 04          	mov    %eax,0x4(%esp)
  102c5f:	c7 04 24 78 00 00 00 	movl   $0x78,(%esp)
  102c66:	8b 45 08             	mov    0x8(%ebp),%eax
  102c69:	ff d0                	call   *%eax
            num = (unsigned long long)(uintptr_t)va_arg(ap, void *);
  102c6b:	8b 45 14             	mov    0x14(%ebp),%eax
  102c6e:	8d 50 04             	lea    0x4(%eax),%edx
  102c71:	89 55 14             	mov    %edx,0x14(%ebp)
  102c74:	8b 00                	mov    (%eax),%eax
  102c76:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102c79:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            base = 16;
  102c80:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
            goto number;
  102c87:	eb 1f                	jmp    102ca8 <vprintfmt+0x36a>

        // (unsigned) hexadecimal
        case 'x':
            num = getuint(&ap, lflag);
  102c89:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102c8c:	89 44 24 04          	mov    %eax,0x4(%esp)
  102c90:	8d 45 14             	lea    0x14(%ebp),%eax
  102c93:	89 04 24             	mov    %eax,(%esp)
  102c96:	e8 df fb ff ff       	call   10287a <getuint>
  102c9b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102c9e:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 16;
  102ca1:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
        number:
            printnum(putch, putdat, num, base, width, padc);
  102ca8:	0f be 55 db          	movsbl -0x25(%ebp),%edx
  102cac:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102caf:	89 54 24 18          	mov    %edx,0x18(%esp)
  102cb3:	8b 55 e8             	mov    -0x18(%ebp),%edx
  102cb6:	89 54 24 14          	mov    %edx,0x14(%esp)
  102cba:	89 44 24 10          	mov    %eax,0x10(%esp)
  102cbe:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102cc1:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102cc4:	89 44 24 08          	mov    %eax,0x8(%esp)
  102cc8:	89 54 24 0c          	mov    %edx,0xc(%esp)
  102ccc:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ccf:	89 44 24 04          	mov    %eax,0x4(%esp)
  102cd3:	8b 45 08             	mov    0x8(%ebp),%eax
  102cd6:	89 04 24             	mov    %eax,(%esp)
  102cd9:	e8 97 fa ff ff       	call   102775 <printnum>
            break;
  102cde:	eb 3c                	jmp    102d1c <vprintfmt+0x3de>

        // escaped '%' character
        case '%':
            putch(ch, putdat);
  102ce0:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ce3:	89 44 24 04          	mov    %eax,0x4(%esp)
  102ce7:	89 1c 24             	mov    %ebx,(%esp)
  102cea:	8b 45 08             	mov    0x8(%ebp),%eax
  102ced:	ff d0                	call   *%eax
            break;
  102cef:	eb 2b                	jmp    102d1c <vprintfmt+0x3de>

        // unrecognized escape sequence - just print it literally
        default:
            putch('%', putdat);
  102cf1:	8b 45 0c             	mov    0xc(%ebp),%eax
  102cf4:	89 44 24 04          	mov    %eax,0x4(%esp)
  102cf8:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
  102cff:	8b 45 08             	mov    0x8(%ebp),%eax
  102d02:	ff d0                	call   *%eax
            for (fmt --; fmt[-1] != '%'; fmt --)
  102d04:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  102d08:	eb 04                	jmp    102d0e <vprintfmt+0x3d0>
  102d0a:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  102d0e:	8b 45 10             	mov    0x10(%ebp),%eax
  102d11:	83 e8 01             	sub    $0x1,%eax
  102d14:	0f b6 00             	movzbl (%eax),%eax
  102d17:	3c 25                	cmp    $0x25,%al
  102d19:	75 ef                	jne    102d0a <vprintfmt+0x3cc>
                /* do nothing */;
            break;
  102d1b:	90                   	nop
        }
    }
  102d1c:	90                   	nop
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102d1d:	e9 3e fc ff ff       	jmp    102960 <vprintfmt+0x22>
            for (fmt --; fmt[-1] != '%'; fmt --)
                /* do nothing */;
            break;
        }
    }
}
  102d22:	83 c4 40             	add    $0x40,%esp
  102d25:	5b                   	pop    %ebx
  102d26:	5e                   	pop    %esi
  102d27:	5d                   	pop    %ebp
  102d28:	c3                   	ret    

00102d29 <sprintputch>:
 * sprintputch - 'print' a single character in a buffer
 * @ch:            the character will be printed
 * @b:            the buffer to place the character @ch
 * */
static void
sprintputch(int ch, struct sprintbuf *b) {
  102d29:	55                   	push   %ebp
  102d2a:	89 e5                	mov    %esp,%ebp
    b->cnt ++;
  102d2c:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d2f:	8b 40 08             	mov    0x8(%eax),%eax
  102d32:	8d 50 01             	lea    0x1(%eax),%edx
  102d35:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d38:	89 50 08             	mov    %edx,0x8(%eax)
    if (b->buf < b->ebuf) {
  102d3b:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d3e:	8b 10                	mov    (%eax),%edx
  102d40:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d43:	8b 40 04             	mov    0x4(%eax),%eax
  102d46:	39 c2                	cmp    %eax,%edx
  102d48:	73 12                	jae    102d5c <sprintputch+0x33>
        *b->buf ++ = ch;
  102d4a:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d4d:	8b 00                	mov    (%eax),%eax
  102d4f:	8d 48 01             	lea    0x1(%eax),%ecx
  102d52:	8b 55 0c             	mov    0xc(%ebp),%edx
  102d55:	89 0a                	mov    %ecx,(%edx)
  102d57:	8b 55 08             	mov    0x8(%ebp),%edx
  102d5a:	88 10                	mov    %dl,(%eax)
    }
}
  102d5c:	5d                   	pop    %ebp
  102d5d:	c3                   	ret    

00102d5e <snprintf>:
 * @str:        the buffer to place the result into
 * @size:        the size of buffer, including the trailing null space
 * @fmt:        the format string to use
 * */
int
snprintf(char *str, size_t size, const char *fmt, ...) {
  102d5e:	55                   	push   %ebp
  102d5f:	89 e5                	mov    %esp,%ebp
  102d61:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  102d64:	8d 45 14             	lea    0x14(%ebp),%eax
  102d67:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vsnprintf(str, size, fmt, ap);
  102d6a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102d6d:	89 44 24 0c          	mov    %eax,0xc(%esp)
  102d71:	8b 45 10             	mov    0x10(%ebp),%eax
  102d74:	89 44 24 08          	mov    %eax,0x8(%esp)
  102d78:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d7b:	89 44 24 04          	mov    %eax,0x4(%esp)
  102d7f:	8b 45 08             	mov    0x8(%ebp),%eax
  102d82:	89 04 24             	mov    %eax,(%esp)
  102d85:	e8 08 00 00 00       	call   102d92 <vsnprintf>
  102d8a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  102d8d:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  102d90:	c9                   	leave  
  102d91:	c3                   	ret    

00102d92 <vsnprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want snprintf() instead.
 * */
int
vsnprintf(char *str, size_t size, const char *fmt, va_list ap) {
  102d92:	55                   	push   %ebp
  102d93:	89 e5                	mov    %esp,%ebp
  102d95:	83 ec 28             	sub    $0x28,%esp
    struct sprintbuf b = {str, str + size - 1, 0};
  102d98:	8b 45 08             	mov    0x8(%ebp),%eax
  102d9b:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102d9e:	8b 45 0c             	mov    0xc(%ebp),%eax
  102da1:	8d 50 ff             	lea    -0x1(%eax),%edx
  102da4:	8b 45 08             	mov    0x8(%ebp),%eax
  102da7:	01 d0                	add    %edx,%eax
  102da9:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102dac:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if (str == NULL || b.buf > b.ebuf) {
  102db3:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  102db7:	74 0a                	je     102dc3 <vsnprintf+0x31>
  102db9:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102dbc:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102dbf:	39 c2                	cmp    %eax,%edx
  102dc1:	76 07                	jbe    102dca <vsnprintf+0x38>
        return -E_INVAL;
  102dc3:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  102dc8:	eb 2a                	jmp    102df4 <vsnprintf+0x62>
    }
    // print the string to the buffer
    vprintfmt((void*)sprintputch, &b, fmt, ap);
  102dca:	8b 45 14             	mov    0x14(%ebp),%eax
  102dcd:	89 44 24 0c          	mov    %eax,0xc(%esp)
  102dd1:	8b 45 10             	mov    0x10(%ebp),%eax
  102dd4:	89 44 24 08          	mov    %eax,0x8(%esp)
  102dd8:	8d 45 ec             	lea    -0x14(%ebp),%eax
  102ddb:	89 44 24 04          	mov    %eax,0x4(%esp)
  102ddf:	c7 04 24 29 2d 10 00 	movl   $0x102d29,(%esp)
  102de6:	e8 53 fb ff ff       	call   10293e <vprintfmt>
    // null terminate the buffer
    *b.buf = '\0';
  102deb:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102dee:	c6 00 00             	movb   $0x0,(%eax)
    return b.cnt;
  102df1:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  102df4:	c9                   	leave  
  102df5:	c3                   	ret    

00102df6 <strlen>:
 * @s:        the input string
 *
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
  102df6:	55                   	push   %ebp
  102df7:	89 e5                	mov    %esp,%ebp
  102df9:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  102dfc:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (*s ++ != '\0') {
  102e03:	eb 04                	jmp    102e09 <strlen+0x13>
        cnt ++;
  102e05:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
    size_t cnt = 0;
    while (*s ++ != '\0') {
  102e09:	8b 45 08             	mov    0x8(%ebp),%eax
  102e0c:	8d 50 01             	lea    0x1(%eax),%edx
  102e0f:	89 55 08             	mov    %edx,0x8(%ebp)
  102e12:	0f b6 00             	movzbl (%eax),%eax
  102e15:	84 c0                	test   %al,%al
  102e17:	75 ec                	jne    102e05 <strlen+0xf>
        cnt ++;
    }
    return cnt;
  102e19:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102e1c:	c9                   	leave  
  102e1d:	c3                   	ret    

00102e1e <strnlen>:
 * The return value is strlen(s), if that is less than @len, or
 * @len if there is no '\0' character among the first @len characters
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
  102e1e:	55                   	push   %ebp
  102e1f:	89 e5                	mov    %esp,%ebp
  102e21:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  102e24:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  102e2b:	eb 04                	jmp    102e31 <strnlen+0x13>
        cnt ++;
  102e2d:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
    size_t cnt = 0;
    while (cnt < len && *s ++ != '\0') {
  102e31:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102e34:	3b 45 0c             	cmp    0xc(%ebp),%eax
  102e37:	73 10                	jae    102e49 <strnlen+0x2b>
  102e39:	8b 45 08             	mov    0x8(%ebp),%eax
  102e3c:	8d 50 01             	lea    0x1(%eax),%edx
  102e3f:	89 55 08             	mov    %edx,0x8(%ebp)
  102e42:	0f b6 00             	movzbl (%eax),%eax
  102e45:	84 c0                	test   %al,%al
  102e47:	75 e4                	jne    102e2d <strnlen+0xf>
        cnt ++;
    }
    return cnt;
  102e49:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102e4c:	c9                   	leave  
  102e4d:	c3                   	ret    

00102e4e <strcpy>:
 * To avoid overflows, the size of array pointed by @dst should be long enough to
 * contain the same string as @src (including the terminating null character), and
 * should not overlap in memory with @src.
 * */
char *
strcpy(char *dst, const char *src) {
  102e4e:	55                   	push   %ebp
  102e4f:	89 e5                	mov    %esp,%ebp
  102e51:	57                   	push   %edi
  102e52:	56                   	push   %esi
  102e53:	83 ec 20             	sub    $0x20,%esp
  102e56:	8b 45 08             	mov    0x8(%ebp),%eax
  102e59:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102e5c:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e5f:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCPY
#define __HAVE_ARCH_STRCPY
static inline char *
__strcpy(char *dst, const char *src) {
    int d0, d1, d2;
    asm volatile (
  102e62:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102e65:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102e68:	89 d1                	mov    %edx,%ecx
  102e6a:	89 c2                	mov    %eax,%edx
  102e6c:	89 ce                	mov    %ecx,%esi
  102e6e:	89 d7                	mov    %edx,%edi
  102e70:	ac                   	lods   %ds:(%esi),%al
  102e71:	aa                   	stos   %al,%es:(%edi)
  102e72:	84 c0                	test   %al,%al
  102e74:	75 fa                	jne    102e70 <strcpy+0x22>
  102e76:	89 fa                	mov    %edi,%edx
  102e78:	89 f1                	mov    %esi,%ecx
  102e7a:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  102e7d:	89 55 e8             	mov    %edx,-0x18(%ebp)
  102e80:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "stosb;"
            "testb %%al, %%al;"
            "jne 1b;"
            : "=&S" (d0), "=&D" (d1), "=&a" (d2)
            : "0" (src), "1" (dst) : "memory");
    return dst;
  102e83:	8b 45 f4             	mov    -0xc(%ebp),%eax
    char *p = dst;
    while ((*p ++ = *src ++) != '\0')
        /* nothing */;
    return dst;
#endif /* __HAVE_ARCH_STRCPY */
}
  102e86:	83 c4 20             	add    $0x20,%esp
  102e89:	5e                   	pop    %esi
  102e8a:	5f                   	pop    %edi
  102e8b:	5d                   	pop    %ebp
  102e8c:	c3                   	ret    

00102e8d <strncpy>:
 * @len:    maximum number of characters to be copied from @src
 *
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
  102e8d:	55                   	push   %ebp
  102e8e:	89 e5                	mov    %esp,%ebp
  102e90:	83 ec 10             	sub    $0x10,%esp
    char *p = dst;
  102e93:	8b 45 08             	mov    0x8(%ebp),%eax
  102e96:	89 45 fc             	mov    %eax,-0x4(%ebp)
    while (len > 0) {
  102e99:	eb 21                	jmp    102ebc <strncpy+0x2f>
        if ((*p = *src) != '\0') {
  102e9b:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e9e:	0f b6 10             	movzbl (%eax),%edx
  102ea1:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102ea4:	88 10                	mov    %dl,(%eax)
  102ea6:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102ea9:	0f b6 00             	movzbl (%eax),%eax
  102eac:	84 c0                	test   %al,%al
  102eae:	74 04                	je     102eb4 <strncpy+0x27>
            src ++;
  102eb0:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
        }
        p ++, len --;
  102eb4:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  102eb8:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
    char *p = dst;
    while (len > 0) {
  102ebc:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102ec0:	75 d9                	jne    102e9b <strncpy+0xe>
        if ((*p = *src) != '\0') {
            src ++;
        }
        p ++, len --;
    }
    return dst;
  102ec2:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102ec5:	c9                   	leave  
  102ec6:	c3                   	ret    

00102ec7 <strcmp>:
 * - A value greater than zero indicates that the first character that does
 *   not match has a greater value in @s1 than in @s2;
 * - And a value less than zero indicates the opposite.
 * */
int
strcmp(const char *s1, const char *s2) {
  102ec7:	55                   	push   %ebp
  102ec8:	89 e5                	mov    %esp,%ebp
  102eca:	57                   	push   %edi
  102ecb:	56                   	push   %esi
  102ecc:	83 ec 20             	sub    $0x20,%esp
  102ecf:	8b 45 08             	mov    0x8(%ebp),%eax
  102ed2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102ed5:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ed8:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCMP
#define __HAVE_ARCH_STRCMP
static inline int
__strcmp(const char *s1, const char *s2) {
    int d0, d1, ret;
    asm volatile (
  102edb:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102ede:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102ee1:	89 d1                	mov    %edx,%ecx
  102ee3:	89 c2                	mov    %eax,%edx
  102ee5:	89 ce                	mov    %ecx,%esi
  102ee7:	89 d7                	mov    %edx,%edi
  102ee9:	ac                   	lods   %ds:(%esi),%al
  102eea:	ae                   	scas   %es:(%edi),%al
  102eeb:	75 08                	jne    102ef5 <strcmp+0x2e>
  102eed:	84 c0                	test   %al,%al
  102eef:	75 f8                	jne    102ee9 <strcmp+0x22>
  102ef1:	31 c0                	xor    %eax,%eax
  102ef3:	eb 04                	jmp    102ef9 <strcmp+0x32>
  102ef5:	19 c0                	sbb    %eax,%eax
  102ef7:	0c 01                	or     $0x1,%al
  102ef9:	89 fa                	mov    %edi,%edx
  102efb:	89 f1                	mov    %esi,%ecx
  102efd:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102f00:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  102f03:	89 55 e4             	mov    %edx,-0x1c(%ebp)
            "orb $1, %%al;"
            "3:"
            : "=a" (ret), "=&S" (d0), "=&D" (d1)
            : "1" (s1), "2" (s2)
            : "memory");
    return ret;
  102f06:	8b 45 ec             	mov    -0x14(%ebp),%eax
    while (*s1 != '\0' && *s1 == *s2) {
        s1 ++, s2 ++;
    }
    return (int)((unsigned char)*s1 - (unsigned char)*s2);
#endif /* __HAVE_ARCH_STRCMP */
}
  102f09:	83 c4 20             	add    $0x20,%esp
  102f0c:	5e                   	pop    %esi
  102f0d:	5f                   	pop    %edi
  102f0e:	5d                   	pop    %ebp
  102f0f:	c3                   	ret    

00102f10 <strncmp>:
 * they are equal to each other, it continues with the following pairs until
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
  102f10:	55                   	push   %ebp
  102f11:	89 e5                	mov    %esp,%ebp
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  102f13:	eb 0c                	jmp    102f21 <strncmp+0x11>
        n --, s1 ++, s2 ++;
  102f15:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  102f19:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102f1d:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  102f21:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102f25:	74 1a                	je     102f41 <strncmp+0x31>
  102f27:	8b 45 08             	mov    0x8(%ebp),%eax
  102f2a:	0f b6 00             	movzbl (%eax),%eax
  102f2d:	84 c0                	test   %al,%al
  102f2f:	74 10                	je     102f41 <strncmp+0x31>
  102f31:	8b 45 08             	mov    0x8(%ebp),%eax
  102f34:	0f b6 10             	movzbl (%eax),%edx
  102f37:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f3a:	0f b6 00             	movzbl (%eax),%eax
  102f3d:	38 c2                	cmp    %al,%dl
  102f3f:	74 d4                	je     102f15 <strncmp+0x5>
        n --, s1 ++, s2 ++;
    }
    return (n == 0) ? 0 : (int)((unsigned char)*s1 - (unsigned char)*s2);
  102f41:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102f45:	74 18                	je     102f5f <strncmp+0x4f>
  102f47:	8b 45 08             	mov    0x8(%ebp),%eax
  102f4a:	0f b6 00             	movzbl (%eax),%eax
  102f4d:	0f b6 d0             	movzbl %al,%edx
  102f50:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f53:	0f b6 00             	movzbl (%eax),%eax
  102f56:	0f b6 c0             	movzbl %al,%eax
  102f59:	29 c2                	sub    %eax,%edx
  102f5b:	89 d0                	mov    %edx,%eax
  102f5d:	eb 05                	jmp    102f64 <strncmp+0x54>
  102f5f:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102f64:	5d                   	pop    %ebp
  102f65:	c3                   	ret    

00102f66 <strchr>:
 *
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
  102f66:	55                   	push   %ebp
  102f67:	89 e5                	mov    %esp,%ebp
  102f69:	83 ec 04             	sub    $0x4,%esp
  102f6c:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f6f:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102f72:	eb 14                	jmp    102f88 <strchr+0x22>
        if (*s == c) {
  102f74:	8b 45 08             	mov    0x8(%ebp),%eax
  102f77:	0f b6 00             	movzbl (%eax),%eax
  102f7a:	3a 45 fc             	cmp    -0x4(%ebp),%al
  102f7d:	75 05                	jne    102f84 <strchr+0x1e>
            return (char *)s;
  102f7f:	8b 45 08             	mov    0x8(%ebp),%eax
  102f82:	eb 13                	jmp    102f97 <strchr+0x31>
        }
        s ++;
  102f84:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
    while (*s != '\0') {
  102f88:	8b 45 08             	mov    0x8(%ebp),%eax
  102f8b:	0f b6 00             	movzbl (%eax),%eax
  102f8e:	84 c0                	test   %al,%al
  102f90:	75 e2                	jne    102f74 <strchr+0xe>
        if (*s == c) {
            return (char *)s;
        }
        s ++;
    }
    return NULL;
  102f92:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102f97:	c9                   	leave  
  102f98:	c3                   	ret    

00102f99 <strfind>:
 * The strfind() function is like strchr() except that if @c is
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
  102f99:	55                   	push   %ebp
  102f9a:	89 e5                	mov    %esp,%ebp
  102f9c:	83 ec 04             	sub    $0x4,%esp
  102f9f:	8b 45 0c             	mov    0xc(%ebp),%eax
  102fa2:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102fa5:	eb 11                	jmp    102fb8 <strfind+0x1f>
        if (*s == c) {
  102fa7:	8b 45 08             	mov    0x8(%ebp),%eax
  102faa:	0f b6 00             	movzbl (%eax),%eax
  102fad:	3a 45 fc             	cmp    -0x4(%ebp),%al
  102fb0:	75 02                	jne    102fb4 <strfind+0x1b>
            break;
  102fb2:	eb 0e                	jmp    102fc2 <strfind+0x29>
        }
        s ++;
  102fb4:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
    while (*s != '\0') {
  102fb8:	8b 45 08             	mov    0x8(%ebp),%eax
  102fbb:	0f b6 00             	movzbl (%eax),%eax
  102fbe:	84 c0                	test   %al,%al
  102fc0:	75 e5                	jne    102fa7 <strfind+0xe>
        if (*s == c) {
            break;
        }
        s ++;
    }
    return (char *)s;
  102fc2:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102fc5:	c9                   	leave  
  102fc6:	c3                   	ret    

00102fc7 <strtol>:
 * an optional "0x" or "0X" prefix.
 *
 * The strtol() function returns the converted integral number as a long int value.
 * */
long
strtol(const char *s, char **endptr, int base) {
  102fc7:	55                   	push   %ebp
  102fc8:	89 e5                	mov    %esp,%ebp
  102fca:	83 ec 10             	sub    $0x10,%esp
    int neg = 0;
  102fcd:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    long val = 0;
  102fd4:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  102fdb:	eb 04                	jmp    102fe1 <strtol+0x1a>
        s ++;
  102fdd:	83 45 08 01          	addl   $0x1,0x8(%ebp)
strtol(const char *s, char **endptr, int base) {
    int neg = 0;
    long val = 0;

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  102fe1:	8b 45 08             	mov    0x8(%ebp),%eax
  102fe4:	0f b6 00             	movzbl (%eax),%eax
  102fe7:	3c 20                	cmp    $0x20,%al
  102fe9:	74 f2                	je     102fdd <strtol+0x16>
  102feb:	8b 45 08             	mov    0x8(%ebp),%eax
  102fee:	0f b6 00             	movzbl (%eax),%eax
  102ff1:	3c 09                	cmp    $0x9,%al
  102ff3:	74 e8                	je     102fdd <strtol+0x16>
        s ++;
    }

    // plus/minus sign
    if (*s == '+') {
  102ff5:	8b 45 08             	mov    0x8(%ebp),%eax
  102ff8:	0f b6 00             	movzbl (%eax),%eax
  102ffb:	3c 2b                	cmp    $0x2b,%al
  102ffd:	75 06                	jne    103005 <strtol+0x3e>
        s ++;
  102fff:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  103003:	eb 15                	jmp    10301a <strtol+0x53>
    }
    else if (*s == '-') {
  103005:	8b 45 08             	mov    0x8(%ebp),%eax
  103008:	0f b6 00             	movzbl (%eax),%eax
  10300b:	3c 2d                	cmp    $0x2d,%al
  10300d:	75 0b                	jne    10301a <strtol+0x53>
        s ++, neg = 1;
  10300f:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  103013:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
    }

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x')) {
  10301a:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  10301e:	74 06                	je     103026 <strtol+0x5f>
  103020:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
  103024:	75 24                	jne    10304a <strtol+0x83>
  103026:	8b 45 08             	mov    0x8(%ebp),%eax
  103029:	0f b6 00             	movzbl (%eax),%eax
  10302c:	3c 30                	cmp    $0x30,%al
  10302e:	75 1a                	jne    10304a <strtol+0x83>
  103030:	8b 45 08             	mov    0x8(%ebp),%eax
  103033:	83 c0 01             	add    $0x1,%eax
  103036:	0f b6 00             	movzbl (%eax),%eax
  103039:	3c 78                	cmp    $0x78,%al
  10303b:	75 0d                	jne    10304a <strtol+0x83>
        s += 2, base = 16;
  10303d:	83 45 08 02          	addl   $0x2,0x8(%ebp)
  103041:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
  103048:	eb 2a                	jmp    103074 <strtol+0xad>
    }
    else if (base == 0 && s[0] == '0') {
  10304a:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  10304e:	75 17                	jne    103067 <strtol+0xa0>
  103050:	8b 45 08             	mov    0x8(%ebp),%eax
  103053:	0f b6 00             	movzbl (%eax),%eax
  103056:	3c 30                	cmp    $0x30,%al
  103058:	75 0d                	jne    103067 <strtol+0xa0>
        s ++, base = 8;
  10305a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  10305e:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
  103065:	eb 0d                	jmp    103074 <strtol+0xad>
    }
    else if (base == 0) {
  103067:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  10306b:	75 07                	jne    103074 <strtol+0xad>
        base = 10;
  10306d:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9') {
  103074:	8b 45 08             	mov    0x8(%ebp),%eax
  103077:	0f b6 00             	movzbl (%eax),%eax
  10307a:	3c 2f                	cmp    $0x2f,%al
  10307c:	7e 1b                	jle    103099 <strtol+0xd2>
  10307e:	8b 45 08             	mov    0x8(%ebp),%eax
  103081:	0f b6 00             	movzbl (%eax),%eax
  103084:	3c 39                	cmp    $0x39,%al
  103086:	7f 11                	jg     103099 <strtol+0xd2>
            dig = *s - '0';
  103088:	8b 45 08             	mov    0x8(%ebp),%eax
  10308b:	0f b6 00             	movzbl (%eax),%eax
  10308e:	0f be c0             	movsbl %al,%eax
  103091:	83 e8 30             	sub    $0x30,%eax
  103094:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103097:	eb 48                	jmp    1030e1 <strtol+0x11a>
        }
        else if (*s >= 'a' && *s <= 'z') {
  103099:	8b 45 08             	mov    0x8(%ebp),%eax
  10309c:	0f b6 00             	movzbl (%eax),%eax
  10309f:	3c 60                	cmp    $0x60,%al
  1030a1:	7e 1b                	jle    1030be <strtol+0xf7>
  1030a3:	8b 45 08             	mov    0x8(%ebp),%eax
  1030a6:	0f b6 00             	movzbl (%eax),%eax
  1030a9:	3c 7a                	cmp    $0x7a,%al
  1030ab:	7f 11                	jg     1030be <strtol+0xf7>
            dig = *s - 'a' + 10;
  1030ad:	8b 45 08             	mov    0x8(%ebp),%eax
  1030b0:	0f b6 00             	movzbl (%eax),%eax
  1030b3:	0f be c0             	movsbl %al,%eax
  1030b6:	83 e8 57             	sub    $0x57,%eax
  1030b9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1030bc:	eb 23                	jmp    1030e1 <strtol+0x11a>
        }
        else if (*s >= 'A' && *s <= 'Z') {
  1030be:	8b 45 08             	mov    0x8(%ebp),%eax
  1030c1:	0f b6 00             	movzbl (%eax),%eax
  1030c4:	3c 40                	cmp    $0x40,%al
  1030c6:	7e 3d                	jle    103105 <strtol+0x13e>
  1030c8:	8b 45 08             	mov    0x8(%ebp),%eax
  1030cb:	0f b6 00             	movzbl (%eax),%eax
  1030ce:	3c 5a                	cmp    $0x5a,%al
  1030d0:	7f 33                	jg     103105 <strtol+0x13e>
            dig = *s - 'A' + 10;
  1030d2:	8b 45 08             	mov    0x8(%ebp),%eax
  1030d5:	0f b6 00             	movzbl (%eax),%eax
  1030d8:	0f be c0             	movsbl %al,%eax
  1030db:	83 e8 37             	sub    $0x37,%eax
  1030de:	89 45 f4             	mov    %eax,-0xc(%ebp)
        }
        else {
            break;
        }
        if (dig >= base) {
  1030e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1030e4:	3b 45 10             	cmp    0x10(%ebp),%eax
  1030e7:	7c 02                	jl     1030eb <strtol+0x124>
            break;
  1030e9:	eb 1a                	jmp    103105 <strtol+0x13e>
        }
        s ++, val = (val * base) + dig;
  1030eb:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  1030ef:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1030f2:	0f af 45 10          	imul   0x10(%ebp),%eax
  1030f6:	89 c2                	mov    %eax,%edx
  1030f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1030fb:	01 d0                	add    %edx,%eax
  1030fd:	89 45 f8             	mov    %eax,-0x8(%ebp)
        // we don't properly detect overflow!
    }
  103100:	e9 6f ff ff ff       	jmp    103074 <strtol+0xad>

    if (endptr) {
  103105:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  103109:	74 08                	je     103113 <strtol+0x14c>
        *endptr = (char *) s;
  10310b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10310e:	8b 55 08             	mov    0x8(%ebp),%edx
  103111:	89 10                	mov    %edx,(%eax)
    }
    return (neg ? -val : val);
  103113:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  103117:	74 07                	je     103120 <strtol+0x159>
  103119:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10311c:	f7 d8                	neg    %eax
  10311e:	eb 03                	jmp    103123 <strtol+0x15c>
  103120:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  103123:	c9                   	leave  
  103124:	c3                   	ret    

00103125 <memset>:
 * @n:        number of bytes to be set to the value
 *
 * The memset() function returns @s.
 * */
void *
memset(void *s, char c, size_t n) {
  103125:	55                   	push   %ebp
  103126:	89 e5                	mov    %esp,%ebp
  103128:	57                   	push   %edi
  103129:	83 ec 24             	sub    $0x24,%esp
  10312c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10312f:	88 45 d8             	mov    %al,-0x28(%ebp)
#ifdef __HAVE_ARCH_MEMSET
    return __memset(s, c, n);
  103132:	0f be 45 d8          	movsbl -0x28(%ebp),%eax
  103136:	8b 55 08             	mov    0x8(%ebp),%edx
  103139:	89 55 f8             	mov    %edx,-0x8(%ebp)
  10313c:	88 45 f7             	mov    %al,-0x9(%ebp)
  10313f:	8b 45 10             	mov    0x10(%ebp),%eax
  103142:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_MEMSET
#define __HAVE_ARCH_MEMSET
static inline void *
__memset(void *s, char c, size_t n) {
    int d0, d1;
    asm volatile (
  103145:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  103148:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  10314c:	8b 55 f8             	mov    -0x8(%ebp),%edx
  10314f:	89 d7                	mov    %edx,%edi
  103151:	f3 aa                	rep stos %al,%es:(%edi)
  103153:	89 fa                	mov    %edi,%edx
  103155:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  103158:	89 55 e8             	mov    %edx,-0x18(%ebp)
            "rep; stosb;"
            : "=&c" (d0), "=&D" (d1)
            : "0" (n), "a" (c), "1" (s)
            : "memory");
    return s;
  10315b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    while (n -- > 0) {
        *p ++ = c;
    }
    return s;
#endif /* __HAVE_ARCH_MEMSET */
}
  10315e:	83 c4 24             	add    $0x24,%esp
  103161:	5f                   	pop    %edi
  103162:	5d                   	pop    %ebp
  103163:	c3                   	ret    

00103164 <memmove>:
 * @n:        number of bytes to copy
 *
 * The memmove() function returns @dst.
 * */
void *
memmove(void *dst, const void *src, size_t n) {
  103164:	55                   	push   %ebp
  103165:	89 e5                	mov    %esp,%ebp
  103167:	57                   	push   %edi
  103168:	56                   	push   %esi
  103169:	53                   	push   %ebx
  10316a:	83 ec 30             	sub    $0x30,%esp
  10316d:	8b 45 08             	mov    0x8(%ebp),%eax
  103170:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103173:	8b 45 0c             	mov    0xc(%ebp),%eax
  103176:	89 45 ec             	mov    %eax,-0x14(%ebp)
  103179:	8b 45 10             	mov    0x10(%ebp),%eax
  10317c:	89 45 e8             	mov    %eax,-0x18(%ebp)

#ifndef __HAVE_ARCH_MEMMOVE
#define __HAVE_ARCH_MEMMOVE
static inline void *
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
  10317f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103182:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  103185:	73 42                	jae    1031c9 <memmove+0x65>
  103187:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10318a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  10318d:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103190:	89 45 e0             	mov    %eax,-0x20(%ebp)
  103193:	8b 45 e8             	mov    -0x18(%ebp),%eax
  103196:	89 45 dc             	mov    %eax,-0x24(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  103199:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10319c:	c1 e8 02             	shr    $0x2,%eax
  10319f:	89 c1                	mov    %eax,%ecx
#ifndef __HAVE_ARCH_MEMCPY
#define __HAVE_ARCH_MEMCPY
static inline void *
__memcpy(void *dst, const void *src, size_t n) {
    int d0, d1, d2;
    asm volatile (
  1031a1:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  1031a4:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1031a7:	89 d7                	mov    %edx,%edi
  1031a9:	89 c6                	mov    %eax,%esi
  1031ab:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1031ad:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  1031b0:	83 e1 03             	and    $0x3,%ecx
  1031b3:	74 02                	je     1031b7 <memmove+0x53>
  1031b5:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  1031b7:	89 f0                	mov    %esi,%eax
  1031b9:	89 fa                	mov    %edi,%edx
  1031bb:	89 4d d8             	mov    %ecx,-0x28(%ebp)
  1031be:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  1031c1:	89 45 d0             	mov    %eax,-0x30(%ebp)
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
            : "memory");
    return dst;
  1031c4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1031c7:	eb 36                	jmp    1031ff <memmove+0x9b>
    asm volatile (
            "std;"
            "rep; movsb;"
            "cld;"
            : "=&c" (d0), "=&S" (d1), "=&D" (d2)
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
  1031c9:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1031cc:	8d 50 ff             	lea    -0x1(%eax),%edx
  1031cf:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1031d2:	01 c2                	add    %eax,%edx
  1031d4:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1031d7:	8d 48 ff             	lea    -0x1(%eax),%ecx
  1031da:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1031dd:	8d 1c 01             	lea    (%ecx,%eax,1),%ebx
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
        return __memcpy(dst, src, n);
    }
    int d0, d1, d2;
    asm volatile (
  1031e0:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1031e3:	89 c1                	mov    %eax,%ecx
  1031e5:	89 d8                	mov    %ebx,%eax
  1031e7:	89 d6                	mov    %edx,%esi
  1031e9:	89 c7                	mov    %eax,%edi
  1031eb:	fd                   	std    
  1031ec:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  1031ee:	fc                   	cld    
  1031ef:	89 f8                	mov    %edi,%eax
  1031f1:	89 f2                	mov    %esi,%edx
  1031f3:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  1031f6:	89 55 c8             	mov    %edx,-0x38(%ebp)
  1031f9:	89 45 c4             	mov    %eax,-0x3c(%ebp)
            "rep; movsb;"
            "cld;"
            : "=&c" (d0), "=&S" (d1), "=&D" (d2)
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
            : "memory");
    return dst;
  1031fc:	8b 45 f0             	mov    -0x10(%ebp),%eax
            *d ++ = *s ++;
        }
    }
    return dst;
#endif /* __HAVE_ARCH_MEMMOVE */
}
  1031ff:	83 c4 30             	add    $0x30,%esp
  103202:	5b                   	pop    %ebx
  103203:	5e                   	pop    %esi
  103204:	5f                   	pop    %edi
  103205:	5d                   	pop    %ebp
  103206:	c3                   	ret    

00103207 <memcpy>:
 * it always copies exactly @n bytes. To avoid overflows, the size of arrays pointed
 * by both @src and @dst, should be at least @n bytes, and should not overlap
 * (for overlapping memory area, memmove is a safer approach).
 * */
void *
memcpy(void *dst, const void *src, size_t n) {
  103207:	55                   	push   %ebp
  103208:	89 e5                	mov    %esp,%ebp
  10320a:	57                   	push   %edi
  10320b:	56                   	push   %esi
  10320c:	83 ec 20             	sub    $0x20,%esp
  10320f:	8b 45 08             	mov    0x8(%ebp),%eax
  103212:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103215:	8b 45 0c             	mov    0xc(%ebp),%eax
  103218:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10321b:	8b 45 10             	mov    0x10(%ebp),%eax
  10321e:	89 45 ec             	mov    %eax,-0x14(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  103221:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103224:	c1 e8 02             	shr    $0x2,%eax
  103227:	89 c1                	mov    %eax,%ecx
#ifndef __HAVE_ARCH_MEMCPY
#define __HAVE_ARCH_MEMCPY
static inline void *
__memcpy(void *dst, const void *src, size_t n) {
    int d0, d1, d2;
    asm volatile (
  103229:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10322c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10322f:	89 d7                	mov    %edx,%edi
  103231:	89 c6                	mov    %eax,%esi
  103233:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  103235:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  103238:	83 e1 03             	and    $0x3,%ecx
  10323b:	74 02                	je     10323f <memcpy+0x38>
  10323d:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  10323f:	89 f0                	mov    %esi,%eax
  103241:	89 fa                	mov    %edi,%edx
  103243:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  103246:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  103249:	89 45 e0             	mov    %eax,-0x20(%ebp)
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
            : "memory");
    return dst;
  10324c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    while (n -- > 0) {
        *d ++ = *s ++;
    }
    return dst;
#endif /* __HAVE_ARCH_MEMCPY */
}
  10324f:	83 c4 20             	add    $0x20,%esp
  103252:	5e                   	pop    %esi
  103253:	5f                   	pop    %edi
  103254:	5d                   	pop    %ebp
  103255:	c3                   	ret    

00103256 <memcmp>:
 *   match in both memory blocks has a greater value in @v1 than in @v2
 *   as if evaluated as unsigned char values;
 * - And a value less than zero indicates the opposite.
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
  103256:	55                   	push   %ebp
  103257:	89 e5                	mov    %esp,%ebp
  103259:	83 ec 10             	sub    $0x10,%esp
    const char *s1 = (const char *)v1;
  10325c:	8b 45 08             	mov    0x8(%ebp),%eax
  10325f:	89 45 fc             	mov    %eax,-0x4(%ebp)
    const char *s2 = (const char *)v2;
  103262:	8b 45 0c             	mov    0xc(%ebp),%eax
  103265:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (n -- > 0) {
  103268:	eb 30                	jmp    10329a <memcmp+0x44>
        if (*s1 != *s2) {
  10326a:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10326d:	0f b6 10             	movzbl (%eax),%edx
  103270:	8b 45 f8             	mov    -0x8(%ebp),%eax
  103273:	0f b6 00             	movzbl (%eax),%eax
  103276:	38 c2                	cmp    %al,%dl
  103278:	74 18                	je     103292 <memcmp+0x3c>
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
  10327a:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10327d:	0f b6 00             	movzbl (%eax),%eax
  103280:	0f b6 d0             	movzbl %al,%edx
  103283:	8b 45 f8             	mov    -0x8(%ebp),%eax
  103286:	0f b6 00             	movzbl (%eax),%eax
  103289:	0f b6 c0             	movzbl %al,%eax
  10328c:	29 c2                	sub    %eax,%edx
  10328e:	89 d0                	mov    %edx,%eax
  103290:	eb 1a                	jmp    1032ac <memcmp+0x56>
        }
        s1 ++, s2 ++;
  103292:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  103296:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
    const char *s1 = (const char *)v1;
    const char *s2 = (const char *)v2;
    while (n -- > 0) {
  10329a:	8b 45 10             	mov    0x10(%ebp),%eax
  10329d:	8d 50 ff             	lea    -0x1(%eax),%edx
  1032a0:	89 55 10             	mov    %edx,0x10(%ebp)
  1032a3:	85 c0                	test   %eax,%eax
  1032a5:	75 c3                	jne    10326a <memcmp+0x14>
        if (*s1 != *s2) {
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
        }
        s1 ++, s2 ++;
    }
    return 0;
  1032a7:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1032ac:	c9                   	leave  
  1032ad:	c3                   	ret    
