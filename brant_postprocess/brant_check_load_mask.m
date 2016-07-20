function [mask_hdr, mask_ind, size_mask, mask_new] = brant_check_load_mask(mask_raw, sample_raw, outdir)
% check, reslice using nearest neighbour and load mask

[pth, mask_fn_raw, ext] = fileparts(mask_raw); %#ok<ASGLU>

if ~(exist(fullfile(outdir, [mask_fn_raw, ext]), 'file') == 2)
    copyfile(mask_raw, outdir);
end

mask_fn = fullfile(outdir, [mask_fn_raw, ext]);

% if strcmpi(ext, '.gz')
%     gunzip(fullfile(outdir, [mask_fn_raw, ext]));
%     mask_fn = fullfile(outdir, mask_fn_raw);
%     [pth, mask_fn_raw, ext] = fileparts(mask_fn); %#ok<ASGLU>
% else
%     mask_fn = fullfile(outdir, [mask_fn_raw, ext]);
% end

fprintf('Mask has been copied from %s to %s.\n', mask_raw, mask_fn);

% use only the first sample
sample_fn = brant_get_sample(sample_raw);

% check mask with sample
mask_nii = load_nii_mod(mask_fn);
sample_nii = load_nii_mod(sample_fn);
sts = brant_spm_check_orientations([mask_nii.hdr, sample_nii.hdr]);

if (sts == false)
    res_prefix = 'resliced_';
    brant_reslice(sample_fn, mask_fn, res_prefix);
    mask_new = fullfile(outdir, [res_prefix, mask_fn_raw, ext]);
    mask_nii = load_nii_mod(mask_new);
else
    mask_new = mask_fn;
end

mask_hdr = mask_nii.hdr;
mask_ind = find(mask_nii.img > 0.5);
size_mask = mask_nii.hdr.dime.dim(2:4);

function sample_out = brant_get_sample(sample_raw)
% sample fn could be either multiple 3D files or one 4D file
if iscell(sample_raw)
    sample_out = sample_raw{1};
else
    sample_out = sample_raw;
end