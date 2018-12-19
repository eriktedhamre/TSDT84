% LABORATIONSUPPGIFTER I TSDT18/84 SIGNALER & SYSTEM
% --------------------------------------------------

% LÄS NEDANSTÅENDE TEXT INNAN DU BÖRJAR JOBBA MED DATORUPPGIFTERNA!!!!

% I detta skript skriver du ned alla funktionsanrop och övrigt som behövs 
% för att lösa varje uppgift.  Skriptet är indelat i separata celler/sektioner 
% med dubbla procenttecken, dvs. %%, där du för varje deluppgift skriver 
% in alla relevanta Matlab-anrop i motsvarande cell.
% Vid redovisningen kan du då i editorn enkelt och snabbt exekvera och  
% redovisa din matlabkod och relaterade grafer för en deluppgift/cell i taget. 

% I de fall en graf ska redovisas, t.ex. en signal eller något frekvensspektrum, 
% så ska ditt skript generera grafen på det sätt du gjorde när du löste uppgiften. 
% Du ska alltså inte redovisa några grafer/figurer i form av fig-filer eller 
% utskriva i pappersform. Anledningen till detta är att det ska vara möjligt 
% att i efterhand, vid redovisningen, undersöka vad som händer med grafen 
% om du justerar någon parameter hos uppgiftens signal eller system - vilket 
% assistenten ibland kan be dig att göra.

% Tips: Använd gärna funktionen ohfig för att förtydliga en redan ritad graf. 
% Funktionen ökar fontstorleken på text och linjetjockleken i graferna i figurfönstret.
%
% Vid behov kan du behöva spara matlab-variabler under labben med save 
% (som t.ex. save filnamn.mat A H1 D för att spara variablerna A, H1 och D 
% i datafilen filnamn.mat). I ditt skript laddar du sedan in de sparade 
% variablerna med load filnamn.mat. 

% OBS: Senare i labserien, i samband med filterdesign, kommer du att konstruera 
% laplacetransformer och z-transformer m.h.a. funktionen pzchange.
% När du redovisar utskrifter av pzchange-grafer, så behöver du i respektive 
% cell spara den matlabkod som behövs för att återgenerera pzchange-grafen.
% Då kan du t.ex. även behöva ladda in en transform som du tidigare har
% erhållit och sparat i en mat-fil.
% Då kan du eller assistenten manipulera transformen m.h.a. pzchange vid redovisningen.

% Tips: Du kommer ofta att kopiera Matlabkod från kommandofönstret eller 
% ?Command History?-fönstret till redovisningsskriptet i editorn. 
% Det gör du enklast genom att markera funktionsanropen och sedan dra och 
% släppa den markerade texten i editorn.
% I en Linuxmiljö kan du även ändra kortkommandon av typen Ctrl+C och CTRL+V 
% för att kopiera respektive klistra in. 
% Det gör du under System/Preferences/Keyboard/Shortcuts  (tror jag...  ;)



%% EXEMPEL PÅ HUR MATALANROP EXEKVERAS I EN CELL/SEKTION

% Se även https://se.mathworks.com/help/matlab/matlab_prog/run-sections-of-programs.html

% 1) Ställ markören var som helst i den här raden eller raderna strax nedan,
%    så att denna cell och alla dess rader gulmarkeras.
%    Cellen markeras när du ställer markören på valfri rad i cellen.
%
% 2) I "Editor"-fliken finns avdelningen "RUN". Klicka på knappen 
%    "Run Section" för att exekvera all Matlabkod i denna cell/sektion.
%    Du kan även exekvera cellens Matlabkod genom att trycka Ctrl + Enter
%    (CMD + Enter på Mac).

% Exempel på matlabkod som exekveras i denna cell/sektion (rita en sinus):
t=0:0.1:10;
figure(4)
plot(t,sin(t),'r'), 
shg



%% 1. INLEDNING

% Ingen uppgift att lösa här. Vi behov behöver du kanske i stället fräscha upp
% dina matlabkunskaper - se i så fall sidan "matlabresurser" på kurswebbsidan!



%% 2. FALTNING 

% Kopiera dina funktionsanrop hit. 
% Dela på lämpligt sätt in dina funktionsanrop i fler delceller, för enklare redovisning!






%% 3. FOURIERSERIEANALYS

% Uppgift 3a ? beräkning


%% Uppgift 3a ? rita signal & spektrum



%% Uppgift 3b






%% 4. FOURIERTRANSFORMANALYS

% Dela på lämpligt sätt in dina funktionsanrop i fler delceller, för enklare redovisning!

% Uppgift 4a



%% Uppgift 4b



%% Uppgift 4c



%% Uppgift 4d






%% 5. TIDSKONTINUERLIGA FREKVENSSELEKTIVA FILTER

% Dela på lämpligt sätt in dina funktionsanrop i fler delceller, för enklare redovisning!

%%
% Uppgift 5a. 



%% Uppgift 5b
load uppgift5b
pzchange(H1)
%%
pzchange(H2)
%% Uppgift 5b



%% Uppgift 5c
load uppgift5c
pzchange(H3)

%% Uppgift 5d
load uppgift5d
pzchange(H4)

%% Uppgift 5e

[B, A] = butter(10, 2*pi*100, 'low', 's');
pzchange(in(B,A, 's'))

%%
% 5 eller 6 poler
[B, A] = cheby1(5,3,2*pi*100, 'low', 's')
pzchange(in(B,A, 's'))
%% Uppgift 5f
load uppgift5f1
pzchange(BP1)
%%
load dtmf
%signal(toner)
X = foutr(toner);
Y = output(X, BP1);
Yt = ifoutr(Y)
%spect(X)
figure(1);
Xt=linspace(1, 65538,65537);
subplot(2,1,1)
plot(Xt, toner);
subplot(2,1,2)
plot(Xt, Yt)
%% 6. TIDSDOMÄNANALYS AV TIDSDISKRETA SIGNALER & SYSTEM

% Dela på lämpligt sätt in dina funktionsanrop i fler delceller, för enklare redovisning!

%  Uppgift 6a



%% Uppgift 6b



%% Uppgift 6c
%% ha
n = -5:19;   % Anm: I boken st�r det (0:19), men fr�n -5 �r l�mpligare
x = inline('n==0');     % = enhetsimpulsen
a = [ 1 -1]; b = [0 1];
h = filter(b,a,x(n));
clf; stem(n,h,'k'); xlabel('n'); ylabel('h[n]');

% Kausalt då  ha = 0 för n < 0
% Marginellt stabil då den har en pol på enhetscirkeln
%
%% hb
n = -5:19;   % Anm: I boken st�r det (0:19), men fr�n -5 �r l�mpligare
x = inline('n==0');     % = enhetsimpulsen
a = [1 -5 6]; b = [0 8 -19];
h = filter(b,a,x(n));
clf; stem(n,h,'k'); xlabel('n'); ylabel('h[n]');

% Kausalt
% Icke stabilt då Sum(abs(hb)) !< inf
%
%% hd
n = -5:19;   % Anm: I boken st�r det (0:19), men fr�n -5 �r l�mpligare
x = inline('n==0');     % = enhetsimpulsen
a = [1 0]; b = [2 -2];
h = filter(b,a,x(n));
clf; stem(n,h,'k'); xlabel('n'); ylabel('h[n]');

% Kausalt 
% Stabilt då Sum(abs(hd)) < inf
%
%% Uppgift 6d



%% Uppgift 6e
%Tidsförskjutning modifierar inte signalen utan flyttar den bara

% Faltning mellan x[n] och h[n]
% Lasse Alfredsson 2012
n=0:50;
x=inline('2*(n>=5 & n<20)','n');    % x[n]=2(u[n-5]-u[n-20])    % Orignial
h=inline('1*(n>=2 & n<10)','n');    % h[n]=u[n-2]-u[n-10]
x2=inline('2*(n>=15 & n<30)','n');  % x2[n] = x[n-10]           % 5e
subplot(2,1,1)
stem(n,x2(n),'b');hold on, 
stem(n,h(n),'r');hold off
xlabel('n')
title('x[n]  (bl�)  & h[n]  (r�d)')

y=conv(x2(n),h(n));       % y[n]=x[n]*h[n]  (faltning)
subplot(2,1,2) 
stem(n,y(1:length(n)));  % Ty length(y) = length(x)+length(h)-1
xlabel('n')
title('y[n]')
%%
n=0:50;
x=inline('cos((pi.*n)/6).*(n>=0)','n');         % x[n]=cos((pi/6)*n)*u[n]
h=inline('1.5.*(.95.^n).*(n>=0 & n<11)','n');    % h[n]=1.5(0.95^n)(u[n]-u[n-11])
subplot(2,1,1)
stem(n,x(n),'b');hold on, 
stem(n,h(n),'r');hold off
xlabel('n')
title('x[n]  (bl�)  & h[n]  (r�d)')

y=conv(x(n),h(n));       % y[n]=x[n]*h[n]  (faltning)
subplot(2,1,2) 
stem(n,y(1:length(n)));  % Ty length(y) = length(x)+length(h)-1
xlabel('n')
title('y[n]')

%% TIDSDISKRETA FREKVENSSELEKTIVA FILTER

% Dela på lämpligt sätt in dina funktionsanrop i fler delceller, för enklare redovisning!

%% Uppgift 7a

load uppgift7a
pzchange(H1z)
%% Uppgift 7b
load uppgift7b
pzchange(HA), pause, pzchange(HB)
%% Uppgift 7c 
[B, A]=butter(3,2*0.15, 'low');
H=in(B,A, 'z');
pzchange(H)

%%
[B, A]=butter(5,2*0.15, 'low');
H=in(B,A, 'z');
pzchange(H)
%%
[B, A] = cheby1(5,3,2*0.15, 'low')
H=in(B,A, 'z');
pzchange(H)
%%
[B, A]=butter(5,2*0.15, 'high');
H=in(B,A, 'z');
pzchange(H)

%%
[B, A] = cheby1(5,3,2*0.15, 'high')
H=in(B,A, 'z');
pzchange(H)
%% Uppgift 7d
load dtmf, T=toner(65537); Dtoner=[toner 0 0 0]; N=30;
subplot(2,1,1), signalmod(toner,N*T);
subplot(2,1,2), signalmod(Dtoner,N)
%%
TONER=foutr(toner); DTONER=foutr(Dtoner);
spect(TONER,DTONER);
subplot(2,1,1), axis([0 3200 0 2])

%%
[B, A] = cheby1(2,3,[2*pi*941, 2*pi*1209], 's')
H1=in(B,A, 's');
pzchange(H1)
%%
[B, A] = cheby1(2,3,[2*0.14703125, 2*0.18890625], 'z')
H2=in(B,A, 'z');
pzchange(H2)
%%
logspect(H1, H2);