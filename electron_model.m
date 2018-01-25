clear
tstep=1;
tstop=10000
t=0
a=1
x=0
v=0
v_arr=[]
subplot(3,1,1)
while t<tstop
    xp=x
    x=x+v
    vp=v
    if rand()<0.05
        v=0
    else 
        v=v+a
    end
    v_arr=[v_arr,v]
    vdrift=x/t
    hold on
    subplot(3,1,1); 
    ylim([0 50])
    plot(t,vdrift,'*')
    hold on
    subplot(3,1,2); plot(t,mean(v_arr),'*')
    hold on
    subplot(3,1,3)
    plot([x,xp],[v,vp],'r')
    pause(0.001)
    title(['drift V =',num2str(vdrift)])
    
    t=t+tstep
end
vdrift=x/tstop
