# linlin_blogs/config/initializers/aliyun_oss_init.rb
require 'aliyun/oss'

module OSS
  def self.client
    unless @client
      Aliyun::Common::Logging.set_log_file('./log/oss_sdk.log')

      @client = Aliyun::OSS::Client.new(
        endpoint:
          Rails.application.secrets.aliyun_oss['oss-cn-beijing.aliyuncs.com'],
        access_key_id:
          Rails.application.secrets.aliyun_oss['LTAI5tHHnvG1bYfPyjtBQF9E'],
        access_key_secret:
          Rails.application.secrets.aliyun_oss['AHlTFqpmfjVAsrUvavNlmVMnsMHYSo']
      )
    end

    @client
  end
end
