"""
PyTorch Dataset class for loading the Google Math dataset
"""

import torch.utils.data
import os

# Make sure that the mathematics dataset is extracted into this folder
DATASET_FOLDER = 'mathematics_dataset'


class MathDataset(torch.utils.data.Dataset):
    """
    Represents a particular sub-dataset within the overall Google Math
    Dataset
    """

    @staticmethod
    def root():
        """
        :return: root directory of the dataset
        """
        return os.path.join(DATASET_FOLDER, 'mathematics_dataset-v1.0')

    @staticmethod
    def data_types():
        """
        :return: data types in the dataset (train-easy, train-hard,
        eval, etc.)
        """
        return tuple(
            d for d in os.listdir(MathDataset.root())
            if os.path.isdir(os.path.join(MathDataset.root(), d))
        )

    @staticmethod
    def categories():
        """
        :return: dictionary of data type -> list of categories for each
        data type in the dataset
        """
        categories = {}
        for data_type in MathDataset.data_types():
            data_type_cats = []
            dtype_folder = os.path.join(MathDataset.root(), data_type)
            for file_name in os.listdir(dtype_folder):
                data_type_cats.append(file_name[:file_name.find('__')])
            categories[data_type] = tuple(data_type_cats)

        return categories

    @staticmethod
    def subcategories():
        """
        :return: dictionary of data type -> category -> list of subcategories
        for each category in each data type of the dataset
        """
        subcategories = {}
        for data_type in MathDataset.data_types():
            data_type_subcats = {}
            dtype_folder = os.path.join(MathDataset.root(), data_type)
            for file_name in os.listdir(dtype_folder):
                i_du = file_name.find('__')
                cat, subcat = file_name[:i_du], file_name[i_du + 2: -4]

                if cat not in data_type_subcats:
                    data_type_subcats[cat] = []
                data_type_subcats[cat].append(subcat)

            subcategories[data_type] = data_type_subcats

        return subcategories

    def __init__(self, data_type, category, subcategory):
        """
        Load and initialize the subcategory dataset within the given category
        and data type
        :param data_type: the data type to load from. Must be one of
        MathDataset.data_types()
        :param category: the category to load from. Must be one of
        MathDataset.categories()[data_type]
        :param subcategory: the subcategory dataset to load. Must be one of
        MathDataset.subcategories()[data_type][category]
        """
        self.data_type = data_type
        self.category = category
        self.subcategory = subcategory

        with open(self.path, 'r') as f:
            lines = f.read().splitlines()

        self.questions = lines[::2]
        self.answers = lines[1::2]

    @property
    def path(self):
        """
        :return: Path to the subcategory folder
        """
        folder = os.path.join(MathDataset.root(), self.data_type)
        file_name = f'{self.category}__{self.subcategory}.txt'
        return os.path.join(folder, file_name)

    def __getitem__(self, index):
        """
        :param index: index of question-answer pair in range(len(self))
        :return: The question answer pair in the dataset at the given index
        """
        return self.questions[index], self.answers[index]

    def __len__(self):
        """
        :return: How many question-answer pairs are in the dataset
        """
        return len(self.questions)
