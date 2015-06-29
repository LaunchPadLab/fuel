class FuelController < ApplicationController

  helper_method :s3_bucket


  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  def s3_bucket
    return nil unless Fuel.configuration.aws_bucket.present?
    @s3_bucket ||= (
      AWS::S3.new.buckets[Fuel.configuration.aws_bucket]
    )
  end

end