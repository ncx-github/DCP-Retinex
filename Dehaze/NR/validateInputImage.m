function validateInputImage(A)
    supportedClasses = {'uint8','uint16','single','double','int16'};
    attributes = {'nonempty','nonsparse','real','nonnan','finite'};

    validateattributes(A,supportedClasses,attributes,...
        mfilename,'A',1);

    validColorImage = (ndims(A) == 3) && (size(A,3) == 3);
    if ~(ismatrix(A) || validColorImage)
        error(message('images:validate:invalidImageFormat','A'));
    end
end