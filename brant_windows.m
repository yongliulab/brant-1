function window_names = brant_windows


window_names = {'brant_Preprocessing';...
                'brant_CheckBoard';...
                'FC';...
                'SPON';...
                'STAT';...
                'UTILITY';...
                'NET';...
                'VIEW';...
                'Draw ROI';...
                'ROI Calculation';...
                'Extract Time Series';...
                'AM';...
                'ALFF/fALFF';...
                'FCD/FCS';...
                'fGn';...
                'ReHo';...
                'Dicom Convert';...
                'Del Timepoints';...
                'Head Motion Est';...
                'Visual Check';...
                'TSNR';...
                'IBMA';...
                'EMBEDDED';...
                'Circos';...
                'DiffusionKit';...
                'Reslice';...
                'Mask to Table';...
                'Extract Mean 3D';...
                'Network Calculation';...
                'Network Statistics';...
                'Statistics';...
                'Surface Mapping';...
                'ROI Mapping';...
                'Merge/Extract Rois';...
                'Network Visualization';...
                'brant:network visualization';...
                'Brain Net Measure Options';...
};

window_names = [window_names; cellfun(@(x) strcat('brant help window:', x), window_names, 'UniformOutput', false)];