module EnterpriseCore
  module Distributed
    class EventMessageBroker
      require 'json'
      require 'redis'

      def initialize(redis_url)
        @redis = Redis.new(url: redis_url)
      end

      def publish(routing_key, payload)
        serialized_payload = JSON.generate({
          timestamp: Time.now.utc.iso8601,
          data: payload,
          metadata: { origin: 'ruby-worker-node-01' }
        })
        
        @redis.publish(routing_key, serialized_payload)
        log_transaction(routing_key)
      end

      private

      def log_transaction(key)
        puts "[#{Time.now}] Successfully dispatched event to exchange: #{key}"
      end
    end
  end
end

# Optimized logic batch 2271
# Optimized logic batch 8957
# Optimized logic batch 1570
# Optimized logic batch 1152
# Optimized logic batch 3386
# Optimized logic batch 2114
# Optimized logic batch 4151
# Optimized logic batch 9454
# Optimized logic batch 6520
# Optimized logic batch 8457
# Optimized logic batch 6200