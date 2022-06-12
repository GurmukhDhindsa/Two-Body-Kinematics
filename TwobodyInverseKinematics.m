mA= 7483.60952; % in MeV
ma=1876.1350;
mb= 1876.1350;
mB= 7483.60952;
Ta=66.80;   % Energy of the beam (Heavy particle) MeV
Q=0;  

for theta=10:1:28
 Eb =(((sqrt(mA*ma*Ta))*cosd(theta)+(sqrt(mA*ma*Ta*(cosd(theta))^2+(mB+mb)*(mB*Q+(mB-mA)*Ta))))/(mB+ma))^2;
 Pb=sqrt(2*Eb*mb);
 EB=Ta-Eb;
 PB=sqrt(2*EB*mB);
 phi=asind((Pb/PB)*sind(theta));

  fid=fopen('data8x.txt','a+');
                fprintf(fid,'%10.1f %10.4f %10.4f %10.4f\n',theta',Eb',phi',EB');
  fclose(fid);
end
M= load('data8x.txt');
x= M(:,1)';
y1=M(:,2)';
y2=M(:,3)';
y3=M(:,4)';
plot(x,y1,'b','Markersize',2,'LineWidth',2)
hold on
plot(y2,y3,'r','Markersize',2,'LineWidth',2)
%hold on
set(gca,'FontSize',16,'FontWeight','bold','linewidth',2)
r=xlabel('{\bf Energy(light particle)MeV }','interpreter','latex');
s=ylabel('{\bf Q value measured using reaction kinematics(MeV)}','interpreter','latex');
set(r,'FontSize',16);
set(r,'FontWeight','bold');
set(s,'FontSize',16);
set(s,'FontWeight','bold');
 
 
 
 