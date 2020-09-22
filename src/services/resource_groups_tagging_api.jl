# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: resource_groups_tagging_api
using AWS.Compat
using AWS.UUIDs
"""
    DescribeReportCreation()

Describes the status of the StartReportCreation operation.  You can call this operation only from the organization's master account and from the us-east-1 Region.

"""

describe_report_creation(; aws_config::AWSConfig=global_aws_config()) = resource_groups_tagging_api("DescribeReportCreation"; aws_config=aws_config)
describe_report_creation(args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = resource_groups_tagging_api("DescribeReportCreation", args; aws_config=aws_config)

"""
    GetComplianceSummary()

Returns a table that shows counts of resources that are noncompliant with their tag policies. For more information on tag policies, see Tag Policies in the AWS Organizations User Guide.  You can call this operation only from the organization's master account and from the us-east-1 Region.

# Optional Parameters
- `GroupBy`: A list of attributes to group the counts of noncompliant resources by. If supplied, the counts are sorted by those attributes.
- `MaxResults`: A limit that restricts the number of results that are returned per page.
- `PaginationToken`: A string that indicates that additional data is available. Leave this value empty for your initial request. If the response includes a PaginationToken, use that string for this value to request an additional page of data.
- `RegionFilters`: A list of Regions to limit the output by. If you use this parameter, the count of returned noncompliant resources includes only resources in the specified Regions.
- `ResourceTypeFilters`: The constraints on the resources that you want returned. The format of each resource type is service[:resourceType]. For example, specifying a resource type of ec2 returns all Amazon EC2 resources (which includes EC2 instances). Specifying a resource type of ec2:instance returns only EC2 instances.  The string for each service name and resource type is the same as that embedded in a resource's Amazon Resource Name (ARN). Consult the AWS General Reference for the following:   For a list of service name strings, see AWS Service Namespaces.   For resource type strings, see Example ARNs.   For more information about ARNs, see Amazon Resource Names (ARNs) and AWS Service Namespaces.   You can specify multiple resource types by using an array. The array can include up to 100 items. Note that the length constraint requirement applies to each resource type filter. 
- `TagKeyFilters`: A list of tag keys to limit the output by. If you use this parameter, the count of returned noncompliant resources includes only resources that have the specified tag keys.
- `TargetIdFilters`: The target identifiers (usually, specific account IDs) to limit the output by. If you use this parameter, the count of returned noncompliant resources includes only resources with the specified target IDs.
"""

get_compliance_summary(; aws_config::AWSConfig=global_aws_config()) = resource_groups_tagging_api("GetComplianceSummary"; aws_config=aws_config)
get_compliance_summary(args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = resource_groups_tagging_api("GetComplianceSummary", args; aws_config=aws_config)

"""
    GetResources()

Returns all the tagged or previously tagged resources that are located in the specified Region for the AWS account. Depending on what information you want returned, you can also specify the following:    Filters that specify what tags and resource types you want returned. The response includes all tags that are associated with the requested resources.   Information about compliance with the account's effective tag policy. For more information on tag policies, see Tag Policies in the AWS Organizations User Guide.     You can check the PaginationToken response parameter to determine if a query is complete. Queries occasionally return fewer results on a page than allowed. The PaginationToken response parameter value is null only when there are no more results to display.  

# Optional Parameters
- `ExcludeCompliantResources`: Specifies whether to exclude resources that are compliant with the tag policy. Set this to true if you are interested in retrieving information on noncompliant resources only. You can use this parameter only if the IncludeComplianceDetails parameter is also set to true.
- `IncludeComplianceDetails`: Specifies whether to include details regarding the compliance with the effective tag policy. Set this to true to determine whether resources are compliant with the tag policy and to get details.
- `PaginationToken`: A string that indicates that additional data is available. Leave this value empty for your initial request. If the response includes a PaginationToken, use that string for this value to request an additional page of data.
- `ResourceTypeFilters`: The constraints on the resources that you want returned. The format of each resource type is service[:resourceType]. For example, specifying a resource type of ec2 returns all Amazon EC2 resources (which includes EC2 instances). Specifying a resource type of ec2:instance returns only EC2 instances.  The string for each service name and resource type is the same as that embedded in a resource's Amazon Resource Name (ARN). Consult the AWS General Reference for the following:   For a list of service name strings, see AWS Service Namespaces.   For resource type strings, see Example ARNs.   For more information about ARNs, see Amazon Resource Names (ARNs) and AWS Service Namespaces.   You can specify multiple resource types by using an array. The array can include up to 100 items. Note that the length constraint requirement applies to each resource type filter. 
- `ResourcesPerPage`: A limit that restricts the number of resources returned by GetResources in paginated output. You can set ResourcesPerPage to a minimum of 1 item and the maximum of 100 items. 
- `TagFilters`: A list of TagFilters (keys and values). Each TagFilter specified must contain a key with values as optional. A request can include up to 50 keys, and each key can include up to 20 values.  Note the following when deciding how to use TagFilters:   If you do specify a TagFilter, the response returns only those resources that are currently associated with the specified tag.    If you don't specify a TagFilter, the response includes all resources that were ever associated with tags. Resources that currently don't have associated tags are shown with an empty tag set, like this: \"Tags\": [].   If you specify more than one filter in a single request, the response returns only those resources that satisfy all specified filters.   If you specify a filter that contains more than one value for a key, the response returns resources that match any of the specified values for that key.   If you don't specify any values for a key, the response returns resources that are tagged with that key irrespective of the value. For example, for filters: filter1 = {key1, {value1}}, filter2 = {key2, {value2,value3,value4}} , filter3 = {key3}:   GetResources( {filter1} ) returns resources tagged with key1=value1   GetResources( {filter2} ) returns resources tagged with key2=value2 or key2=value3 or key2=value4   GetResources( {filter3} ) returns resources tagged with any tag containing key3 as its tag key, irrespective of its value   GetResources( {filter1,filter2,filter3} ) returns resources tagged with ( key1=value1) and ( key2=value2 or key2=value3 or key2=value4) and (key3, irrespective of the value)    
- `TagsPerPage`: AWS recommends using ResourcesPerPage instead of this parameter. A limit that restricts the number of tags (key and value pairs) returned by GetResources in paginated output. A resource with no tags is counted as having one tag (one key and value pair).  GetResources does not split a resource and its associated tags across pages. If the specified TagsPerPage would cause such a break, a PaginationToken is returned in place of the affected resource and its tags. Use that token in another request to get the remaining data. For example, if you specify a TagsPerPage of 100 and the account has 22 resources with 10 tags each (meaning that each resource has 10 key and value pairs), the output will consist of three pages. The first page displays the first 10 resources, each with its 10 tags. The second page displays the next 10 resources, each with its 10 tags. The third page displays the remaining 2 resources, each with its 10 tags. You can set TagsPerPage to a minimum of 100 items and the maximum of 500 items.
"""

get_resources(; aws_config::AWSConfig=global_aws_config()) = resource_groups_tagging_api("GetResources"; aws_config=aws_config)
get_resources(args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = resource_groups_tagging_api("GetResources", args; aws_config=aws_config)

"""
    GetTagKeys()

Returns all tag keys in the specified Region for the AWS account.

# Optional Parameters
- `PaginationToken`: A string that indicates that additional data is available. Leave this value empty for your initial request. If the response includes a PaginationToken, use that string for this value to request an additional page of data.
"""

get_tag_keys(; aws_config::AWSConfig=global_aws_config()) = resource_groups_tagging_api("GetTagKeys"; aws_config=aws_config)
get_tag_keys(args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = resource_groups_tagging_api("GetTagKeys", args; aws_config=aws_config)

"""
    GetTagValues()

Returns all tag values for the specified key in the specified Region for the AWS account.

# Required Parameters
- `Key`: The key for which you want to list all existing values in the specified Region for the AWS account.

# Optional Parameters
- `PaginationToken`: A string that indicates that additional data is available. Leave this value empty for your initial request. If the response includes a PaginationToken, use that string for this value to request an additional page of data.
"""

get_tag_values(Key; aws_config::AWSConfig=global_aws_config()) = resource_groups_tagging_api("GetTagValues", Dict{String, Any}("Key"=>Key); aws_config=aws_config)
get_tag_values(Key, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = resource_groups_tagging_api("GetTagValues", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("Key"=>Key), args)); aws_config=aws_config)

"""
    StartReportCreation()

Generates a report that lists all tagged resources in accounts across your organization and tells whether each resource is compliant with the effective tag policy. Compliance data is refreshed daily.  The generated report is saved to the following location:  s3://example-bucket/AwsTagPolicies/o-exampleorgid/YYYY-MM-ddTHH:mm:ssZ/report.csv  You can call this operation only from the organization's master account and from the us-east-1 Region.

# Required Parameters
- `S3Bucket`: The name of the Amazon S3 bucket where the report will be stored; for example:  awsexamplebucket  For more information on S3 bucket requirements, including an example bucket policy, see the example S3 bucket policy on this page.

"""

start_report_creation(S3Bucket; aws_config::AWSConfig=global_aws_config()) = resource_groups_tagging_api("StartReportCreation", Dict{String, Any}("S3Bucket"=>S3Bucket); aws_config=aws_config)
start_report_creation(S3Bucket, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = resource_groups_tagging_api("StartReportCreation", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("S3Bucket"=>S3Bucket), args)); aws_config=aws_config)

"""
    TagResources()

Applies one or more tags to the specified resources. Note the following:   Not all resources can have tags. For a list of services that support tagging, see this list.   Each resource can have up to 50 tags. For other limits, see Tag Naming and Usage Conventions in the AWS General Reference.    You can only tag resources that are located in the specified Region for the AWS account.   To add tags to a resource, you need the necessary permissions for the service that the resource belongs to as well as permissions for adding tags. For more information, see this list.    Do not store personally identifiable information (PII) or other confidential or sensitive information in tags. We use tags to provide you with billing and administration services. Tags are not intended to be used for private or sensitive data. 

# Required Parameters
- `ResourceARNList`: A list of ARNs. An ARN (Amazon Resource Name) uniquely identifies a resource. For more information, see Amazon Resource Names (ARNs) and AWS Service Namespaces in the AWS General Reference.
- `Tags`: The tags that you want to add to the specified resources. A tag consists of a key and a value that you define.

"""

tag_resources(ResourceARNList, Tags; aws_config::AWSConfig=global_aws_config()) = resource_groups_tagging_api("TagResources", Dict{String, Any}("ResourceARNList"=>ResourceARNList, "Tags"=>Tags); aws_config=aws_config)
tag_resources(ResourceARNList, Tags, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = resource_groups_tagging_api("TagResources", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ResourceARNList"=>ResourceARNList, "Tags"=>Tags), args)); aws_config=aws_config)

"""
    UntagResources()

Removes the specified tags from the specified resources. When you specify a tag key, the action removes both that key and its associated value. The operation succeeds even if you attempt to remove tags from a resource that were already removed. Note the following:   To remove tags from a resource, you need the necessary permissions for the service that the resource belongs to as well as permissions for removing tags. For more information, see this list.   You can only tag resources that are located in the specified Region for the AWS account.  

# Required Parameters
- `ResourceARNList`: A list of ARNs. An ARN (Amazon Resource Name) uniquely identifies a resource. For more information, see Amazon Resource Names (ARNs) and AWS Service Namespaces in the AWS General Reference.
- `TagKeys`: A list of the tag keys that you want to remove from the specified resources.

"""

untag_resources(ResourceARNList, TagKeys; aws_config::AWSConfig=global_aws_config()) = resource_groups_tagging_api("UntagResources", Dict{String, Any}("ResourceARNList"=>ResourceARNList, "TagKeys"=>TagKeys); aws_config=aws_config)
untag_resources(ResourceARNList, TagKeys, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = resource_groups_tagging_api("UntagResources", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ResourceARNList"=>ResourceARNList, "TagKeys"=>TagKeys), args)); aws_config=aws_config)
