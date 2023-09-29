# frozen_string_literal: true

class SendSqsMessageService
  def initialize(kind, klass, object, params)
    @kind = kind
    @klass = klass
    @object = object
    @params = params
    @sqs = Aws::SQS::Client.new
    @queue_url = 'https://sqs.us-east-1.amazonaws.com/369869160593/QueueSQS'
    @school_token = 'I0sC_GmFEhcDrqZXyCwaEY025SK9wXZe77_ihh78EgQUEaDqE8tKSiQdh-rx48WbqrjNYUgZBlGIkAvSKv40COqaewXiaJZMmIko9nu89BE0M6qk9uWuSiLOnClSE29ASZG3CA'
  end

  def call
    @params.merge!({ 
      entity: @klass,
      kind: @kind, 
      school_token:  @school_token,
      legacy_id: @object.id.to_s 
    })
    attributes = {}

    @params.each do |key, value|
      attributes[key] = { data_type: 'String', string_value: value }
    end

    @sqs.send_message(
      queue_url: @queue_url,
      message_body: "#{@klass} #{@kind}",
      message_attributes: attributes
    )
  end
end
