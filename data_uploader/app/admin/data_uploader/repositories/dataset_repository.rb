module DataUploader
  module Repositories
    class DatasetRepository
      def filter_by_section(section_id)
        DataUploader::Dataset.where(section_id: section_id)
      end

      def filter_by_section_and_platform(section_name, platform_name)
        DataUploader::Dataset.joins(:section).
          where(sections: {name: section_name}).
          where(sections: {platform_id: DataUploader::Platform.find_by(name: platform_name).id})
      end

      def find(dataset_id)
        DataUploader::Dataset.find(dataset_id)
      end
    end
  end
end
