/* Hey guys, this one is tougher than the previous two. Since the code looks more sloppy. 
 * In fact, many parts of code you see here are from the libc dynamic linked libary, which I can't understand at all. 
 * So the strategy is :
 * Start reading the code after fgets is being called, and see what the program does to your input string.
 * only read the portion when comments begin to show up.
 */

Disassembly of section .text:
080483a0 <.text>:
 80483a0:	31 ed                	xor    %ebp,%ebp
 80483a2:	5e                   	pop    %esi
 80483a3:	89 e1                	mov    %esp,%ecx
 80483a5:	83 e4 f0             	and    $0xfffffff0,%esp
 80483a8:	50                   	push   %eax
 80483a9:	54                   	push   %esp
 80483aa:	52                   	push   %edx
 80483ab:	68 30 85 04 08       	push   $0x8048530
 80483b0:	68 40 85 04 08       	push   $0x8048540
 80483b5:	51                   	push   %ecx
 80483b6:	56                   	push   %esi
 80483b7:	68 17 85 04 08       	push   $0x8048517
 80483bc:	e8 97 ff ff ff       	call   8048358 <__libc_start_main@plt>
 80483c1:	f4                   	hlt    
 80483c2:	90                   	nop
 80483c3:	90                   	nop
 80483c4:	90                   	nop
 80483c5:	90                   	nop
 80483c6:	90                   	nop
 80483c7:	90                   	nop
 80483c8:	90                   	nop
 80483c9:	90                   	nop
 80483ca:	90                   	nop
 80483cb:	90                   	nop
 80483cc:	90                   	nop
 80483cd:	90                   	nop
 80483ce:	90                   	nop
 80483cf:	90                   	nop
 80483d0:	55                   	push   %ebp
 80483d1:	89 e5                	mov    %esp,%ebp
 80483d3:	53                   	push   %ebx
 80483d4:	83 ec 04             	sub    $0x4,%esp
 80483d7:	80 3d e4 98 04 08 00 	cmpb   $0x0,0x80498e4
 80483de:	75 3f                	jne    804841f <tolower@plt+0x97>
 80483e0:	a1 e8 98 04 08       	mov    0x80498e8,%eax
 80483e5:	bb e8 97 04 08       	mov    $0x80497e8,%ebx
 80483ea:	81 eb e4 97 04 08    	sub    $0x80497e4,%ebx
 80483f0:	c1 fb 02             	sar    $0x2,%ebx
 80483f3:	83 eb 01             	sub    $0x1,%ebx
 80483f6:	39 d8                	cmp    %ebx,%eax
 80483f8:	73 1e                	jae    8048418 <tolower@plt+0x90>
 80483fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8048400:	83 c0 01             	add    $0x1,%eax
 8048403:	a3 e8 98 04 08       	mov    %eax,0x80498e8
 8048408:	ff 14 85 e4 97 04 08 	call   *0x80497e4(,%eax,4)
 804840f:	a1 e8 98 04 08       	mov    0x80498e8,%eax
 8048414:	39 d8                	cmp    %ebx,%eax
 8048416:	72 e8                	jb     8048400 <tolower@plt+0x78>
 8048418:	c6 05 e4 98 04 08 01 	movb   $0x1,0x80498e4
 804841f:	83 c4 04             	add    $0x4,%esp
 8048422:	5b                   	pop    %ebx
 8048423:	5d                   	pop    %ebp
 8048424:	c3                   	ret    
 8048425:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8048429:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 8048430:	55                   	push   %ebp
 8048431:	89 e5                	mov    %esp,%ebp
 8048433:	83 ec 18             	sub    $0x18,%esp
 8048436:	a1 ec 97 04 08       	mov    0x80497ec,%eax
 804843b:	85 c0                	test   %eax,%eax
 804843d:	74 12                	je     8048451 <tolower@plt+0xc9>
 804843f:	b8 00 00 00 00       	mov    $0x0,%eax
 8048444:	85 c0                	test   %eax,%eax
 8048446:	74 09                	je     8048451 <tolower@plt+0xc9>
 8048448:	c7 04 24 ec 97 04 08 	movl   $0x80497ec,(%esp)
 804844f:	ff d0                	call   *%eax
 8048451:	c9                   	leave  
 8048452:	c3                   	ret    
 8048453:	90                   	nop
 8048454:	55                   	push   %ebp
 8048455:	89 e5                	mov    %esp,%ebp
 8048457:	53                   	push   %ebx
 8048458:	83 ec 34             	sub    $0x34,%esp

 /*
  * start reading from here (also set a break point at address 0x804845b)
  * get 10 straight characters from the input and save them in address -0x1b($ebp)
  */

 804845b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)                 int cnt2 = 0; // the address of cnt2 is -0x10($ebp)
 8048462:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)                  int cnt = 0;//   the addresss of cnt1 -0xc($ebp)
 8048469:	eb 10                	jmp    804847b <tolower@plt+0xf3>       while(cnt <= 9){
 804846b:	8b 5d f4             	mov    -0xc(%ebp),%ebx                       
 804846e:	e8 c5 fe ff ff       	call   8048338 <getchar@plt>              int c = getchar(); 
 8048473:	88 44 1d e5          	mov    %al,-0x1b(%ebp,%ebx,1)             input_str[cnt] = c;
 8048477:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)                    cnt++;
 804847b:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)                   
 804847f:	7e ea                	jle    804846b <tolower@plt+0xe3>       }
 8048481:	8b 45 f4             	mov    -0xc(%ebp),%eax                  
 8048484:	c6 44 05 e5 00       	movb   $0x0,-0x1b(%ebp,%eax,1)           intput_str[cnt] = '\0';
 8048489:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)                   cnt = 1;
 8048490:	eb 30                	jmp    80484c2 <tolower@plt+0x13a>       while(cnt <= 10){ 
 8048492:	8b 45 f4             	mov    -0xc(%ebp),%eax                        int index = cnt - 1;
 8048495:	83 e8 01             	sub    $0x1,%eax
 8048498:	0f b6 44 05 e5       	movzbl -0x1b(%ebp,%eax,1),%eax                int lower = tolower(*(intput_str + index));
 804849d:	0f be c0             	movsbl %al,%eax
 80484a0:	89 04 24             	mov    %eax,(%esp)
 80484a3:	e8 e0 fe ff ff       	call   8048388 <tolower@plt>
 80484a8:	83 e8 21             	sub    $0x21,%eax
 80484ab:	83 f8 3d             	cmp    $0x3d,%eax                              if(lower - 33 > 61) goto 0x80484be; 
 80484ae:	77 0e                	ja     80484be <tolower@plt+0x136>        
                                                                                   /*key part of the program, need to figure out by yourself*/
 80484b0:	8b 04 85 38 86 04 08 	mov    0x8048638(,%eax,4),%eax                 else{ lower = 4 * (lower - 33);
80484b7:	ff e0                	jmp    *%eax                                   goto address[lower]; //address is an array of address begin at 0x8048638, type "x/w 0x8048638" in gdb to see what addresses are contained in that array
 80484b9:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)                        cnt2++; 
 80484bd:	90                   	nop                                            }
 80484be:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)                         cnt++;

 80484c2:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)                   }
 80484c6:	7e ca                	jle    8048492 <tolower@plt+0x10a>

 80484c8:	83 7d f0 06          	cmpl   $0x6,-0x10(%ebp)                  if(cnt2 == 6){
 80484cc:	75 16                	jne    80484e4 <tolower@plt+0x15c>         printf("congradulations!...");
 80484ce:	b8 f4 85 04 08       	mov    $0x80485f4,%eax                   
 80484d3:	8d 55 e5             	lea    -0x1b(%ebp),%edx
 80484d6:	89 54 24 04          	mov    %edx,0x4(%esp)
 80484da:	89 04 24             	mov    %eax,(%esp)
 80484dd:	e8 86 fe ff ff       	call   8048368 <printf@plt>
 80484e2:	eb 0c                	jmp    80484f0 <tolower@plt+0x168>
 80484e4:	c7 04 24 22 86 04 08 	movl   $0x8048622,(%esp)                 }else{
 80484eb:	e8 88 fe ff ff       	call   8048378 <puts@plt>                  puts("Sorry! Not correct!");
 80484f0:	83 c4 34             	add    $0x34,%esp                          ...
 80484f3:	5b                   	pop    %ebx        
 80484f4:	5d                   	pop    %ebp
 80484f5:	c3                   	ret                                      }
 80484f6:	55                   	push   %ebp
 80484f7:	89 e5                	mov    %esp,%ebp
 80484f9:	83 ec 08             	sub    $0x8,%esp
 80484fc:	e8 53 ff ff ff       	call   8048454 <tolower@plt+0xcc>
 8048501:	c9                   	leave  
 8048502:	c3                   	ret    
 8048503:	55                   	push   %ebp
 8048504:	89 e5                	mov    %esp,%ebp
 8048506:	83 ec 18             	sub    $0x18,%esp
 8048509:	c7 45 f4 30 87 04 08 	movl   $0x8048730,-0xc(%ebp)
 8048510:	e8 e1 ff ff ff       	call   80484f6 <tolower@plt+0x16e>
 8048515:	c9                   	leave  
 8048516:	c3                   	ret    
 8048517:	55                   	push   %ebp
 8048518:	89 e5                	mov    %esp,%ebp
 804851a:	83 e4 f0             	and    $0xfffffff0,%esp
 804851d:	e8 e1 ff ff ff       	call   8048503 <tolower@plt+0x17b>
 8048522:	89 ec                	mov    %ebp,%esp
 8048524:	5d                   	pop    %ebp
 8048525:	c3                   	ret    
 8048526:	90                   	nop
 8048527:	90                   	nop
 8048528:	90                   	nop
 8048529:	90                   	nop
 804852a:	90                   	nop
 804852b:	90                   	nop
 804852c:	90                   	nop
 804852d:	90                   	nop
 804852e:	90                   	nop
 804852f:	90                   	nop
 8048530:	55                   	push   %ebp
 8048531:	89 e5                	mov    %esp,%ebp
 8048533:	5d                   	pop    %ebp
 8048534:	c3                   	ret    
 8048535:	66 66 2e 0f 1f 84 00 	data32 nopw %cs:0x0(%eax,%eax,1)
 804853c:	00 00 00 00 
 8048540:	55                   	push   %ebp
 8048541:	89 e5                	mov    %esp,%ebp
 8048543:	57                   	push   %edi
 8048544:	56                   	push   %esi
 8048545:	53                   	push   %ebx
 8048546:	e8 4f 00 00 00       	call   804859a <tolower@plt+0x212>
 804854b:	81 c3 71 13 00 00    	add    $0x1371,%ebx
 8048551:	83 ec 1c             	sub    $0x1c,%esp
 8048554:	e8 9f fd ff ff       	call   80482f8 <getchar@plt-0x40>
 8048559:	8d bb 20 ff ff ff    	lea    -0xe0(%ebx),%edi
 804855f:	8d 83 20 ff ff ff    	lea    -0xe0(%ebx),%eax
 8048565:	29 c7                	sub    %eax,%edi
 8048567:	c1 ff 02             	sar    $0x2,%edi
 804856a:	85 ff                	test   %edi,%edi
 804856c:	74 24                	je     8048592 <tolower@plt+0x20a>
 804856e:	31 f6                	xor    %esi,%esi
 8048570:	8b 45 10             	mov    0x10(%ebp),%eax
 8048573:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048577:	8b 45 0c             	mov    0xc(%ebp),%eax
 804857a:	89 44 24 04          	mov    %eax,0x4(%esp)
 804857e:	8b 45 08             	mov    0x8(%ebp),%eax
 8048581:	89 04 24             	mov    %eax,(%esp)
 8048584:	ff 94 b3 20 ff ff ff 	call   *-0xe0(%ebx,%esi,4)
 804858b:	83 c6 01             	add    $0x1,%esi
 804858e:	39 fe                	cmp    %edi,%esi
 8048590:	72 de                	jb     8048570 <tolower@plt+0x1e8>
 8048592:	83 c4 1c             	add    $0x1c,%esp
 8048595:	5b                   	pop    %ebx
 8048596:	5e                   	pop    %esi
 8048597:	5f                   	pop    %edi
 8048598:	5d                   	pop    %ebp
 8048599:	c3                   	ret    
 804859a:	8b 1c 24             	mov    (%esp),%ebx
 804859d:	c3                   	ret    
 804859e:	90                   	nop
 804859f:	90                   	nop
 80485a0:	55                   	push   %ebp
 80485a1:	89 e5                	mov    %esp,%ebp
 80485a3:	53                   	push   %ebx
 80485a4:	83 ec 04             	sub    $0x4,%esp
 80485a7:	a1 dc 97 04 08       	mov    0x80497dc,%eax
 80485ac:	83 f8 ff             	cmp    $0xffffffff,%eax
 80485af:	74 13                	je     80485c4 <tolower@plt+0x23c>
 80485b1:	bb dc 97 04 08       	mov    $0x80497dc,%ebx
 80485b6:	66 90                	xchg   %ax,%ax
 80485b8:	83 eb 04             	sub    $0x4,%ebx
 80485bb:	ff d0                	call   *%eax
 80485bd:	8b 03                	mov    (%ebx),%eax
 80485bf:	83 f8 ff             	cmp    $0xffffffff,%eax
 80485c2:	75 f4                	jne    80485b8 <tolower@plt+0x230>
 80485c4:	83 c4 04             	add    $0x4,%esp
 80485c7:	5b                   	pop    %ebx
 80485c8:	5d                   	pop    %ebp
 80485c9:	c3                   	ret    
 80485ca:	90                   	nop
 80485cb:	90                   	nop
