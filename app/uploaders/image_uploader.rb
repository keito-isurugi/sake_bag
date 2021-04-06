class ImageUploader < CarrierWave::Uploader::Base
  # # リサイズしたり画像形式を変更するのに必要
  # include CarrierWave::RMagick

  # # 画像の上限を640x480にする
  # process :resize_to_limit => [640, 480]

  # # 保存形式をJPGにする
  # process :convert => 'jpg'

  # # サムネイルを生成する設定
  # version :thumb do
  #   process :resize_to_limit => [300, 300]
  # end

  # version :thumb100 do
  #   process :resize_to_limit => [100, 100]
  # end

  # version :thumb30 do
  #   process :resize_to_limit => [30, 30]
  # end

  # # jpg,jpeg,gif,pngしか受け付けない
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  # # 拡張子が同じでないとGIFをJPGとかにコンバートできないので、ファイル名を変更
  # def filename
  #   super.chomp(File.extname(super)) + '.jpg' if original_filename.present?
  # end

  # # ファイル名を日付にするとタイミングのせいでサムネイル名がずれる
  # #ファイル名はランダムで一意になる
  # def filename
  #   "#{secure_token}.#{file.extension}" if original_filename.present?
  # end

  # protected
  # def secure_token
  #   var = :"@#{mounted_as}_secure_token"
  #   model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
  # end



  module ActionDispatch
    module Http
      class UploadedFile
        attr_accessor :original_filename, :content_type, :tempfile, :headers
  
        def initialize(hash) #
          @original_filename = encode_filename(hash[:filename]) 
          @content_type      = hash[:type]     #画像の保存形式
          @headers           = hash[:head]       # header 情報
          @tempfile          = hash[:tempfile]  # 画像データのリファレンス?
          raise(ArgumentError, ':tempfile is required') unless @tempfile
        end
  
        def read(*args)
          @tempfile.read(*args)
        end
  
        # Delegate these methods to the tempfile.
        # つまり、tempfileについて、size, path, open, などなどが使えるということ
        [:open, :path, :rewind, :size].each do |method|
          class_eval "def #{method}; @tempfile.#{method}; end"
        end
  
        private
        #画像のファイルネームを取り込む部分
        #強制的にUTF-8に変換
        def encode_filename(filename) 
          # Encode the filename in the utf8 encoding, unless it is nil or we're in 1.8
          if "ruby".encoding_aware? && filename
            filename.force_encoding("UTF-8").encode!
          else
            filename
          end
        end
      end
  
      module Upload
        # Convert nested Hash to HashWithIndifferentAccess and replace
        # file upload hash with UploadedFile objects
        def normalize_parameters(value)
          if Hash === value && value.has_key?(:tempfile)
            UploadedFile.new(value)
          else
            super
          end
        end
        private :normalize_parameters
      end
    end
  end
end


