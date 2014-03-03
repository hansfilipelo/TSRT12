
%%
%9a
s=tf('s');

G = 25.9/(18.4*s+1)^2;

Tr=4;
phi_m=62;
wcd=1.35/Tr;
e=0;
B=0.13;

%Konstruktion av Flag 
Gwcd=freqresp(G,wcd);
phi_md=180+angle(Gwcd)*(180/pi);

phi_max = phi_m - phi_md + 6 % Tumregel vid konstruktion av Flead + Flag

%--------------------Med beta---------

Td=1/(wcd*sqrt(B))

K=sqrt(B)/abs(Gwcd)

Flead= K*(Td*s+1)/(B*Td*s+1);

%Konstruktion av Flag 
Ti=10/wcd

eb=1/e-1;

gamma=K*freqresp(G,0)/eb

Flag=(Ti*s+1)/(Ti*s+gamma);

Gny=G*Flead*Flag;

margin(Gny)

figure(2)

Gc = feedback(Gny,1);
step(Gc)



