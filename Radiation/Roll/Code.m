clear all;  
clc;
a=0.5;
d=0.3333;
n = 4;
l1=100;
z = zeros(1,l1);
m = zeros(n+1,l1);
alpha_vector = zeros(n+1,1);
if l1>1
m(1,:) = linspace(0,4,l1)/a; % index 1 implies 1st m_0
end
m(1,1) = 0.01;
x = m(1,:)*a; % x to be plotted
global v;
fun = @dispe;
for ii = 0:l1-1
    v = m(1,ii+1)*tanh(m(1,ii+1));
    % x_0 = [0 0.49*pi];
    % m(2,i+1) = fzero(fun,x_0);
    for j = 0:n-1
        x_0 = [(j+0.51)*pi (j+1.49)*pi]; % interval where the root lie
        m(j+2,ii+1) = fzero(fun,x_0);
    end
end

% for l = 0:l1-1  
% alpha_vector(:,1) = alpha(l,n,m(:,l+1),d,a);
% for ii = 1:n
% z(1,1+l) = z(1,1+l)-(d/a)*(-1)^(ii)*((besseli(0,n*pi/d*a)/besseli(1,n*pi/d*a))/(n*pi)-(2*d)/(a*(n*pi)^2))*alpha_vector(ii+1,1); % A and R are combined
% % ARV(i+1,1) = AR_fun(a,d,i,m(i+1,l+1),l);
% % ASV(i+1,1) = A_star(a,d,i,m(i+1,l+1));
% end
% % disp(z(1,l+1));
% for ii = 0:n
% z(1,l+1) = z(1,l+1) + (1/a^2)*AR_fun(a,d,ii,m(:,l+1),n,alpha_vector)*E_new_fun(m(:,l+1),ii,d);
% end
% % disp(z(1,l+1));
% z(1,l+1) = z(1,l+1)+(1/8)*(a*d-a^3/(6*d)-alpha_vector(1,1));
% % disp(z(1,l+1));
% end
for l = 0:l1-1  %validate against SDC functions
    alpha_vector(:,1) = alpha(l,n,m(:,l+1),d,a);
    for i = 0:n
        z(1,l+1) = z(1,l+1) - (alpha_vector(i+1,1)*(-1)^i*phi_star(a,i,d))/(a^3);
    end
    for i = 0:n
        z(1,l+1) = z(1,l+1) - (A_fun(a,d,i,m(:,l+1),n,alpha_vector)*Z_star(m(i+1),i,d)*R_ratio(m(i+1),a,i))/(a^2);
    end
    z(1,l+1) = z(1,l+1) + (6*a*d^2-a^3)/(48*d);
end

CC = zeros(n);
 
plot(x,real(z)/a);
hold on;
%plot(x,imag(z));
% rr=zeros(n,n);
%   for i = 0:n
%        for j = 0:n
%            rr(i+1,j+1)= e_fun_roll(n,i,j,a,d,m);
%        end
%   end
%   disp(rr);

