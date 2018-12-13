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
%%
for i = 1:1:65537
    if((i >= 32769) &&(i < 32769 + 1600))
        Y1(i)=Y(i);
    
    else
        Y1(i)=0;   
    end
end
signal(Y1)

%% 6. TIDSDOMÄNANALYS AV TIDSDISKRETA SIGNALER & SYSTEM

% Dela på lämpligt sätt in dina funktionsanrop i fler delceller, för enklare redovisning!

%  Uppgift 6a



%% Uppgift 6b



%% Uppgift 6c



%% Uppgift 6d



%% Uppgift 6e






%% TIDSDISKRETA FREKVENSSELEKTIVA FILTER

% Dela på lämpligt sätt in dina funktionsanrop i fler delceller, för enklare redovisning!

% Uppgift 7a



%% Uppgift 7b



%% Uppgift 7c 



%% Uppgift 7d






