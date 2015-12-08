%Main
close all
clear all
clc
global hiddenWeights;
global outputWeights;
global  labels;
global i;%Number of times the Traindatabase and Testdatabase functions are called
i=1;
global p;%Number of correctly classified students
p=0;
% Choose activation function.
activationFunction = @logisticSigmoid;
dActivationFunction = @dLogisticSigmoid;
while (1==1)
    choice=menu('Face Attendance System',...
                'Create Database of Faces',...
                'Delete DataBase',...
                'Train System',...
                'Face Recognition',...
                'Exit');
    if (choice ==1)
        CreateDatabase;
    end
    
    if (choice == 2)
        DeleteDatabase;
    end
    
    if (choice ==3)
    % Choose form of MLP:
    numberOfHiddenUnits = 300;
    
    % Choose appropriate parameters.
    learningRate = 0.1;
   
    % Choose batch size and epochs. Remember there are 60k input values.
    batchSize = 6;
    epochs = 1500;
    
    fprintf('Train twolayer perceptron with %d hidden units.\n', numberOfHiddenUnits);
    fprintf('Learning rate: %d.\n', learningRate);
    
    for n=1:200
        inputValues=[];
        TrainDatabasePath='C:\Users\C RAVI SUNDARAM\Desktop\ravi\pss projects\FEI'; 
        inputValues =TrainDatabase(TrainDatabasePath,i);
        inputValues=inputValues/255;
        targetValues = 0.*ones(7,7);
        for k = 1:7
            targetValues(1,k) = 1;
        end;
    
        [hiddenWeights, outputWeights] = trainStochasticSquaredErrorTwoLayerPerceptron(activationFunction, dActivationFunction, numberOfHiddenUnits, inputValues,targetValues, epochs, batchSize, learningRate);
        disp('training complete');
    
        TestDatabasePath='C:\Users\C RAVI SUNDARAM\Desktop\ravi\pss projects\FEI'; 
        inputValues =TestDatabase(TestDatabasePath,i);
        inputValues=inputValues/255;
        labels=0*ones(1,7);
        fprintf('Validation:\n');
    
        [correctlyClassified, classificationErrors] = validateTwoLayerPerceptron(activationFunction, hiddenWeights, outputWeights, inputValues, labels);
        sn=int2str(n);
        %disp(sn);
        %fprintf('Classification errors: %d\n', classificationErrors);
        %fprintf('Correctly classified: %d\n', correctlyClassified);
            if(correctlyClassified==7)
                p=p+1;
                disp(p);
            end
        i=i+1;
      end
    end
    
    %{
if (choice == 4)
        labels=[1,2,4,8,6];
        
        while (1==1)
            choice=menu('Face Recognition',...
                'Input Image From File',...
                'Capture Now',...
                'Recognition',...
                'Exit');
    if (choice ==1)
       try cd ('E:\pss projects\neural\Testimage');close all; end; 
         ChooseFile = imgetfile;
         inputValues=singleimage(ChooseFile);
         inputValues=inputValues/255;
         fprintf('Validation:\n');
             
    [correctlyClassified, classificationErrors] = validateTwoLayerPerceptron(activationFunction, hiddenWeights, outputWeights, inputValues, labels);
 %   i=i+1;
         
         %capcha = imcrop(capcha,[180,20,280,380]);
    end
    if (choice == 2)
        try cd ('E:\pss projects\neural\Testimage');close all; end;
        capturenow;

    end    
    if (choice == 3)
        
       %{
OutputName=Recognition(m, A, Eigenfaces);
       n=((OutputName+1)/2);
       
       im=imread('InputImage.jpg');
       cd ..;
       img=strcat('newdatabase\s',int2str(n),'\1.jpg');
       SelectedImage=imread(img);
       subplot(121);
       imshow(im)
    title('Test Image');
    subplot(122),imshow(SelectedImage);
    title('Equivalent Image');
       disp('Student No');
       disp(int2str(n));
        %}
       
    end
     
   if (choice == 4) 
       clc; 
        close all;
        return;
   end    
        end
    end
    %}
    if (choice == 5)
        clear all;
        clc;
        close all;
        return;
    end
end
    
