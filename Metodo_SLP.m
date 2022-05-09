%% Este script tiene como función crear el diagrama resultante del metodo SLP.
% Realizara las interacciones necesarias para conectar todos los puntos.
%% Nota importante: las imágenes serán guardadas en la carpeta donde
% se haya extraído almacenado el script.
clc, clear, close all
%% Datos organizados de acuerdo con la matriz
vec = ["AEIOOIEAAEIIOXXXWXIXIEOWWU"
    "AEIOOIEAAEIIOXXXWXIXIEOWWU"
    "EAEIIEAAEEEIIOOXOOOXOOXWWU"
    "IEAEEAAAEEEIEIIIOIOOIIIWWU"
    "OIEAAAAEEEEIEIEEIEOOIIIWWU"
    "OIEAAAEIIEEIEIAAEEOOIIIWWU"
    "IEAAAAEIIEAEAEAAEAIIIEEWWU"
    "EAAAEEAEEAAEAEEEIEIIEEEWWU"
    "AAAEIIEAAAAEEEIIOIIIEEIWWU"
    "AEEEIIEAAAEEIIOOUOOOEEOWWU"
    "EEEEEEAAAAEEIIOOXOIOAAOWWU"
    "IEEEEAAAEEAAEEIIOIEIAAIWWU"
    "IIIIIEEEEEAAAAEEIEEEEAEWWU"
    "OIEEEAAEIIEAAAEEIEAEEAEWWU"
    "XOIIIEEEIIEAAAAEEAEEIEAWWU"
    "XOIEAAEIOOIEEAEIEAAAIEAWWU"
    "XXIEAAEIOOIEEEIAAAIIOIEWWU"
    "WOOIEEIOUXOIIEEAAEOOOIIWWU"
    "XOIEEAEIOOIEEAAAEAEAUOAWWU"
    "IOOOOIIIOIEEAEAIOEEEOIAWWU"
    "XXOOOIIIOOIEEEAIOAEAIEAWWU"
    "IOIIIIEEEAAEEIIOOUOIOIAWWU"
    "EOIIIEEEEAAAAEEIIOIEIAOWWU"
    "OXIIIEEIOOIEEAAEIAAAAOIWWU"
    "WWWWWWWWWWWWWWWWWWWWWWWWWU"
    "WWWWWWWWWWWWWWWWWWWWWWWWWU"
    "UUUUUUUUUUUUUUUUUUUUUUUUUU"];
% Posiciones de los circuilos.
xp = [1 2 3 4 5 5 4 3 2 2 3 4 4 5 5 6 6 7 6 4 5.5 2 3 6 8 8 2.5];
yp =[0 2 2 2 2 1 1 1 1 0 0 0 -1 0 -1 1  2 0 0 -2 -2 -1 -1 -1 1 -2 -2];
% Creación de la figura.
im = figure('Name','Measured Data','NumberTitle','off');
    axes1 = axes('Parent',im);
%% Inició de loop para crear los diagramas.
for i = 1:27 % Diagramas
    %% Datos preeliminares fijos
    cadena = char(vec(i));
    plot(xp,yp,'MarkerFaceColor',[0.5 0.5 0.5],...
        'MarkerEdgeColor',[1 0.5 0],...
        'MarkerSize',10,...
        'Marker','o',...
        'LineWidth',20,...
        'LineStyle','none',...
        'Color',[0 1 0]);
    xlim([-1 9])
    ylim([-3 3])
    
    %% Selección de color de línea, dependiendo de la letra.
    hold on
    for c = 1:26 % Letras
        if cadena(c) == 'A'
            color = [1 0 0];
        elseif cadena(c) == 'E'
            color = [0 1 0];
        elseif cadena(c) == 'I'
            color = [0 0 1];
        elseif cadena(c) == 'O'
            color = [0.5 0.5 0.5];
        elseif cadena(c) == 'U'
            color = [1 0 1];
        elseif cadena(c) == 'X'
            color = [1 1 0];
        elseif cadena(c) == 'W'
            color = [0 0.5 0.5];
        end
        if c < i
            g = 0;
        else
            g = 1;
            
        end
        plot([xp(i) xp(c+g)],[yp(i) yp(c+g)],'-o','Color',color,...
            'MarkerFaceColor',color,'Parent',axes1)
    end
    %% Loop para colocar números en los círculos.
    for l=1:27 % Números
        if l <= 9
            j = 0.1;
        else
            j = 0.25;
        end
        text(xp(l)-j,yp(l),string(l),...
            'Color','white','FontSize',14,'Parent',axes1)
    end
    %% Eliminación de la escala de los ejes y creación del archivo.
    set(axes1,'XTick',zeros(1,0),'YTick',zeros(1,0));
    file = sprintf("diagrama (%d).jpg",i);
    
    % Si deseas que se creen imagenes individuales y no uno
    % completo, descomenta los siguientes dos comandos.
    %exportgraphics(im,file,'Resolution',300)
    %hold off
end
% Si solo quieres un diagrama, usa la siguiente línea.
exportgraphics(im,file,'Resolution',300)