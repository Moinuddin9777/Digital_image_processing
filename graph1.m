a = [0:0.5:5];
b = 2*a.^2 + 3*a -5;
c = 1.2*a.^2+4*a-3;
hold on
plot(a,b,'-or','MarkerFaceColor','g','LineWidth',2)
plot(a,c,'--ok','MarkerFaceColor','c','LineWidth',2)
xlabel('X'); ylabel('Y'); legend('Curve 1','Curve 2','Location','NorthWest')
