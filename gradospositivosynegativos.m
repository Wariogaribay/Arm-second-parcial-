clear all
clc

prompt = 'Introduzca el valor de theta : '; 
theta = input (prompt);

prompt = 'Introduzca el valor de theta 2 : '; 
theta2 = input (prompt);

prompt = 'Introduzca el valor de traslación en eje x : '; 
L1 = input (prompt);

prompt = 'Introduzca el valor de traslación en eje x : '; 
L2 = input (prompt);

p1=[0 0 0]'; %punto donde va partir mi brazo o p1=[0;0;0]; debe ser en columna para poder multiplicarlo


theta  = deg2grad(theta);

if theta>=0
    
    angvec = 0:0.1:theta ;

else

    angvec = 0:-0.1:theta ;
    
end 


for i=1:length(angvec) %De uno hasta el tamaño del vector 'length' significa tamaño
 clf  
    
 line  ([-10 10], [0 0] , [0 0] , 'color' , [1 0 0], 'linewidth', 2.5); %Establece el eje x rojo
 line  ([0 0], [-10 10] , [0 0] , 'color' , [0 1 0], 'linewidth', 2.5); %Establece el eje y verde
         
 Rz = [cos(angvec(i)) -sin(angvec(i)) 0 0 ; sin(angvec(i)) cos(angvec(i)) 0 0 ; 0 0 1 0 ; 0 0 0 1];   %Rotación en Z
 Tx = [1 0 0 L1 ; 0 1 0 0 ; 0 0 1 0 ; 0 0 0 1];          %Matriz de traslación en x
 M  = Rz*Tx ;
 p2 = M(1:3,4);
 
 line([p1(1) p2(1)],[p1(2) p2(2)], [p1(3) p2(3)])
 
 
 
 
 Rz2 = [cos(0) -sin(0) 0 0 ; sin(0) cos(0) 0 0 ; 0 0 1 0 ; 0 0 0 1];   %Rotación en Z
 Tx2 = [1 0 0 L2 ; 0 1 0 0 ; 0 0 1 0 ; 0 0 0 1]; 
 M2  = Rz2*Tx2;
 Mf  = M*M2 ;
 p3  = Mf(1:3,4);
 line([p2(1) p3(1)],[p2(2) p3(2)], [p2(3) p3(3)],'color' , [0 0 0])
 
 pause(0.1)
 
end



