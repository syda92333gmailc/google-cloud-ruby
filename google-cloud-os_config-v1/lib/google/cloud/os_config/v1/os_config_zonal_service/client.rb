# frozen_string_literal: true

# Copyright 2021 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Auto-generated by gapic-generator-ruby. DO NOT EDIT!

require "google/cloud/errors"
require "google/cloud/osconfig/v1/osconfig_zonal_service_pb"

module Google
  module Cloud
    module OsConfig
      module V1
        module OsConfigZonalService
          ##
          # Client for the OsConfigZonalService service.
          #
          # Zonal OS Config API
          #
          # The OS Config service is the server-side component that allows users to
          # manage package installations and patch jobs for Compute Engine VM instances.
          #
          class Client
            include Paths

            # @private
            attr_reader :os_config_zonal_service_stub

            ##
            # Configure the OsConfigZonalService Client class.
            #
            # See {::Google::Cloud::OsConfig::V1::OsConfigZonalService::Client::Configuration}
            # for a description of the configuration fields.
            #
            # @example
            #
            #   # Modify the configuration for all OsConfigZonalService clients
            #   ::Google::Cloud::OsConfig::V1::OsConfigZonalService::Client.configure do |config|
            #     config.timeout = 10.0
            #   end
            #
            # @yield [config] Configure the Client client.
            # @yieldparam config [Client::Configuration]
            #
            # @return [Client::Configuration]
            #
            def self.configure
              @configure ||= begin
                namespace = ["Google", "Cloud", "OsConfig", "V1"]
                parent_config = while namespace.any?
                                  parent_name = namespace.join "::"
                                  parent_const = const_get parent_name
                                  break parent_const.configure if parent_const.respond_to? :configure
                                  namespace.pop
                                end
                default_config = Client::Configuration.new parent_config

                default_config.timeout = 60.0
                default_config.retry_policy = {
                  initial_delay: 1.0, max_delay: 60.0, multiplier: 1.3, retry_codes: [14]
                }

                default_config
              end
              yield @configure if block_given?
              @configure
            end

            ##
            # Configure the OsConfigZonalService Client instance.
            #
            # The configuration is set to the derived mode, meaning that values can be changed,
            # but structural changes (adding new fields, etc.) are not allowed. Structural changes
            # should be made on {Client.configure}.
            #
            # See {::Google::Cloud::OsConfig::V1::OsConfigZonalService::Client::Configuration}
            # for a description of the configuration fields.
            #
            # @yield [config] Configure the Client client.
            # @yieldparam config [Client::Configuration]
            #
            # @return [Client::Configuration]
            #
            def configure
              yield @config if block_given?
              @config
            end

            ##
            # Create a new OsConfigZonalService client object.
            #
            # @example
            #
            #   # Create a client using the default configuration
            #   client = ::Google::Cloud::OsConfig::V1::OsConfigZonalService::Client.new
            #
            #   # Create a client using a custom configuration
            #   client = ::Google::Cloud::OsConfig::V1::OsConfigZonalService::Client.new do |config|
            #     config.timeout = 10.0
            #   end
            #
            # @yield [config] Configure the OsConfigZonalService client.
            # @yieldparam config [Client::Configuration]
            #
            def initialize
              # These require statements are intentionally placed here to initialize
              # the gRPC module only when it's required.
              # See https://github.com/googleapis/toolkit/issues/446
              require "gapic/grpc"
              require "google/cloud/osconfig/v1/osconfig_zonal_service_services_pb"

              # Create the configuration object
              @config = Configuration.new Client.configure

              # Yield the configuration if needed
              yield @config if block_given?

              # Create credentials
              credentials = @config.credentials
              # Use self-signed JWT if the endpoint is unchanged from default,
              # but only if the default endpoint does not have a region prefix.
              enable_self_signed_jwt = @config.endpoint == Client.configure.endpoint &&
                                       !@config.endpoint.split(".").first.include?("-")
              credentials ||= Credentials.default scope: @config.scope,
                                                  enable_self_signed_jwt: enable_self_signed_jwt
              if credentials.is_a?(::String) || credentials.is_a?(::Hash)
                credentials = Credentials.new credentials, scope: @config.scope
              end
              @quota_project_id = @config.quota_project
              @quota_project_id ||= credentials.quota_project_id if credentials.respond_to? :quota_project_id

              @os_config_zonal_service_stub = ::Gapic::ServiceStub.new(
                ::Google::Cloud::OsConfig::V1::OsConfigZonalService::Stub,
                credentials:  credentials,
                endpoint:     @config.endpoint,
                channel_args: @config.channel_args,
                interceptors: @config.interceptors
              )
            end

            # Service calls

            ##
            # Get inventory data for the specified VM instance. If the VM has no
            # associated inventory, the message `NOT_FOUND` is returned.
            #
            # @overload get_inventory(request, options = nil)
            #   Pass arguments to `get_inventory` via a request object, either of type
            #   {::Google::Cloud::OsConfig::V1::GetInventoryRequest} or an equivalent Hash.
            #
            #   @param request [::Google::Cloud::OsConfig::V1::GetInventoryRequest, ::Hash]
            #     A request object representing the call parameters. Required. To specify no
            #     parameters, or to keep all the default parameter values, pass an empty Hash.
            #   @param options [::Gapic::CallOptions, ::Hash]
            #     Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
            #
            # @overload get_inventory(name: nil, view: nil)
            #   Pass arguments to `get_inventory` via keyword arguments. Note that at
            #   least one keyword argument is required. To specify no parameters, or to keep all
            #   the default parameter values, pass an empty Hash as a request object (see above).
            #
            #   @param name [::String]
            #     Required. API resource name for inventory resource.
            #
            #     Format:
            #     `projects/{project}/locations/{location}/instances/{instance}/inventory`
            #
            #     For `{project}`, either `project-number` or `project-id` can be provided.
            #     For `{instance}`, either Compute Engine  `instance-id` or `instance-name`
            #     can be provided.
            #   @param view [::Google::Cloud::OsConfig::V1::InventoryView]
            #     Inventory view indicating what information should be included in the
            #     inventory resource. If unspecified, the default view is BASIC.
            #
            # @yield [response, operation] Access the result along with the RPC operation
            # @yieldparam response [::Google::Cloud::OsConfig::V1::Inventory]
            # @yieldparam operation [::GRPC::ActiveCall::Operation]
            #
            # @return [::Google::Cloud::OsConfig::V1::Inventory]
            #
            # @raise [::Google::Cloud::Error] if the RPC is aborted.
            #
            def get_inventory request, options = nil
              raise ::ArgumentError, "request must be provided" if request.nil?

              request = ::Gapic::Protobuf.coerce request, to: ::Google::Cloud::OsConfig::V1::GetInventoryRequest

              # Converts hash and nil to an options object
              options = ::Gapic::CallOptions.new(**options.to_h) if options.respond_to? :to_h

              # Customize the options with defaults
              metadata = @config.rpcs.get_inventory.metadata.to_h

              # Set x-goog-api-client and x-goog-user-project headers
              metadata[:"x-goog-api-client"] ||= ::Gapic::Headers.x_goog_api_client \
                lib_name: @config.lib_name, lib_version: @config.lib_version,
                gapic_version: ::Google::Cloud::OsConfig::V1::VERSION
              metadata[:"x-goog-user-project"] = @quota_project_id if @quota_project_id

              header_params = {
                "name" => request.name
              }
              request_params_header = header_params.map { |k, v| "#{k}=#{v}" }.join("&")
              metadata[:"x-goog-request-params"] ||= request_params_header

              options.apply_defaults timeout:      @config.rpcs.get_inventory.timeout,
                                     metadata:     metadata,
                                     retry_policy: @config.rpcs.get_inventory.retry_policy

              options.apply_defaults timeout:      @config.timeout,
                                     metadata:     @config.metadata,
                                     retry_policy: @config.retry_policy

              @os_config_zonal_service_stub.call_rpc :get_inventory, request, options: options do |response, operation|
                yield response, operation if block_given?
                return response
              end
            rescue ::GRPC::BadStatus => e
              raise ::Google::Cloud::Error.from_error(e)
            end

            ##
            # List inventory data for all VM instances in the specified zone.
            #
            # @overload list_inventories(request, options = nil)
            #   Pass arguments to `list_inventories` via a request object, either of type
            #   {::Google::Cloud::OsConfig::V1::ListInventoriesRequest} or an equivalent Hash.
            #
            #   @param request [::Google::Cloud::OsConfig::V1::ListInventoriesRequest, ::Hash]
            #     A request object representing the call parameters. Required. To specify no
            #     parameters, or to keep all the default parameter values, pass an empty Hash.
            #   @param options [::Gapic::CallOptions, ::Hash]
            #     Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
            #
            # @overload list_inventories(parent: nil, view: nil, page_size: nil, page_token: nil, filter: nil)
            #   Pass arguments to `list_inventories` via keyword arguments. Note that at
            #   least one keyword argument is required. To specify no parameters, or to keep all
            #   the default parameter values, pass an empty Hash as a request object (see above).
            #
            #   @param parent [::String]
            #     Required. The parent resource name.
            #
            #     Format: `projects/{project}/locations/{location}/instances/-`
            #
            #     For `{project}`, either `project-number` or `project-id` can be provided.
            #   @param view [::Google::Cloud::OsConfig::V1::InventoryView]
            #     Inventory view indicating what information should be included in the
            #     inventory resource. If unspecified, the default view is BASIC.
            #   @param page_size [::Integer]
            #     The maximum number of results to return.
            #   @param page_token [::String]
            #     A pagination token returned from a previous call to
            #     `ListInventories` that indicates where this listing
            #     should continue from.
            #   @param filter [::String]
            #     If provided, this field specifies the criteria that must be met by a
            #     `Inventory` API resource to be included in the response.
            #
            # @yield [response, operation] Access the result along with the RPC operation
            # @yieldparam response [::Gapic::PagedEnumerable<::Google::Cloud::OsConfig::V1::Inventory>]
            # @yieldparam operation [::GRPC::ActiveCall::Operation]
            #
            # @return [::Gapic::PagedEnumerable<::Google::Cloud::OsConfig::V1::Inventory>]
            #
            # @raise [::Google::Cloud::Error] if the RPC is aborted.
            #
            def list_inventories request, options = nil
              raise ::ArgumentError, "request must be provided" if request.nil?

              request = ::Gapic::Protobuf.coerce request, to: ::Google::Cloud::OsConfig::V1::ListInventoriesRequest

              # Converts hash and nil to an options object
              options = ::Gapic::CallOptions.new(**options.to_h) if options.respond_to? :to_h

              # Customize the options with defaults
              metadata = @config.rpcs.list_inventories.metadata.to_h

              # Set x-goog-api-client and x-goog-user-project headers
              metadata[:"x-goog-api-client"] ||= ::Gapic::Headers.x_goog_api_client \
                lib_name: @config.lib_name, lib_version: @config.lib_version,
                gapic_version: ::Google::Cloud::OsConfig::V1::VERSION
              metadata[:"x-goog-user-project"] = @quota_project_id if @quota_project_id

              header_params = {
                "parent" => request.parent
              }
              request_params_header = header_params.map { |k, v| "#{k}=#{v}" }.join("&")
              metadata[:"x-goog-request-params"] ||= request_params_header

              options.apply_defaults timeout:      @config.rpcs.list_inventories.timeout,
                                     metadata:     metadata,
                                     retry_policy: @config.rpcs.list_inventories.retry_policy

              options.apply_defaults timeout:      @config.timeout,
                                     metadata:     @config.metadata,
                                     retry_policy: @config.retry_policy

              @os_config_zonal_service_stub.call_rpc :list_inventories, request, options: options do |response, operation|
                response = ::Gapic::PagedEnumerable.new @os_config_zonal_service_stub, :list_inventories, request, response, operation, options
                yield response, operation if block_given?
                return response
              end
            rescue ::GRPC::BadStatus => e
              raise ::Google::Cloud::Error.from_error(e)
            end

            ##
            # Gets the vulnerability report for the specified VM instance. Only VMs with
            # inventory data have vulnerability reports associated with them.
            #
            # @overload get_vulnerability_report(request, options = nil)
            #   Pass arguments to `get_vulnerability_report` via a request object, either of type
            #   {::Google::Cloud::OsConfig::V1::GetVulnerabilityReportRequest} or an equivalent Hash.
            #
            #   @param request [::Google::Cloud::OsConfig::V1::GetVulnerabilityReportRequest, ::Hash]
            #     A request object representing the call parameters. Required. To specify no
            #     parameters, or to keep all the default parameter values, pass an empty Hash.
            #   @param options [::Gapic::CallOptions, ::Hash]
            #     Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
            #
            # @overload get_vulnerability_report(name: nil)
            #   Pass arguments to `get_vulnerability_report` via keyword arguments. Note that at
            #   least one keyword argument is required. To specify no parameters, or to keep all
            #   the default parameter values, pass an empty Hash as a request object (see above).
            #
            #   @param name [::String]
            #     Required. API resource name for vulnerability resource.
            #
            #     Format:
            #     `projects/{project}/locations/{location}/instances/{instance}/vulnerabilityReport`
            #
            #     For `{project}`, either `project-number` or `project-id` can be provided.
            #     For `{instance}`, either Compute Engine `instance-id` or `instance-name`
            #     can be provided.
            #
            # @yield [response, operation] Access the result along with the RPC operation
            # @yieldparam response [::Google::Cloud::OsConfig::V1::VulnerabilityReport]
            # @yieldparam operation [::GRPC::ActiveCall::Operation]
            #
            # @return [::Google::Cloud::OsConfig::V1::VulnerabilityReport]
            #
            # @raise [::Google::Cloud::Error] if the RPC is aborted.
            #
            def get_vulnerability_report request, options = nil
              raise ::ArgumentError, "request must be provided" if request.nil?

              request = ::Gapic::Protobuf.coerce request, to: ::Google::Cloud::OsConfig::V1::GetVulnerabilityReportRequest

              # Converts hash and nil to an options object
              options = ::Gapic::CallOptions.new(**options.to_h) if options.respond_to? :to_h

              # Customize the options with defaults
              metadata = @config.rpcs.get_vulnerability_report.metadata.to_h

              # Set x-goog-api-client and x-goog-user-project headers
              metadata[:"x-goog-api-client"] ||= ::Gapic::Headers.x_goog_api_client \
                lib_name: @config.lib_name, lib_version: @config.lib_version,
                gapic_version: ::Google::Cloud::OsConfig::V1::VERSION
              metadata[:"x-goog-user-project"] = @quota_project_id if @quota_project_id

              header_params = {
                "name" => request.name
              }
              request_params_header = header_params.map { |k, v| "#{k}=#{v}" }.join("&")
              metadata[:"x-goog-request-params"] ||= request_params_header

              options.apply_defaults timeout:      @config.rpcs.get_vulnerability_report.timeout,
                                     metadata:     metadata,
                                     retry_policy: @config.rpcs.get_vulnerability_report.retry_policy

              options.apply_defaults timeout:      @config.timeout,
                                     metadata:     @config.metadata,
                                     retry_policy: @config.retry_policy

              @os_config_zonal_service_stub.call_rpc :get_vulnerability_report, request, options: options do |response, operation|
                yield response, operation if block_given?
                return response
              end
            rescue ::GRPC::BadStatus => e
              raise ::Google::Cloud::Error.from_error(e)
            end

            ##
            # List vulnerability reports for all VM instances in the specified zone.
            #
            # @overload list_vulnerability_reports(request, options = nil)
            #   Pass arguments to `list_vulnerability_reports` via a request object, either of type
            #   {::Google::Cloud::OsConfig::V1::ListVulnerabilityReportsRequest} or an equivalent Hash.
            #
            #   @param request [::Google::Cloud::OsConfig::V1::ListVulnerabilityReportsRequest, ::Hash]
            #     A request object representing the call parameters. Required. To specify no
            #     parameters, or to keep all the default parameter values, pass an empty Hash.
            #   @param options [::Gapic::CallOptions, ::Hash]
            #     Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
            #
            # @overload list_vulnerability_reports(parent: nil, page_size: nil, page_token: nil, filter: nil)
            #   Pass arguments to `list_vulnerability_reports` via keyword arguments. Note that at
            #   least one keyword argument is required. To specify no parameters, or to keep all
            #   the default parameter values, pass an empty Hash as a request object (see above).
            #
            #   @param parent [::String]
            #     Required. The parent resource name.
            #
            #     Format: `projects/{project}/locations/{location}/instances/-`
            #
            #     For `{project}`, either `project-number` or `project-id` can be provided.
            #   @param page_size [::Integer]
            #     The maximum number of results to return.
            #   @param page_token [::String]
            #     A pagination token returned from a previous call to
            #     `ListVulnerabilityReports` that indicates where this listing
            #     should continue from.
            #   @param filter [::String]
            #     If provided, this field specifies the criteria that must be met by a
            #     `vulnerabilityReport` API resource to be included in the response.
            #
            # @yield [response, operation] Access the result along with the RPC operation
            # @yieldparam response [::Gapic::PagedEnumerable<::Google::Cloud::OsConfig::V1::VulnerabilityReport>]
            # @yieldparam operation [::GRPC::ActiveCall::Operation]
            #
            # @return [::Gapic::PagedEnumerable<::Google::Cloud::OsConfig::V1::VulnerabilityReport>]
            #
            # @raise [::Google::Cloud::Error] if the RPC is aborted.
            #
            def list_vulnerability_reports request, options = nil
              raise ::ArgumentError, "request must be provided" if request.nil?

              request = ::Gapic::Protobuf.coerce request, to: ::Google::Cloud::OsConfig::V1::ListVulnerabilityReportsRequest

              # Converts hash and nil to an options object
              options = ::Gapic::CallOptions.new(**options.to_h) if options.respond_to? :to_h

              # Customize the options with defaults
              metadata = @config.rpcs.list_vulnerability_reports.metadata.to_h

              # Set x-goog-api-client and x-goog-user-project headers
              metadata[:"x-goog-api-client"] ||= ::Gapic::Headers.x_goog_api_client \
                lib_name: @config.lib_name, lib_version: @config.lib_version,
                gapic_version: ::Google::Cloud::OsConfig::V1::VERSION
              metadata[:"x-goog-user-project"] = @quota_project_id if @quota_project_id

              header_params = {
                "parent" => request.parent
              }
              request_params_header = header_params.map { |k, v| "#{k}=#{v}" }.join("&")
              metadata[:"x-goog-request-params"] ||= request_params_header

              options.apply_defaults timeout:      @config.rpcs.list_vulnerability_reports.timeout,
                                     metadata:     metadata,
                                     retry_policy: @config.rpcs.list_vulnerability_reports.retry_policy

              options.apply_defaults timeout:      @config.timeout,
                                     metadata:     @config.metadata,
                                     retry_policy: @config.retry_policy

              @os_config_zonal_service_stub.call_rpc :list_vulnerability_reports, request, options: options do |response, operation|
                response = ::Gapic::PagedEnumerable.new @os_config_zonal_service_stub, :list_vulnerability_reports, request, response, operation, options
                yield response, operation if block_given?
                return response
              end
            rescue ::GRPC::BadStatus => e
              raise ::Google::Cloud::Error.from_error(e)
            end

            ##
            # Configuration class for the OsConfigZonalService API.
            #
            # This class represents the configuration for OsConfigZonalService,
            # providing control over timeouts, retry behavior, logging, transport
            # parameters, and other low-level controls. Certain parameters can also be
            # applied individually to specific RPCs. See
            # {::Google::Cloud::OsConfig::V1::OsConfigZonalService::Client::Configuration::Rpcs}
            # for a list of RPCs that can be configured independently.
            #
            # Configuration can be applied globally to all clients, or to a single client
            # on construction.
            #
            # @example
            #
            #   # Modify the global config, setting the timeout for
            #   # get_inventory to 20 seconds,
            #   # and all remaining timeouts to 10 seconds.
            #   ::Google::Cloud::OsConfig::V1::OsConfigZonalService::Client.configure do |config|
            #     config.timeout = 10.0
            #     config.rpcs.get_inventory.timeout = 20.0
            #   end
            #
            #   # Apply the above configuration only to a new client.
            #   client = ::Google::Cloud::OsConfig::V1::OsConfigZonalService::Client.new do |config|
            #     config.timeout = 10.0
            #     config.rpcs.get_inventory.timeout = 20.0
            #   end
            #
            # @!attribute [rw] endpoint
            #   The hostname or hostname:port of the service endpoint.
            #   Defaults to `"osconfig.googleapis.com"`.
            #   @return [::String]
            # @!attribute [rw] credentials
            #   Credentials to send with calls. You may provide any of the following types:
            #    *  (`String`) The path to a service account key file in JSON format
            #    *  (`Hash`) A service account key as a Hash
            #    *  (`Google::Auth::Credentials`) A googleauth credentials object
            #       (see the [googleauth docs](https://googleapis.dev/ruby/googleauth/latest/index.html))
            #    *  (`Signet::OAuth2::Client`) A signet oauth2 client object
            #       (see the [signet docs](https://googleapis.dev/ruby/signet/latest/Signet/OAuth2/Client.html))
            #    *  (`GRPC::Core::Channel`) a gRPC channel with included credentials
            #    *  (`GRPC::Core::ChannelCredentials`) a gRPC credentails object
            #    *  (`nil`) indicating no credentials
            #   @return [::Object]
            # @!attribute [rw] scope
            #   The OAuth scopes
            #   @return [::Array<::String>]
            # @!attribute [rw] lib_name
            #   The library name as recorded in instrumentation and logging
            #   @return [::String]
            # @!attribute [rw] lib_version
            #   The library version as recorded in instrumentation and logging
            #   @return [::String]
            # @!attribute [rw] channel_args
            #   Extra parameters passed to the gRPC channel. Note: this is ignored if a
            #   `GRPC::Core::Channel` object is provided as the credential.
            #   @return [::Hash]
            # @!attribute [rw] interceptors
            #   An array of interceptors that are run before calls are executed.
            #   @return [::Array<::GRPC::ClientInterceptor>]
            # @!attribute [rw] timeout
            #   The call timeout in seconds.
            #   @return [::Numeric]
            # @!attribute [rw] metadata
            #   Additional gRPC headers to be sent with the call.
            #   @return [::Hash{::Symbol=>::String}]
            # @!attribute [rw] retry_policy
            #   The retry policy. The value is a hash with the following keys:
            #    *  `:initial_delay` (*type:* `Numeric`) - The initial delay in seconds.
            #    *  `:max_delay` (*type:* `Numeric`) - The max delay in seconds.
            #    *  `:multiplier` (*type:* `Numeric`) - The incremental backoff multiplier.
            #    *  `:retry_codes` (*type:* `Array<String>`) - The error codes that should
            #       trigger a retry.
            #   @return [::Hash]
            # @!attribute [rw] quota_project
            #   A separate project against which to charge quota.
            #   @return [::String]
            #
            class Configuration
              extend ::Gapic::Config

              config_attr :endpoint,      "osconfig.googleapis.com", ::String
              config_attr :credentials,   nil do |value|
                allowed = [::String, ::Hash, ::Proc, ::Symbol, ::Google::Auth::Credentials, ::Signet::OAuth2::Client, nil]
                allowed += [::GRPC::Core::Channel, ::GRPC::Core::ChannelCredentials] if defined? ::GRPC
                allowed.any? { |klass| klass === value }
              end
              config_attr :scope,         nil, ::String, ::Array, nil
              config_attr :lib_name,      nil, ::String, nil
              config_attr :lib_version,   nil, ::String, nil
              config_attr(:channel_args,  { "grpc.service_config_disable_resolution" => 1 }, ::Hash, nil)
              config_attr :interceptors,  nil, ::Array, nil
              config_attr :timeout,       nil, ::Numeric, nil
              config_attr :metadata,      nil, ::Hash, nil
              config_attr :retry_policy,  nil, ::Hash, ::Proc, nil
              config_attr :quota_project, nil, ::String, nil

              # @private
              def initialize parent_config = nil
                @parent_config = parent_config unless parent_config.nil?

                yield self if block_given?
              end

              ##
              # Configurations for individual RPCs
              # @return [Rpcs]
              #
              def rpcs
                @rpcs ||= begin
                  parent_rpcs = nil
                  parent_rpcs = @parent_config.rpcs if defined?(@parent_config) && @parent_config.respond_to?(:rpcs)
                  Rpcs.new parent_rpcs
                end
              end

              ##
              # Configuration RPC class for the OsConfigZonalService API.
              #
              # Includes fields providing the configuration for each RPC in this service.
              # Each configuration object is of type `Gapic::Config::Method` and includes
              # the following configuration fields:
              #
              #  *  `timeout` (*type:* `Numeric`) - The call timeout in seconds
              #  *  `metadata` (*type:* `Hash{Symbol=>String}`) - Additional gRPC headers
              #  *  `retry_policy (*type:* `Hash`) - The retry policy. The policy fields
              #     include the following keys:
              #      *  `:initial_delay` (*type:* `Numeric`) - The initial delay in seconds.
              #      *  `:max_delay` (*type:* `Numeric`) - The max delay in seconds.
              #      *  `:multiplier` (*type:* `Numeric`) - The incremental backoff multiplier.
              #      *  `:retry_codes` (*type:* `Array<String>`) - The error codes that should
              #         trigger a retry.
              #
              class Rpcs
                ##
                # RPC-specific configuration for `get_inventory`
                # @return [::Gapic::Config::Method]
                #
                attr_reader :get_inventory
                ##
                # RPC-specific configuration for `list_inventories`
                # @return [::Gapic::Config::Method]
                #
                attr_reader :list_inventories
                ##
                # RPC-specific configuration for `get_vulnerability_report`
                # @return [::Gapic::Config::Method]
                #
                attr_reader :get_vulnerability_report
                ##
                # RPC-specific configuration for `list_vulnerability_reports`
                # @return [::Gapic::Config::Method]
                #
                attr_reader :list_vulnerability_reports

                # @private
                def initialize parent_rpcs = nil
                  get_inventory_config = parent_rpcs.get_inventory if parent_rpcs.respond_to? :get_inventory
                  @get_inventory = ::Gapic::Config::Method.new get_inventory_config
                  list_inventories_config = parent_rpcs.list_inventories if parent_rpcs.respond_to? :list_inventories
                  @list_inventories = ::Gapic::Config::Method.new list_inventories_config
                  get_vulnerability_report_config = parent_rpcs.get_vulnerability_report if parent_rpcs.respond_to? :get_vulnerability_report
                  @get_vulnerability_report = ::Gapic::Config::Method.new get_vulnerability_report_config
                  list_vulnerability_reports_config = parent_rpcs.list_vulnerability_reports if parent_rpcs.respond_to? :list_vulnerability_reports
                  @list_vulnerability_reports = ::Gapic::Config::Method.new list_vulnerability_reports_config

                  yield self if block_given?
                end
              end
            end
          end
        end
      end
    end
  end
end
