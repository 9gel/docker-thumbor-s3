ENGINE = "graphicsmagick_engine"
LOADER = "tc_aws.loaders.s3_loader"
AWS_ACCESS_KEY = "{{ AWS_ACCESS_KEY_ID }}"
AWS_SECRET_KEY = "{{ AWS_SECRET_ACCESS_KEY }}"
AWS_ENABLE_HTTP_LOADER = False
S3_ALLOWED_BUCKETS = ["{{ AWS_S3_BUCKET }}"]
S3_LOADER_BUCKET = "{{ AWS_S3_BUCKET }}"

QUALITY = 85
MAX_AGE = 2592000
MAX_AGE_TEMP_IMAGE = 0
UPLOAD_ENABLED = False
UPLOAD_PHOTO_STORAGE = False
STORAGE = "thumbor.storages.file_storage"
FILE_STORAGE_ROOT_PATH = "/src/thumbor/storage"

ALLOW_OLD_URLS = False
FILTERS = ["thumbor.filters.brightness","thumbor.filters.contrast","thumbor.filters.rgb","thumbor.filters.round_corner","thumbor.filters.quality","thumbor.filters.noise","thumbor.filters.watermark","thumbor.filters.equalize","thumbor.filters.fill","thumbor.filters.sharpen","thumbor.filters.strip_icc","thumbor.filters.frame"]
DETECTORS = []

ALLOW_UNSAFE_URL = False
SECURITY_KEY = "{{ THUMBOR_KEY }}"
