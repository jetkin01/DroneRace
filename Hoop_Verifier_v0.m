% Hoop Verifier

% Verifies that the drone went through each hoop

% Outputs:
%   clearances - 

%Clearances has data for each time step for each hoop
clearances = zeros(length(x.Data), 4));

hoop_clearance = 0.05; %m, distance under which will be considered collision

drone_rad = 0.15 + 0.15/2; %dist from center to motor, 1/2*prop radius


% Defining Hoops (based on provided simulink file)
hoop_rad = 0.5; %m outer radius
hoop_len = 0.02*2;%m in normal direction
hoop_thick = 0.02; %m perp to normal direction
%   Each hoop's position vector from origin to center
r1 = [5 0 0];
r2 = r1 + [5 0 2];
r3 = r2 + [25 0 -2];
r4 = r3 + [0 10 5];
%   Each hoop's normal vector defined by axis it is aligned with (in world
%   frame)
n1 = [1 0 0];
n2 = [0 0 1];
n3 = [0 1 0];
n4 = [0 0 1];

%Prepping data
xpos = x.Data;
ypos = y.Data;
zpos = z.Data;

%Construct list of position vectors relative to origin
pos = [xpos ypos zpos];

%Construct list of position vectors from hoop to body
pos_rel_h1 = r1 - pos;
pos_rel_h2 = r2 - pos;
pos_rel_h3 = r3 - pos;
pos_rel_h4 = r4 - pos;

%Construct list of scalar distances to each hoop
dist_rel_h1 = norm(pos_rel_h1(:));
dist_rel_h2 = norm(pos_rel_h2(:));
dist_rel_h3 = norm(pos_rel_h3(:));
dist_rel_h4 = norm(pos_rel_h4(:));

%Check any potential clearances of hoop one (defined by coming within 1
%hoop rad of it
for i = 1:length(dist_rel_h1)
    if(dist_rel_h1 <= hoop_rad)
        %Step 1: make sure the drone didn't hit the hoop
        %Need to make sure the edge of the drone wasn't within a threshold
        %distance of the hoop
        if()
    end
end

% %OLD ALGORITHM
% for i = 1:length(x)
%     pos = [xpos(i) ypos(i) zpos(i)];
%     
%     if(norm(pos-r1)) % Check if pos is within 1 hoop radius of hoop 1
%     
%     end
%     if(norm(pos-r2)) % Check if pos is within 1 hoop radius of hoop 2
%     
%     end
%     if(norm(pos-r3)) % Check if pos is within 1 hoop radius of hoop 3
%     
%     end
%     if(norm(pos-r4)) % Check if pos is within 1 hoop radius of hoop 4
%     
%     end
% 
% 
% end
