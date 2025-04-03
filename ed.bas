1 dim buffer$(1000)
2 dim marks(256)
3 line = 0
10 input "cmd"; cmd$
20 if cmd$ = "a" then go sub 200
25 if left$(cmd$, 1) = "a" and len(cmd$) > 2 then go sub 250
30 if cmd$ = "c" then go sub 300
40 if cmd$ = "d" then go sub 400
45 rem if cmd$ = "g" then
50 if cmd$ = "i" then go sub 500
55 if left$(cmd$, 1) = "i" and len(cmd$) > 2 then go sub 550
60 if cmd$ = "j" then go sub 600
70 if left$(cmd$, 1) = "k" then go sub 700
75 rem if cmd$ = "l" then
80 if left$(cmd$, 1) = "m" then go sub 800
85 rem if cmd$ = "n" then 700
90 if cmd$ = "p" then print buffer$(line): go to 10
95 if cmd$ = "q" then end
100 if cmd$ = "s" then go sub 1000
110 if left$(cmd$, 1) = "t" then go sub 1100
115 rem if cmd$ = "v" then 1000
120 if cmd$ = "=" then go sub 1200
130 if left$(cmd$, 1) = "0" then go sub 1300
131 if left$(cmd$, 1) = "1" then go sub 1300
132 if left$(cmd$, 1) = "2" then go sub 1300
133 if left$(cmd$, 1) = "3" then go sub 1300
134 if left$(cmd$, 1) = "4" then go sub 1300
135 if left$(cmd$, 1) = "5" then go sub 1300
136 if left$(cmd$, 1) = "6" then go sub 1300
137 if left$(cmd$, 1) = "7" then go sub 1300
138 if left$(cmd$, 1) = "8" then go sub 1300
139 if left$(cmd$, 1) = "9" then go sub 1300
140 if left$(cmd$, 1) = "+" then go sub 1400
141 if left$(cmd$, 1) = "-" then go sub 1400
150 if left$(cmd$, 1) = "'" then line = marks(asc(mid$(cmd$, 2))): print buffer$(line)
190 go to 10
200 rem ember "a" command
210 line = line + 1
220 go sub 450
230 input buffer$(line)
240 return
250 rem ember "a" command with inline content
260 line = line + 1
270 go sub 450
280 buffer$(line) = mid$(cmd$, 3)
290 return
300 rem ember "c" command
310 input buffer$(line)
320 return
400 rem ember "d" command
410 for i = line to 999
420     buffer$(i) = buffer$(i+1)
430 next i
440 return
450 rem ember "d", but backwards, freeing space
460 for i = 999 to line step -1
470     buffer$(i) = buffer$(i-1)
480 next i
490 return
500 rem ember "i" command
510 go sub 450
520 input buffer$(line)
530 return
550 rem ember "i" command
560 go sub 450
570 buffer$(line) = mid$(cmd$, 3)
580 return
600 rem ember "j" command
610 buffer$(line) = buffer$(line) + buffer$(line + 1)
620 line = line + 1
630 go sub 400
640 line = line - 1
650 return
700 rem ember "k" command
710 marks(asc(mid$(cmd$, 2))) = line
720 return
800 rem ember "m" command
810 newline = val(mid$(cmd$, 2))
820 cmd$ = "a " + buffer$(line) :rem HACK, but who's to judge?
830 go sub 400
840 line = newline
850 go sub 250
860 return
1000 rem TODO s
1100 rem ember "t" command
1110 newline = val(mid$(cmd$, 2))
1120 cmd$ = "a " + buffer$(line)
1130 line = newline
1140 go sub 250
1150 return
1200 rem ember "=" command
1210 print line
1220 return
1300 rem ember address change
1310 line = int(val(cmd$))
1320 print buffer$(line)
1330 return
1400 rem ember relative address change
1410 line = line + int(val(cmd$))
1420 print buffer$(line)
1430 return
