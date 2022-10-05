# frozen_string_literal: true

TAB = "\t"
NEWLINE = "\n"
# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    lines = tsv.split(NEWLINE)
    keys = parse_yaml_keys(lines[0])
    items = lines.slice(1, lines.length)
    @data = gen_items(keys, items)
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    content = gen_first_key_line
    content << gen_item_lines
  end

  private

  def parse_yaml_keys(first_line)
    first_line.split(TAB)
  end

  def gen_items(keys, items)
    items.map do |item|
      values = item.split(TAB)
      gen_item(keys, values)
    end
  end

  def gen_item(keys, values)
    hash = {}
    keys.each_with_index { |key, index| hash[key] = values[index] }
    hash
  end

  def gen_first_key_line
    content = @data[0].keys.join(TAB)
    content << NEWLINE
  end

  def gen_item_lines
    item_lines = @data.map do |item|
      item_line = item.values.join(TAB)
      item_line << NEWLINE
    end
    item_lines.join
  end
end
