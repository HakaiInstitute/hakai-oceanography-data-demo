%% 
%""" Use ERDDAP to retrieve the last 2 months of CTD provisional data collected 
% at QU39

url = 'https://catalogue.hakai.org/erddap/tabledap/HakaiWaterPropertiesInstrumentProfileProvisional.csvp?&station="QU39"&time>2022-01-01';
options = weboptions;
options.Timeout = 120;
data = webread(url,options);

% Add a row number
data.row_id = (1:height(data)).';

data = sortrows(data,["work_area","station","time_UTC_","pressure_dBar_"]);
data.row_id_sorted = (1:height(data)).';
%% Transform data
% Convert the variables to datetime objects 
data.time_UTC_ = datetime(data.time_UTC_,"Format","yyyy-MM-dd'T'HH:mm:ssZ",timezone="UTC");

% Flag any data that has been flagged as suspect(=3) or bad(=4)
is_uql = regexp(data.Properties.VariableNames,'_UQL_');
for id = 1: length(is_uql)
    if ~isempty(is_uql{id})
        data{data{:,id}== 3 | data{:,id}==4,id-1} = NaN;
    end
end

%%  Plot data
% Generate a simple scatter plot of temperature profiles at QU39

% Make a plot
figure
scatter(data,'time_UTC_','depth_m_','ColorVariable','salinity_PSU_')
set(gca,'YDir','reverse')
title("Hakai QU39 Provisional Dataset")

%%
figure
scatter(data,'row_id','depth_m_','ColorVariable','row_id_sorted')
set(gca,'YDir','reverse')