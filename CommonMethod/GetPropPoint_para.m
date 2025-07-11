function [xf,yf,zf,xb,yb,zb] = GetPropPoint_para(D,totalL,xofsection,ybs,yfs,l,rdivR,bdivD,PdivD,thets,xl,psi,gamma,alpha)
%GETPROPPOINT This function is used to generate 3D shape points of propeller surface
%------------------------------- Copyright --------------------------------
% Copyright (c) 2025 Wuhan University of Technology. 
% You are free to use the PlatToroidalProp for research purposes. 
%--------------------------------------------------------------------------

for i=1:length(l)
    R=D/2;
    beta=atan(PdivD(i)*D/rdivR(i)/pi);
    c1=bdivD(i)*D/2-rdivR(i)*R*thets(i)/cos(beta)/cos(alpha(i));
    s=xofsection*bdivD(i)*D;
    ybs=ybs*bdivD(i)*D;
    xb(i,:)=l(i)*totalL+xl(i)+(-c1+s)*cos(alpha(i))*sin(beta)-(ybs*cos(gamma(i)))*cos(beta);
    tempr=rdivR(i)*R-(-bdivD(i)*D/2+s)*sin(alpha(i))-ybs*sin(gamma(i));
    tempzata=psi(i)+((-c1+s)*cos(alpha(i))*cos(beta)+(ybs*cos(gamma(i)))*sin(beta))./tempr;
    yb(i,:)=tempr.*cos(tempzata);
    zb(i,:)=tempr.*sin(tempzata);
    yfs=yfs*bdivD(i)*D;
    xf(i,:)=l(i)*totalL+xl(i)+(-c1+s)*cos(alpha(i))*sin(beta)-(yfs*cos(gamma(i)))*cos(beta);
    tempr=rdivR(i)*R-(-bdivD(i)*D/2+s)*sin(alpha(i))-yfs*sin(gamma(i));
    tempzata=psi(i)+((-c1+s)*cos(alpha(i))*cos(beta)+(yfs*cos(gamma(i)))*sin(beta))./tempr;
    yf(i,:)=tempr.*cos(tempzata);
    zf(i,:)=tempr.*sin(tempzata);
end
end

