function out = g_fun_roll(k,n,m,d,a)
out = 0;
if n == 0
    eps = 1;
elseif n>0
    eps = 2;
end
for i = 0:k
out = out + (eps/d)*A_star(a,d,i,m)*R_ratio(m,a,i)*cc_fun(n,m,d,i);

end
out = out - alpha_star(n,d,a);

end
% if n == 0
% disp();
% end