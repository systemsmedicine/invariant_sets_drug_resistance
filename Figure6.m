% Clear workspace

% Figure 6

%Colours
vecrojo = [0.7;0;0]; vecnaranja = [1;0.4;0];veccyan = [0 0.7 0.8]; vecvioleta = [0.4 0 0.8]; vecverde = [0;0.7;0.1]; vecazul = [0;0;0.7]; vecnegro = [.1;.1;.1]; 

% Parameters
n = 3;          % Number of states (we do not consider AsBsCs)
mu = 0.0002;    % Mutation rate

% Linear subsystems for 3 drugs:
% Drug Treatment A
roA1 = 0.27; roA2 = 0.22; roA3 = 0.27;
ro_A = [roA1 roA2 roA3];
delta_A1 = 0.25; delta_A2 = 0.25; delta_A3 = 0.25; 
Delta_A = [delta_A1 delta_A2 delta_A3]';
A_A = (ro_A-Delta_A').*eye(n,n); % Growth/Clearence matrix
M_A = mu*[0 1 1;0 0 0; 0 0 0]; % Mutation matrix
% Drug Treatment B
roB1 = 0.22; roB2 = 0.27; roB3 = 0.22;
ro_B = [roB1 roB2 roB3];
delta_B1 = 0.25; delta_B2 = 0.25; delta_B3 = 0.25; 
Delta_B = [delta_B1 delta_B2 delta_B3]';
A_B = (ro_B-Delta_B').*eye(n,n); % Growth/Clearence matrix
M_B = mu*[0 0 0;1 0 1; 0 0 0]; % Mutation matrix
% Drug Treatment C
roC1 = 0.22; roC2 = 0.22; roC3 = 0.27;
ro_C = [roC1 roC2 roC3];
delta_C1 = 0.25; delta_C2 = 0.25; delta_C3 = 0.25; 
Delta_C = [delta_C1 delta_C2 delta_C3]';
A_C = (ro_C-Delta_C').*eye(n,n); % Growth/Clearence matrix
M_C = mu*[0 0 0;0 0 0; 1 1 0]; % Mutation matrix

Lamba_A = A_A + M_A; 
Lamba_B = A_B + M_B; 
Lamba_C = A_C + M_C;

%Continuous time subsystems
Ac1 = Lamba_A; 
Ac2 = Lamba_B; 
Ac3 = Lamba_C;

% Discrete subsystems
dTsim = 3; % Time step for discretization
A1 = expm(Ac1*dTsim);  % drug A (TOB)
A2 = expm(Ac2*dTsim);  % drug B (CAR)
A3 = expm(Ac3*dTsim);  % drug C (COL)

%Invariant characterization (use MPT3 toolbox)
% Initial box (to initialize the Algoritm 1)
T0 = Polyhedron([0 0 0;0 1 0;0 0.996449 0.818731;0 0.740818 0.901829;0 0.519924 1;0 0 1;1 0 0;1 1 0;1 0.996449 0.818731;1 0.740818 0.901829;1 0.519924 1;1 0 1]);
% Controllable sets
S1 = inv(A1)*T0;
S2 = inv(A2)*T0;
S3 = inv(A3)*T0;
%Plots
plot(T0,'Color', vecnegro, 'Alpha', 0.01,'edgecolor',vecnegro,'LineWidth',0.01,'lineStyle','--');hold on
plot(S1,'Color', vecvioleta, 'Alpha', 0,'edgecolor',vecrojo,'LineWidth',0.1,'lineStyle','--');hold on
plot(S2,'Color', vecvioleta, 'Alpha', 0,'edgecolor',vecrojo,'LineWidth',0.3,'lineStyle','--')
plot(S3,'Color', vecvioleta, 'Alpha', 0,'edgecolor',vecrojo,'LineWidth',0.3,'lineStyle','--')
plot(inv(A1)*intersect(T0,S1),'Color', vecnaranja, 'Alpha', 0,'edgecolor',vecrojo,'LineWidth',0.5,'lineStyle','--')
plot(inv(A1)*intersect(T0,S2),'Color', vecnaranja, 'Alpha', 0,'edgecolor',vecrojo,'LineWidth',0.5,'lineStyle','--')
plot(inv(A1)*intersect(T0,S3),'Color', vecnaranja, 'Alpha', 0,'edgecolor',vecrojo,'LineWidth',0.5,'lineStyle','--')
plot(inv(A2)*intersect(T0,S1),'Color', vecnaranja, 'Alpha', 0,'edgecolor',vecrojo,'LineWidth',0.5,'lineStyle','--')
plot(inv(A2)*intersect(T0,S2),'Color', vecnaranja, 'Alpha', 0,'edgecolor',vecrojo,'LineWidth',0.5,'lineStyle','--')
plot(inv(A2)*intersect(T0,S3),'Color', vecnaranja, 'Alpha', 0,'edgecolor',vecrojo,'LineWidth',0.5,'lineStyle','--')
plot(inv(A3)*intersect(T0,S1),'Color', vecnaranja, 'Alpha', 0,'edgecolor',vecrojo,'LineWidth',0.5,'lineStyle','--')
plot(inv(A3)*intersect(T0,S2),'Color', vecnaranja, 'Alpha', 0,'edgecolor',vecrojo,'LineWidth',0.5,'lineStyle','--')
plot(inv(A3)*intersect(T0,S3),'Color', vecnaranja, 'Alpha', 0,'edgecolor',vecrojo,'LineWidth',0.5,'lineStyle','--')
xlabel('A_RB_SC_S') 
ylabel('A_SB_RC_S') 
zlabel('A_RB_SC_R') 

% Algorithm 1 ends