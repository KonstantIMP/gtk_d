module atk.TextT;

public  import atk.TextRange;
public  import atk.c.functions;
public  import atk.c.types;
public  import glib.Str;
public  import glib.c.functions;
public  import gobject.ObjectG;
public  import gobject.Signals;
public  import std.algorithm;


/**
 * #AtkText should be implemented by #AtkObjects on behalf of widgets
 * that have text content which is either attributed or otherwise
 * non-trivial.  #AtkObjects whose text content is simple,
 * unattributed, and very brief may expose that content via
 * #atk_object_get_name instead; however if the text is editable,
 * multi-line, typically longer than three or four words, attributed,
 * selectable, or if the object already uses the 'name' ATK property
 * for other information, the #AtkText interface should be used to
 * expose the text content.  In the case of editable text content,
 * #AtkEditableText (a subtype of the #AtkText interface) should be
 * implemented instead.
 * 
 * #AtkText provides not only traversal facilities and change
 * notification for text content, but also caret tracking and glyph
 * bounding box calculations.  Note that the text strings are exposed
 * as UTF-8, and are therefore potentially multi-byte, and
 * caret-to-byte offset mapping makes no assumptions about the
 * character length; also bounding box glyph-to-offset mapping may be
 * complex for languages which use ligatures.
 */
public template TextT(TStruct)
{
	/** Get the main Gtk struct */
	public AtkText* getTextStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return cast(AtkText*)getStruct();
	}


	/**
	 * Adds a selection bounded by the specified offsets.
	 *
	 * Params:
	 *     startOffset = the starting character offset of the selected region
	 *     endOffset = the offset of the first character after the selected region.
	 *
	 * Returns: %TRUE if successful, %FALSE otherwise
	 */
	public bool addSelection(int startOffset, int endOffset)
	{
		return atk_text_add_selection(getTextStruct(), startOffset, endOffset) != 0;
	}

	/**
	 * Get the ranges of text in the specified bounding box.
	 *
	 * Params:
	 *     rect = An AtkTextRectangle giving the dimensions of the bounding box.
	 *     coordType = Specify whether coordinates are relative to the screen or widget window.
	 *     xClipType = Specify the horizontal clip type.
	 *     yClipType = Specify the vertical clip type.
	 *
	 * Returns: Array of AtkTextRange. The last
	 *     element of the array returned by this function will be NULL.
	 *
	 * Since: 1.3
	 */
	public TextRange[] getBoundedRanges(AtkTextRectangle* rect, AtkCoordType coordType, AtkTextClipType xClipType, AtkTextClipType yClipType)
	{
		auto __p = atk_text_get_bounded_ranges(getTextStruct(), rect, coordType, xClipType, yClipType);

		if(__p is null)
		{
			return null;
		}

		TextRange[] arr = new TextRange[getArrayLength(__p)];
		for(int i = 0; i < getArrayLength(__p); i++)
		{
			arr[i] = ObjectG.getDObject!(TextRange)(cast(AtkTextRange*) __p[i]);
		}

		return arr;
	}

	/**
	 * Gets the offset of the position of the caret (cursor).
	 *
	 * Returns: the character offset of the position of the caret or -1 if
	 *     the caret is not located inside the element or in the case of
	 *     any other failure.
	 */
	public int getCaretOffset()
	{
		return atk_text_get_caret_offset(getTextStruct());
	}

	/**
	 * Gets the specified text.
	 *
	 * Params:
	 *     offset = a character offset within @text
	 *
	 * Returns: the character at @offset or 0 in the case of failure.
	 */
	public dchar getCharacterAtOffset(int offset)
	{
		return atk_text_get_character_at_offset(getTextStruct(), offset);
	}

	/**
	 * Gets the character count.
	 *
	 * Returns: the number of characters or -1 in case of failure.
	 */
	public int getCharacterCount()
	{
		return atk_text_get_character_count(getTextStruct());
	}

	/**
	 * If the extent can not be obtained (e.g. missing support), all of x, y, width,
	 * height are set to -1.
	 *
	 * Get the bounding box containing the glyph representing the character at
	 * a particular text offset.
	 *
	 * Params:
	 *     offset = The offset of the text character for which bounding information is required.
	 *     x = Pointer for the x coordinate of the bounding box
	 *     y = Pointer for the y coordinate of the bounding box
	 *     width = Pointer for the width of the bounding box
	 *     height = Pointer for the height of the bounding box
	 *     coords = specify whether coordinates are relative to the screen or widget window
	 */
	public void getCharacterExtents(int offset, out int x, out int y, out int width, out int height, AtkCoordType coords)
	{
		atk_text_get_character_extents(getTextStruct(), offset, &x, &y, &width, &height, coords);
	}

	/**
	 * Creates an #AtkAttributeSet which consists of the default values of
	 * attributes for the text. See the enum AtkTextAttribute for types of text
	 * attributes that can be returned. Note that other attributes may also be
	 * returned.
	 *
	 * Returns: an #AtkAttributeSet which contains the default text
	 *     attributes for this #AtkText. This #AtkAttributeSet should be freed by
	 *     a call to atk_attribute_set_free().
	 */
	public AtkAttributeSet* getDefaultAttributes()
	{
		return atk_text_get_default_attributes(getTextStruct());
	}

	/**
	 * Gets the number of selected regions.
	 *
	 * Returns: The number of selected regions, or -1 in the case of failure.
	 */
	public int getNSelections()
	{
		return atk_text_get_n_selections(getTextStruct());
	}

	/**
	 * Gets the offset of the character located at coordinates @x and @y. @x and @y
	 * are interpreted as being relative to the screen or this widget's window
	 * depending on @coords.
	 *
	 * Params:
	 *     x = screen x-position of character
	 *     y = screen y-position of character
	 *     coords = specify whether coordinates are relative to the screen or
	 *         widget window
	 *
	 * Returns: the offset to the character which is located at  the specified
	 *     @x and @y coordinates of -1 in case of failure.
	 */
	public int getOffsetAtPoint(int x, int y, AtkCoordType coords)
	{
		return atk_text_get_offset_at_point(getTextStruct(), x, y, coords);
	}

	/**
	 * Get the bounding box for text within the specified range.
	 *
	 * If the extents can not be obtained (e.g. or missing support), the rectangle
	 * fields are set to -1.
	 *
	 * Params:
	 *     startOffset = The offset of the first text character for which boundary
	 *         information is required.
	 *     endOffset = The offset of the text character after the last character
	 *         for which boundary information is required.
	 *     coordType = Specify whether coordinates are relative to the screen or widget window.
	 *     rect = A pointer to a AtkTextRectangle which is filled in by this function.
	 *
	 * Since: 1.3
	 */
	public void getRangeExtents(int startOffset, int endOffset, AtkCoordType coordType, out AtkTextRectangle rect)
	{
		atk_text_get_range_extents(getTextStruct(), startOffset, endOffset, coordType, &rect);
	}

	/**
	 * Creates an #AtkAttributeSet which consists of the attributes explicitly
	 * set at the position @offset in the text. @start_offset and @end_offset are
	 * set to the start and end of the range around @offset where the attributes are
	 * invariant. Note that @end_offset is the offset of the first character
	 * after the range.  See the enum AtkTextAttribute for types of text
	 * attributes that can be returned. Note that other attributes may also be
	 * returned.
	 *
	 * Params:
	 *     offset = the character offset at which to get the attributes, -1 means the offset of
	 *         the character to be inserted at the caret location.
	 *     startOffset = the address to put the start offset of the range
	 *     endOffset = the address to put the end offset of the range
	 *
	 * Returns: an #AtkAttributeSet which contains the attributes
	 *     explicitly set at @offset. This #AtkAttributeSet should be freed by
	 *     a call to atk_attribute_set_free().
	 */
	public AtkAttributeSet* getRunAttributes(int offset, out int startOffset, out int endOffset)
	{
		return atk_text_get_run_attributes(getTextStruct(), offset, &startOffset, &endOffset);
	}

	/**
	 * Gets the text from the specified selection.
	 *
	 * Params:
	 *     selectionNum = The selection number.  The selected regions are
	 *         assigned numbers that correspond to how far the region is from the
	 *         start of the text.  The selected region closest to the beginning
	 *         of the text region is assigned the number 0, etc.  Note that adding,
	 *         moving or deleting a selected region can change the numbering.
	 *     startOffset = passes back the starting character offset of the selected region
	 *     endOffset = passes back the ending character offset (offset immediately past)
	 *         of the selected region
	 *
	 * Returns: a newly allocated string containing the selected text. Use g_free()
	 *     to free the returned string.
	 */
	public string getSelection(int selectionNum, out int startOffset, out int endOffset)
	{
		auto retStr = atk_text_get_selection(getTextStruct(), selectionNum, &startOffset, &endOffset);

		scope(exit) Str.freeString(retStr);
		return Str.toString(retStr);
	}

	/**
	 * Gets a portion of the text exposed through an #AtkText according to a given @offset
	 * and a specific @granularity, along with the start and end offsets defining the
	 * boundaries of such a portion of text.
	 *
	 * If @granularity is ATK_TEXT_GRANULARITY_CHAR the character at the
	 * offset is returned.
	 *
	 * If @granularity is ATK_TEXT_GRANULARITY_WORD the returned string
	 * is from the word start at or before the offset to the word start after
	 * the offset.
	 *
	 * The returned string will contain the word at the offset if the offset
	 * is inside a word and will contain the word before the offset if the
	 * offset is not inside a word.
	 *
	 * If @granularity is ATK_TEXT_GRANULARITY_SENTENCE the returned string
	 * is from the sentence start at or before the offset to the sentence
	 * start after the offset.
	 *
	 * The returned string will contain the sentence at the offset if the offset
	 * is inside a sentence and will contain the sentence before the offset
	 * if the offset is not inside a sentence.
	 *
	 * If @granularity is ATK_TEXT_GRANULARITY_LINE the returned string
	 * is from the line start at or before the offset to the line
	 * start after the offset.
	 *
	 * If @granularity is ATK_TEXT_GRANULARITY_PARAGRAPH the returned string
	 * is from the start of the paragraph at or before the offset to the start
	 * of the following paragraph after the offset.
	 *
	 * Params:
	 *     offset = position
	 *     granularity = An #AtkTextGranularity
	 *     startOffset = the starting character offset of the returned string, or -1
	 *         in the case of error (e.g. invalid offset, not implemented)
	 *     endOffset = the offset of the first character after the returned string,
	 *         or -1 in the case of error (e.g. invalid offset, not implemented)
	 *
	 * Returns: a newly allocated string containing the text at
	 *     the @offset bounded by the specified @granularity. Use g_free()
	 *     to free the returned string.  Returns %NULL if the offset is invalid
	 *     or no implementation is available.
	 *
	 * Since: 2.10
	 */
	public string getStringAtOffset(int offset, AtkTextGranularity granularity, out int startOffset, out int endOffset)
	{
		auto retStr = atk_text_get_string_at_offset(getTextStruct(), offset, granularity, &startOffset, &endOffset);

		scope(exit) Str.freeString(retStr);
		return Str.toString(retStr);
	}

	/**
	 * Gets the specified text.
	 *
	 * Params:
	 *     startOffset = a starting character offset within @text
	 *     endOffset = an ending character offset within @text, or -1 for the end of the string.
	 *
	 * Returns: a newly allocated string containing the text from @start_offset up
	 *     to, but not including @end_offset. Use g_free() to free the returned
	 *     string.
	 */
	public string getText(int startOffset, int endOffset)
	{
		auto retStr = atk_text_get_text(getTextStruct(), startOffset, endOffset);

		scope(exit) Str.freeString(retStr);
		return Str.toString(retStr);
	}

	/**
	 * Gets the specified text.
	 *
	 * Deprecated: Please use atk_text_get_string_at_offset() instead.
	 *
	 * Params:
	 *     offset = position
	 *     boundaryType = An #AtkTextBoundary
	 *     startOffset = the starting character offset of the returned string
	 *     endOffset = the offset of the first character after the
	 *         returned substring
	 *
	 * Returns: a newly allocated string containing the text after @offset bounded
	 *     by the specified @boundary_type. Use g_free() to free the returned
	 *     string.
	 */
	public string getTextAfterOffset(int offset, AtkTextBoundary boundaryType, out int startOffset, out int endOffset)
	{
		auto retStr = atk_text_get_text_after_offset(getTextStruct(), offset, boundaryType, &startOffset, &endOffset);

		scope(exit) Str.freeString(retStr);
		return Str.toString(retStr);
	}

	/**
	 * Gets the specified text.
	 *
	 * If the boundary_type if ATK_TEXT_BOUNDARY_CHAR the character at the
	 * offset is returned.
	 *
	 * If the boundary_type is ATK_TEXT_BOUNDARY_WORD_START the returned string
	 * is from the word start at or before the offset to the word start after
	 * the offset.
	 *
	 * The returned string will contain the word at the offset if the offset
	 * is inside a word and will contain the word before the offset if the
	 * offset is not inside a word.
	 *
	 * If the boundary type is ATK_TEXT_BOUNDARY_SENTENCE_START the returned
	 * string is from the sentence start at or before the offset to the sentence
	 * start after the offset.
	 *
	 * The returned string will contain the sentence at the offset if the offset
	 * is inside a sentence and will contain the sentence before the offset
	 * if the offset is not inside a sentence.
	 *
	 * If the boundary type is ATK_TEXT_BOUNDARY_LINE_START the returned
	 * string is from the line start at or before the offset to the line
	 * start after the offset.
	 *
	 * Deprecated: This method is deprecated since ATK version
	 * 2.9.4. Please use atk_text_get_string_at_offset() instead.
	 *
	 * Params:
	 *     offset = position
	 *     boundaryType = An #AtkTextBoundary
	 *     startOffset = the starting character offset of the returned string
	 *     endOffset = the offset of the first character after the
	 *         returned substring
	 *
	 * Returns: a newly allocated string containing the text at @offset bounded
	 *     by the specified @boundary_type. Use g_free() to free the returned
	 *     string.
	 */
	public string getTextAtOffset(int offset, AtkTextBoundary boundaryType, out int startOffset, out int endOffset)
	{
		auto retStr = atk_text_get_text_at_offset(getTextStruct(), offset, boundaryType, &startOffset, &endOffset);

		scope(exit) Str.freeString(retStr);
		return Str.toString(retStr);
	}

	/**
	 * Gets the specified text.
	 *
	 * Deprecated: Please use atk_text_get_string_at_offset() instead.
	 *
	 * Params:
	 *     offset = position
	 *     boundaryType = An #AtkTextBoundary
	 *     startOffset = the starting character offset of the returned string
	 *     endOffset = the offset of the first character after the
	 *         returned substring
	 *
	 * Returns: a newly allocated string containing the text before @offset bounded
	 *     by the specified @boundary_type. Use g_free() to free the returned
	 *     string.
	 */
	public string getTextBeforeOffset(int offset, AtkTextBoundary boundaryType, out int startOffset, out int endOffset)
	{
		auto retStr = atk_text_get_text_before_offset(getTextStruct(), offset, boundaryType, &startOffset, &endOffset);

		scope(exit) Str.freeString(retStr);
		return Str.toString(retStr);
	}

	/**
	 * Removes the specified selection.
	 *
	 * Params:
	 *     selectionNum = The selection number.  The selected regions are
	 *         assigned numbers that correspond to how far the region is from the
	 *         start of the text.  The selected region closest to the beginning
	 *         of the text region is assigned the number 0, etc.  Note that adding,
	 *         moving or deleting a selected region can change the numbering.
	 *
	 * Returns: %TRUE if successful, %FALSE otherwise
	 */
	public bool removeSelection(int selectionNum)
	{
		return atk_text_remove_selection(getTextStruct(), selectionNum) != 0;
	}

	/**
	 * Makes a substring of @text visible on the screen by scrolling all necessary parents.
	 *
	 * Params:
	 *     startOffset = start offset in the @text
	 *     endOffset = end offset in the @text, or -1 for the end of the text.
	 *     type = specify where the object should be made visible.
	 *
	 * Returns: whether scrolling was successful.
	 *
	 * Since: 2.32
	 */
	public bool scrollSubstringTo(int startOffset, int endOffset, AtkScrollType type)
	{
		return atk_text_scroll_substring_to(getTextStruct(), startOffset, endOffset, type) != 0;
	}

	/**
	 * Move the top-left of a substring of @text to a given position of the screen
	 * by scrolling all necessary parents.
	 *
	 * Params:
	 *     startOffset = start offset in the @text
	 *     endOffset = end offset in the @text, or -1 for the end of the text.
	 *     coords = specify whether coordinates are relative to the screen or to the
	 *         parent object.
	 *     x = x-position where to scroll to
	 *     y = y-position where to scroll to
	 *
	 * Returns: whether scrolling was successful.
	 *
	 * Since: 2.32
	 */
	public bool scrollSubstringToPoint(int startOffset, int endOffset, AtkCoordType coords, int x, int y)
	{
		return atk_text_scroll_substring_to_point(getTextStruct(), startOffset, endOffset, coords, x, y) != 0;
	}

	/**
	 * Sets the caret (cursor) position to the specified @offset.
	 *
	 * In the case of rich-text content, this method should either grab focus
	 * or move the sequential focus navigation starting point (if the application
	 * supports this concept) as if the user had clicked on the new caret position.
	 * Typically, this means that the target of this operation is the node containing
	 * the new caret position or one of its ancestors. In other words, after this
	 * method is called, if the user advances focus, it should move to the first
	 * focusable node following the new caret position.
	 *
	 * Calling this method should also scroll the application viewport in a way
	 * that matches the behavior of the application's typical caret motion or tab
	 * navigation as closely as possible. This also means that if the application's
	 * caret motion or focus navigation does not trigger a scroll operation, this
	 * method should not trigger one either. If the application does not have a caret
	 * motion or focus navigation operation, this method should try to scroll the new
	 * caret position into view while minimizing unnecessary scroll motion.
	 *
	 * Params:
	 *     offset = the character offset of the new caret position
	 *
	 * Returns: %TRUE if successful, %FALSE otherwise.
	 */
	public bool setCaretOffset(int offset)
	{
		return atk_text_set_caret_offset(getTextStruct(), offset) != 0;
	}

	/**
	 * Changes the start and end offset of the specified selection.
	 *
	 * Params:
	 *     selectionNum = The selection number.  The selected regions are
	 *         assigned numbers that correspond to how far the region is from the
	 *         start of the text.  The selected region closest to the beginning
	 *         of the text region is assigned the number 0, etc.  Note that adding,
	 *         moving or deleting a selected region can change the numbering.
	 *     startOffset = the new starting character offset of the selection
	 *     endOffset = the new end position of (e.g. offset immediately past)
	 *         the selection
	 *
	 * Returns: %TRUE if successful, %FALSE otherwise
	 */
	public bool setSelection(int selectionNum, int startOffset, int endOffset)
	{
		return atk_text_set_selection(getTextStruct(), selectionNum, startOffset, endOffset) != 0;
	}

	/**
	 * The "text-attributes-changed" signal is emitted when the text
	 * attributes of the text of an object which implements AtkText
	 * changes.
	 */
	gulong addOnTextAttributesChanged(void delegate(TextIF) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "text-attributes-changed", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * The "text-caret-moved" signal is emitted when the caret
	 * position of the text of an object which implements AtkText
	 * changes.
	 *
	 * Params:
	 *     arg1 = The new position of the text caret.
	 */
	gulong addOnTextCaretMoved(void delegate(int, TextIF) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "text-caret-moved", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * The "text-changed" signal is emitted when the text of the
	 * object which implements the AtkText interface changes, This
	 * signal will have a detail which is either "insert" or
	 * "delete" which identifies whether the text change was an
	 * insertion or a deletion.
	 *
	 * Deprecated: Use #AtkObject::text-insert or
	 * #AtkObject::text-remove instead.
	 *
	 * Params:
	 *     arg1 = The position (character offset) of the insertion or deletion.
	 *     arg2 = The length (in characters) of text inserted or deleted.
	 */
	gulong addOnTextChanged(void delegate(int, int, TextIF) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "text-changed", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * The "text-insert" signal is emitted when a new text is
	 * inserted. If the signal was not triggered by the user
	 * (e.g. typing or pasting text), the "system" detail should be
	 * included.
	 *
	 * Params:
	 *     arg1 = The position (character offset) of the insertion.
	 *     arg2 = The length (in characters) of text inserted.
	 *     arg3 = The new text inserted
	 */
	gulong addOnTextInsert(void delegate(int, int, string, TextIF) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "text-insert", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * The "text-remove" signal is emitted when a new text is
	 * removed. If the signal was not triggered by the user
	 * (e.g. typing or pasting text), the "system" detail should be
	 * included.
	 *
	 * Params:
	 *     arg1 = The position (character offset) of the removal.
	 *     arg2 = The length (in characters) of text removed.
	 *     arg3 = The old text removed
	 */
	gulong addOnTextRemove(void delegate(int, int, string, TextIF) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "text-remove", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * The "text-selection-changed" signal is emitted when the
	 * selected text of an object which implements AtkText changes.
	 */
	gulong addOnTextSelectionChanged(void delegate(TextIF) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "text-selection-changed", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}
}