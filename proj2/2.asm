
cwl12_2:     file format elf32-i386


Disassembly of section .init:

08048338 <_init>:
 8048338:	55                   	push   %ebp
 8048339:	89 e5                	mov    %esp,%ebp
 804833b:	53                   	push   %ebx
 804833c:	83 ec 04             	sub    $0x4,%esp
 804833f:	e8 00 00 00 00       	call   8048344 <_init+0xc>
 8048344:	5b                   	pop    %ebx
 8048345:	81 c3 64 15 00 00    	add    $0x1564,%ebx
 804834b:	8b 93 fc ff ff ff    	mov    -0x4(%ebx),%edx
 8048351:	85 d2                	test   %edx,%edx
 8048353:	74 05                	je     804835a <_init+0x22>
 8048355:	e8 1e 00 00 00       	call   8048378 <__gmon_start__@plt>
 804835a:	e8 21 01 00 00       	call   8048480 <frame_dummy>
 804835f:	e8 2c 03 00 00       	call   8048690 <__do_global_ctors_aux>
 8048364:	58                   	pop    %eax
 8048365:	5b                   	pop    %ebx
 8048366:	c9                   	leave  
 8048367:	c3                   	ret    

Disassembly of section .plt:

08048368 <__gmon_start__@plt-0x10>:
 8048368:	ff 35 ac 98 04 08    	pushl  0x80498ac
 804836e:	ff 25 b0 98 04 08    	jmp    *0x80498b0
 8048374:	00 00                	add    %al,(%eax)
	...

08048378 <__gmon_start__@plt>:
 8048378:	ff 25 b4 98 04 08    	jmp    *0x80498b4
 804837e:	68 00 00 00 00       	push   $0x0
 8048383:	e9 e0 ff ff ff       	jmp    8048368 <_init+0x30>

08048388 <fgets@plt>:
 8048388:	ff 25 b8 98 04 08    	jmp    *0x80498b8
 804838e:	68 08 00 00 00       	push   $0x8
 8048393:	e9 d0 ff ff ff       	jmp    8048368 <_init+0x30>

08048398 <__libc_start_main@plt>:
 8048398:	ff 25 bc 98 04 08    	jmp    *0x80498bc
 804839e:	68 10 00 00 00       	push   $0x10
 80483a3:	e9 c0 ff ff ff       	jmp    8048368 <_init+0x30>

080483a8 <strcpy@plt>:
 80483a8:	ff 25 c0 98 04 08    	jmp    *0x80498c0
 80483ae:	68 18 00 00 00       	push   $0x18
 80483b3:	e9 b0 ff ff ff       	jmp    8048368 <_init+0x30>

080483b8 <printf@plt>:
 80483b8:	ff 25 c4 98 04 08    	jmp    *0x80498c4
 80483be:	68 20 00 00 00       	push   $0x20
 80483c3:	e9 a0 ff ff ff       	jmp    8048368 <_init+0x30>

080483c8 <puts@plt>:
 80483c8:	ff 25 c8 98 04 08    	jmp    *0x80498c8
 80483ce:	68 28 00 00 00       	push   $0x28
 80483d3:	e9 90 ff ff ff       	jmp    8048368 <_init+0x30>

080483d8 <strcmp@plt>:
 80483d8:	ff 25 cc 98 04 08    	jmp    *0x80498cc
 80483de:	68 30 00 00 00       	push   $0x30
 80483e3:	e9 80 ff ff ff       	jmp    8048368 <_init+0x30>

Disassembly of section .text:

080483f0 <_start>:
 80483f0:	31 ed                	xor    %ebp,%ebp
 80483f2:	5e                   	pop    %esi
 80483f3:	89 e1                	mov    %esp,%ecx
 80483f5:	83 e4 f0             	and    $0xfffffff0,%esp
 80483f8:	50                   	push   %eax
 80483f9:	54                   	push   %esp
 80483fa:	52                   	push   %edx
 80483fb:	68 20 86 04 08       	push   $0x8048620
 8048400:	68 30 86 04 08       	push   $0x8048630
 8048405:	51                   	push   %ecx
 8048406:	56                   	push   %esi
 8048407:	68 47 85 04 08       	push   $0x8048547
 804840c:	e8 87 ff ff ff       	call   8048398 <__libc_start_main@plt>
 8048411:	f4                   	hlt    
 8048412:	90                   	nop
 8048413:	90                   	nop
 8048414:	90                   	nop
 8048415:	90                   	nop
 8048416:	90                   	nop
 8048417:	90                   	nop
 8048418:	90                   	nop
 8048419:	90                   	nop
 804841a:	90                   	nop
 804841b:	90                   	nop
 804841c:	90                   	nop
 804841d:	90                   	nop
 804841e:	90                   	nop
 804841f:	90                   	nop

08048420 <__do_global_dtors_aux>:
 8048420:	55                   	push   %ebp
 8048421:	89 e5                	mov    %esp,%ebp
 8048423:	53                   	push   %ebx
 8048424:	83 ec 04             	sub    $0x4,%esp
 8048427:	80 3d d8 98 04 08 00 	cmpb   $0x0,0x80498d8
 804842e:	75 3f                	jne    804846f <__do_global_dtors_aux+0x4f>
 8048430:	a1 dc 98 04 08       	mov    0x80498dc,%eax
 8048435:	bb d4 97 04 08       	mov    $0x80497d4,%ebx
 804843a:	81 eb d0 97 04 08    	sub    $0x80497d0,%ebx
 8048440:	c1 fb 02             	sar    $0x2,%ebx
 8048443:	83 eb 01             	sub    $0x1,%ebx
 8048446:	39 d8                	cmp    %ebx,%eax
 8048448:	73 1e                	jae    8048468 <__do_global_dtors_aux+0x48>
 804844a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8048450:	83 c0 01             	add    $0x1,%eax
 8048453:	a3 dc 98 04 08       	mov    %eax,0x80498dc
 8048458:	ff 14 85 d0 97 04 08 	call   *0x80497d0(,%eax,4)
 804845f:	a1 dc 98 04 08       	mov    0x80498dc,%eax
 8048464:	39 d8                	cmp    %ebx,%eax
 8048466:	72 e8                	jb     8048450 <__do_global_dtors_aux+0x30>
 8048468:	c6 05 d8 98 04 08 01 	movb   $0x1,0x80498d8
 804846f:	83 c4 04             	add    $0x4,%esp
 8048472:	5b                   	pop    %ebx
 8048473:	5d                   	pop    %ebp
 8048474:	c3                   	ret    
 8048475:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8048479:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

08048480 <frame_dummy>:
 8048480:	55                   	push   %ebp
 8048481:	89 e5                	mov    %esp,%ebp
 8048483:	83 ec 18             	sub    $0x18,%esp
 8048486:	a1 d8 97 04 08       	mov    0x80497d8,%eax
 804848b:	85 c0                	test   %eax,%eax
 804848d:	74 12                	je     80484a1 <frame_dummy+0x21>
 804848f:	b8 00 00 00 00       	mov    $0x0,%eax
 8048494:	85 c0                	test   %eax,%eax
 8048496:	74 09                	je     80484a1 <frame_dummy+0x21>
 8048498:	c7 04 24 d8 97 04 08 	movl   $0x80497d8,(%esp)
 804849f:	ff d0                	call   *%eax
 80484a1:	c9                   	leave  
 80484a2:	c3                   	ret    
 80484a3:	90                   	nop

// strlen(char *)
080484a4 <s>:
 80484a4:	55                   	push   %ebp
 80484a5:	89 e5                	mov    %esp,%ebp
 80484a7:	8b 55 08             	mov    0x8(%ebp),%edx	 // param: edx
 80484aa:	b8 00 00 00 00       	mov    $0x0,%eax	 // eax = null
 80484af:	80 3a 00             	cmpb   $0x0,(%edx)	 // if edx != null {
 80484b2:	74 09                	je     80484bd <s+0x19>
 80484b4:	83 c0 01             	add    $0x1,%eax	 // do: eax++
 80484b7:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)// while (edx[eax] != \0);
 80484bb:	75 f7                	jne    80484b4 <s+0x10>
 80484bd:	5d                   	pop    %ebp 		// }
 80484be:	c3                   	ret    

// nullify_newline(char *)
080484bf <c>:
 80484bf:	55                   	push   %ebp
 80484c0:	89 e5                	mov    %esp,%ebp
 80484c2:	53                   	push   %ebx
 80484c3:	83 ec 04             	sub    $0x4,%esp
 80484c6:	8b 5d 08             	mov    0x8(%ebp),%ebx	// ebx = param
 80484c9:	85 db                	test   %ebx,%ebx	// zf = ebz == 0? 1:0
 80484cb:	74 28                	je     80484f5 <c+0x36>	// return if ebx == 0
 80484cd:	89 1c 24             	mov    %ebx,(%esp)
 80484d0:	e8 cf ff ff ff       	call   80484a4 <s>	// eax = strlen(param)
 80484d5:	85 c0                	test   %eax,%eax
 80484d7:	7e 1c                	jle    80484f5 <c+0x36> // return if eax == 0
 80484d9:	89 1c 24             	mov    %ebx,(%esp)	// param1: ebx, param
 80484dc:	e8 c3 ff ff ff       	call   80484a4 <s>	// eax = strlen(param)
 80484e1:	80 7c 03 ff 0a       	cmpb   $0xa,-0x1(%ebx,%eax,1)
 80484e6:	75 0d                	jne    80484f5 <c+0x36>	// if (last char param != \n) return
 80484e8:	89 1c 24             	mov    %ebx,(%esp)
 80484eb:	e8 b4 ff ff ff       	call   80484a4 <s>
 80484f0:	c6 44 03 ff 00       	movb   $0x0,-0x1(%ebx,%eax,1) // set param last char = \0
 80484f5:	83 c4 04             	add    $0x4,%esp	// start here?
 80484f8:	5b                   	pop    %ebx
 80484f9:	5d                   	pop    %ebp
 80484fa:	c3                   	ret    

???? <r>(char *,????)
080484fb <r>:
// prologue
 80484fb:	55                   	push   %ebp
 80484fc:	89 e5                	mov    %esp,%ebp
 80484fe:	57                   	push   %edi
 80484ff:	56                   	push   %esi
 8048500:	53                   	push   %ebx
 8048501:	83 ec 08             	sub    $0x8,%esp
 8048504:	8b 7d 08             	mov    0x8(%ebp),%edi 	// edi = param1
 8048507:	0f b6 45 0c          	movzbl 0xc(%ebp),%eax 	// eax = 000param2
 804850b:	88 45 f3             	mov    %al,-0xd(%ebp)	// -0xd(ebp) = lower(eax)
 804850e:	89 3c 24             	mov    %edi,(%esp)	// param: edi
 8048511:	e8 8e ff ff ff       	call   80484a4 <s> 	// eax = strlen(edi)
 8048516:	8d 5c 07 ff          	lea    -0x1(%edi,%eax,1),%ebx // ebx = address of last char edi
 804851a:	be 00 00 00 00       	mov    $0x0,%esi	// esi = 0
 804851f:	eb 12                	jmp    8048533 <r+0x38> // skip 3 lines
 8048521:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax  // eax = lower(param2, 47?) 
 804852d:	83 eb 01             	sub    $0x1,%ebx	// ebx--, ebx = char previous
 8048530:	83 c6 01             	add    $0x1,%esi	// esi++
 8048533:	89 3c 24             	mov    %edi,(%esp)	// param: edi
 8048536:	e8 69 ff ff ff       	call   80484a4 <s>	// eax = strlen(edi)
 804853b:	39 c6                	cmp    %eax,%esi	
 804853d:	7c e2                	jl     8048521 <r+0x26> // if eax < esi goto movzbl
// epilogue
 804853f:	83 c4 08             	add    $0x8,%esp
 8048542:	5b                   	pop    %ebx
 8048543:	5e                   	pop    %esi
 8048544:	5f                   	pop    %edi
 8048545:	5d                   	pop    %ebp
 8048546:	c3                   	ret    

08048547 <main>:
// prologue
 8048547:	55                   	push   %ebp
 8048548:	89 e5                	mov    %esp,%ebp
 804854a:	83 e4 f0             	and    $0xfffffff0,%esp
// 240 bytes for stack
 804854d:	81 ec f0 00 00 00    	sub    $0xf0,%esp
 8048553:	89 9c 24 e4 00 00 00 	mov    %ebx,0xe4(%esp)
 804855a:	89 b4 24 e8 00 00 00 	mov    %esi,0xe8(%esp)
 8048561:	89 bc 24 ec 00 00 00 	mov    %edi,0xec(%esp)
// param2: 47
 8048568:	c7 44 24 04 2f 00 00 	movl   $0x2f,0x4(%esp)
 804856f:	00 
// param1: *0xc(%ebp)
 8048570:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048573:	8b 00                	mov    (%eax),%eax
 8048575:	89 04 24             	mov    %eax,(%esp)
 8048578:	e8 7e ff ff ff       	call   80484fb <r> // char* <r>(int,???) 
 804857d:	89 c6                	mov    %eax,%esi   // esi = strlen(param1)
 804857f:	a1 d4 98 04 08       	mov    0x80498d4,%eax	// eax = const
 8048584:	89 44 24 08          	mov    %eax,0x8(%esp)	// param3 = const
 8048588:	c7 44 24 04 64 00 00 	movl   $0x64,0x4(%esp)	// param2 = 100
 804858f:	00 
 8048590:	8d 5c 24 7c          	lea    0x7c(%esp),%ebx	
 8048594:	89 1c 24             	mov    %ebx,(%esp)	// param1 = ptr(0x7c+esp): 0x7c = input!
 8048597:	e8 ec fd ff ff       	call   8048388 <fgets@plt>

 804859c:	89 1c 24             	mov    %ebx,(%esp) 	// param1 = user input
 804859f:	e8 1b ff ff ff       	call   80484bf <c> 	// nullify_newline(param1)

 80485a4:	89 5c 24 04          	mov    %ebx,0x4(%esp)	// src: user input
 80485a8:	8d 5c 24 18          	lea    0x18(%esp),%ebx	// dest: 0x18(esp) location 
 80485ac:	89 1c 24             	mov    %ebx,(%esp)
 80485af:	e8 f4 fd ff ff       	call   80483a8 <strcpy@plt> // strcpy

 80485b4:	89 df                	mov    %ebx,%edi	// edi = user input ptr
 80485b6:	b8 00 00 00 00       	mov    $0x0,%eax	// eax = 0
 80485bb:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx // ecx = MAX
 80485c0:	f2 ae                	repnz scas %es:(%edi),%al // scan str looking for %al, ecx--
 80485c2:	f7 d1                	not    %ecx		// get positive count from countdown
 80485c4:	8d 44 0b ff          	lea    -0x1(%ebx,%ecx,1),%eax // point eax to %al char in str 
 80485c8:	66 c7 00 5f 32       	movw   $0x325f,(%eax)	// set that char and after to "_2"
 80485cd:	c6 40 02 00          	movb   $0x0,0x2(%eax)	// set char after "_2" to \0
 80485d1:	83 c6 01             	add    $0x1,%esi	// delete first char from esi

 80485d4:	89 74 24 04          	mov    %esi,0x4(%esp)	// param2: esi str
 80485d8:	89 1c 24             	mov    %ebx,(%esp)	// param1: user input w/ subs
 80485db:	e8 f8 fd ff ff       	call   80483d8 <strcmp@plt>
 80485e0:	85 c0                	test   %eax,%eax // zf = eax == 0? 1:0
 80485e2:	75 16                	jne    80485fa <main+0xb3> // jump if zf == 0 (cmp != 0, no match)
 80485e4:	8d 44 24 7c          	lea    0x7c(%esp),%eax		// if (strcmp == 0) {
 80485e8:	89 44 24 04          	mov    %eax,0x4(%esp)
 80485ec:	c7 04 24 e4 86 04 08 	movl   $0x80486e4,(%esp)
 80485f3:	e8 c0 fd ff ff       	call   80483b8 <printf@plt>
 80485f8:	eb 0c                	jmp    8048606 <main+0xbf>
 80485fa:	c7 04 24 14 87 04 08 	movl   $0x8048714,(%esp)	//} else {
 8048601:	e8 c2 fd ff ff       	call   80483c8 <puts@plt>
 8048606:	8b 9c 24 e4 00 00 00 	mov    0xe4(%esp),%ebx
 804860d:	8b b4 24 e8 00 00 00 	mov    0xe8(%esp),%esi
 8048614:	8b bc 24 ec 00 00 00 	mov    0xec(%esp),%edi
 804861b:	89 ec                	mov    %ebp,%esp
 804861d:	5d                   	pop    %ebp
 804861e:	c3                   	ret    
 804861f:	90                   	nop

08048620 <__libc_csu_fini>:
 8048620:	55                   	push   %ebp
 8048621:	89 e5                	mov    %esp,%ebp
 8048623:	5d                   	pop    %ebp
 8048624:	c3                   	ret    
 8048625:	66 66 2e 0f 1f 84 00 	data32 nopw %cs:0x0(%eax,%eax,1)
 804862c:	00 00 00 00 

08048630 <__libc_csu_init>:
 8048630:	55                   	push   %ebp
 8048631:	89 e5                	mov    %esp,%ebp
 8048633:	57                   	push   %edi
 8048634:	56                   	push   %esi
 8048635:	53                   	push   %ebx
 8048636:	e8 4f 00 00 00       	call   804868a <__i686.get_pc_thunk.bx>
 804863b:	81 c3 6d 12 00 00    	add    $0x126d,%ebx
 8048641:	83 ec 1c             	sub    $0x1c,%esp
 8048644:	e8 ef fc ff ff       	call   8048338 <_init>
 8048649:	8d bb 20 ff ff ff    	lea    -0xe0(%ebx),%edi
 804864f:	8d 83 20 ff ff ff    	lea    -0xe0(%ebx),%eax
 8048655:	29 c7                	sub    %eax,%edi
 8048657:	c1 ff 02             	sar    $0x2,%edi
 804865a:	85 ff                	test   %edi,%edi
 804865c:	74 24                	je     8048682 <__libc_csu_init+0x52>
 804865e:	31 f6                	xor    %esi,%esi
 8048660:	8b 45 10             	mov    0x10(%ebp),%eax
 8048663:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048667:	8b 45 0c             	mov    0xc(%ebp),%eax
 804866a:	89 44 24 04          	mov    %eax,0x4(%esp)
 804866e:	8b 45 08             	mov    0x8(%ebp),%eax
 8048671:	89 04 24             	mov    %eax,(%esp)
 8048674:	ff 94 b3 20 ff ff ff 	call   *-0xe0(%ebx,%esi,4)
 804867b:	83 c6 01             	add    $0x1,%esi
 804867e:	39 fe                	cmp    %edi,%esi
 8048680:	72 de                	jb     8048660 <__libc_csu_init+0x30>
 8048682:	83 c4 1c             	add    $0x1c,%esp
 8048685:	5b                   	pop    %ebx
 8048686:	5e                   	pop    %esi
 8048687:	5f                   	pop    %edi
 8048688:	5d                   	pop    %ebp
 8048689:	c3                   	ret    

0804868a <__i686.get_pc_thunk.bx>:
 804868a:	8b 1c 24             	mov    (%esp),%ebx
 804868d:	c3                   	ret    
 804868e:	90                   	nop
 804868f:	90                   	nop

08048690 <__do_global_ctors_aux>:
 8048690:	55                   	push   %ebp
 8048691:	89 e5                	mov    %esp,%ebp
 8048693:	53                   	push   %ebx
 8048694:	83 ec 04             	sub    $0x4,%esp
 8048697:	a1 c8 97 04 08       	mov    0x80497c8,%eax
 804869c:	83 f8 ff             	cmp    $0xffffffff,%eax
 804869f:	74 13                	je     80486b4 <__do_global_ctors_aux+0x24>
 80486a1:	bb c8 97 04 08       	mov    $0x80497c8,%ebx
 80486a6:	66 90                	xchg   %ax,%ax
 80486a8:	83 eb 04             	sub    $0x4,%ebx
 80486ab:	ff d0                	call   *%eax
 80486ad:	8b 03                	mov    (%ebx),%eax
 80486af:	83 f8 ff             	cmp    $0xffffffff,%eax
 80486b2:	75 f4                	jne    80486a8 <__do_global_ctors_aux+0x18>
 80486b4:	83 c4 04             	add    $0x4,%esp
 80486b7:	5b                   	pop    %ebx
 80486b8:	5d                   	pop    %ebp
 80486b9:	c3                   	ret    
 80486ba:	90                   	nop
 80486bb:	90                   	nop

Disassembly of section .fini:

080486bc <_fini>:
 80486bc:	55                   	push   %ebp
 80486bd:	89 e5                	mov    %esp,%ebp
 80486bf:	53                   	push   %ebx
 80486c0:	83 ec 04             	sub    $0x4,%esp
 80486c3:	e8 00 00 00 00       	call   80486c8 <_fini+0xc>
 80486c8:	5b                   	pop    %ebx
 80486c9:	81 c3 e0 11 00 00    	add    $0x11e0,%ebx
 80486cf:	e8 4c fd ff ff       	call   8048420 <__do_global_dtors_aux>
 80486d4:	59                   	pop    %ecx
 80486d5:	5b                   	pop    %ebx
 80486d6:	c9                   	leave  
 80486d7:	c3                   	ret    
