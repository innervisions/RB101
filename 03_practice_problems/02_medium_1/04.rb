def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

# rolling_buffer_1 is an implementation that mutates the buffer
# being sent to it. rolling_buffer_2 creates a new buffer on line 8
# and this is the buffer being shifted on line 9. In order to use
# this method the caller would have to assign the return value to a
# variable because the original buffer object would remain unchanged.
