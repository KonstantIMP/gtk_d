module sourceview.Buffer;

private import glib.ConstructionException;
private import glib.ListSG;
private import glib.Str;
private import glib.c.functions;
private import gobject.ObjectG;
private import gobject.Signals;
private import gtk.TextBuffer;
private import gtk.TextIter;
private import gtk.TextMark;
private import gtk.TextTag;
private import gtk.TextTagTable;
private import sourceview.Language;
private import sourceview.Mark;
private import sourceview.StyleScheme;
private import sourceview.c.functions;
public  import sourceview.c.types;
private import std.algorithm;


/** */
public class Buffer : TextBuffer
{
	/** the main Gtk struct */
	protected GtkSourceBuffer* gtkSourceBuffer;

	/** Get the main Gtk struct */
	public GtkSourceBuffer* getBufferStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkSourceBuffer;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkSourceBuffer;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkSourceBuffer* gtkSourceBuffer, bool ownedRef = false)
	{
		this.gtkSourceBuffer = gtkSourceBuffer;
		super(cast(GtkTextBuffer*)gtkSourceBuffer, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_source_buffer_get_type();
	}

	/**
	 * Creates a new source buffer.
	 *
	 * Params:
	 *     table = a #GtkTextTagTable, or %NULL to create a new one.
	 *
	 * Returns: a new source buffer.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(TextTagTable table)
	{
		auto __p = gtk_source_buffer_new((table is null) ? null : table.getTextTagTableStruct());

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GtkSourceBuffer*) __p, true);
	}

	/**
	 * Creates a new source buffer using the highlighting patterns in
	 * @language.  This is equivalent to creating a new source buffer with
	 * a new tag table and then calling gtk_source_buffer_set_language().
	 *
	 * Params:
	 *     language = a #GtkSourceLanguage.
	 *
	 * Returns: a new source buffer which will highlight text
	 *     according to the highlighting patterns in @language.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(Language language)
	{
		auto __p = gtk_source_buffer_new_with_language((language is null) ? null : language.getLanguageStruct());

		if(__p is null)
		{
			throw new ConstructionException("null returned by new_with_language");
		}

		this(cast(GtkSourceBuffer*) __p, true);
	}

	/**
	 * Moves @iter to the position of the previous #GtkSourceMark of the given
	 * category. Returns %TRUE if @iter was moved. If @category is NULL, the
	 * previous source mark can be of any category.
	 *
	 * Params:
	 *     iter = an iterator.
	 *     category = category to search for, or %NULL
	 *
	 * Returns: whether @iter was moved.
	 *
	 * Since: 2.2
	 */
	public bool backwardIterToSourceMark(ref TextIter iter, string category)
	{
		return gtk_source_buffer_backward_iter_to_source_mark(gtkSourceBuffer, (iter is null) ? null : iter.getTextIterStruct(true), Str.toStringz(category)) != 0;
	}

	/**
	 * Changes the case of the text between the specified iterators.
	 *
	 * Params:
	 *     caseType = how to change the case.
	 *     start = a #GtkTextIter.
	 *     end = a #GtkTextIter.
	 *
	 * Since: 3.12
	 */
	public void changeCase(GtkSourceChangeCaseType caseType, TextIter start, TextIter end)
	{
		gtk_source_buffer_change_case(gtkSourceBuffer, caseType, (start is null) ? null : start.getTextIterStruct(), (end is null) ? null : end.getTextIterStruct());
	}

	/**
	 * Creates a source mark in the @buffer of category @category.  A source mark is
	 * a #GtkTextMark but organised into categories. Depending on the category
	 * a pixbuf can be specified that will be displayed along the line of the mark.
	 *
	 * Like a #GtkTextMark, a #GtkSourceMark can be anonymous if the
	 * passed @name is %NULL.  Also, the buffer owns the marks so you
	 * shouldn't unreference it.
	 *
	 * Marks always have left gravity and are moved to the beginning of
	 * the line when the user deletes the line they were in.
	 *
	 * Typical uses for a source mark are bookmarks, breakpoints, current
	 * executing instruction indication in a source file, etc..
	 *
	 * Params:
	 *     name = the name of the mark, or %NULL.
	 *     category = a string defining the mark category.
	 *     where = location to place the mark.
	 *
	 * Returns: a new #GtkSourceMark, owned by the buffer.
	 *
	 * Since: 2.2
	 */
	public Mark createSourceMark(string name, string category, TextIter where)
	{
		auto __p = gtk_source_buffer_create_source_mark(gtkSourceBuffer, Str.toStringz(name), Str.toStringz(category), (where is null) ? null : where.getTextIterStruct());

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Mark)(cast(GtkSourceMark*) __p);
	}

	/**
	 * Forces buffer to analyze and highlight the given area synchronously.
	 *
	 * <note>
	 * <para>
	 * This is a potentially slow operation and should be used only
	 * when you need to make sure that some text not currently
	 * visible is highlighted, for instance before printing.
	 * </para>
	 * </note>
	 *
	 * Params:
	 *     start = start of the area to highlight.
	 *     end = end of the area to highlight.
	 */
	public void ensureHighlight(TextIter start, TextIter end)
	{
		gtk_source_buffer_ensure_highlight(gtkSourceBuffer, (start is null) ? null : start.getTextIterStruct(), (end is null) ? null : end.getTextIterStruct());
	}

	/**
	 * Moves @iter to the position of the next #GtkSourceMark of the given
	 * @category. Returns %TRUE if @iter was moved. If @category is NULL, the
	 * next source mark can be of any category.
	 *
	 * Params:
	 *     iter = an iterator.
	 *     category = category to search for, or %NULL
	 *
	 * Returns: whether @iter was moved.
	 *
	 * Since: 2.2
	 */
	public bool forwardIterToSourceMark(ref TextIter iter, string category)
	{
		return gtk_source_buffer_forward_iter_to_source_mark(gtkSourceBuffer, (iter is null) ? null : iter.getTextIterStruct(true), Str.toStringz(category)) != 0;
	}

	/**
	 * Get all defined context classes at @iter.
	 *
	 * See the #GtkSourceBuffer description for the list of default context classes.
	 *
	 * Params:
	 *     iter = a #GtkTextIter.
	 *
	 * Returns: a new %NULL
	 *     terminated array of context class names.
	 *     Use g_strfreev() to free the array if it is no longer needed.
	 *
	 * Since: 2.10
	 */
	public string[] getContextClassesAtIter(TextIter iter)
	{
		auto retStr = gtk_source_buffer_get_context_classes_at_iter(gtkSourceBuffer, (iter is null) ? null : iter.getTextIterStruct());

		scope(exit) Str.freeStringArray(retStr);
		return Str.toStringArray(retStr);
	}

	/**
	 * Determines whether bracket match highlighting is activated for the
	 * source buffer.
	 *
	 * Returns: %TRUE if the source buffer will highlight matching
	 *     brackets.
	 */
	public bool getHighlightMatchingBrackets()
	{
		return gtk_source_buffer_get_highlight_matching_brackets(gtkSourceBuffer) != 0;
	}

	/**
	 * Determines whether syntax highlighting is activated in the source
	 * buffer.
	 *
	 * Returns: %TRUE if syntax highlighting is enabled, %FALSE otherwise.
	 */
	public bool getHighlightSyntax()
	{
		return gtk_source_buffer_get_highlight_syntax(gtkSourceBuffer) != 0;
	}

	/**
	 * Returns: whether the @buffer has an implicit trailing newline.
	 *
	 * Since: 3.14
	 */
	public bool getImplicitTrailingNewline()
	{
		return gtk_source_buffer_get_implicit_trailing_newline(gtkSourceBuffer) != 0;
	}

	/**
	 * Returns the #GtkSourceLanguage associated with the buffer,
	 * see gtk_source_buffer_set_language().  The returned object should not be
	 * unreferenced by the user.
	 *
	 * Returns: the #GtkSourceLanguage associated
	 *     with the buffer, or %NULL.
	 */
	public Language getLanguage()
	{
		auto __p = gtk_source_buffer_get_language(gtkSourceBuffer);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Language)(cast(GtkSourceLanguage*) __p);
	}

	/**
	 * Returns the list of marks of the given category at @iter. If @category
	 * is %NULL it returns all marks at @iter.
	 *
	 * Params:
	 *     iter = an iterator.
	 *     category = category to search for, or %NULL
	 *
	 * Returns: a newly allocated #GSList.
	 *
	 * Since: 2.2
	 */
	public ListSG getSourceMarksAtIter(TextIter iter, string category)
	{
		auto __p = gtk_source_buffer_get_source_marks_at_iter(gtkSourceBuffer, (iter is null) ? null : iter.getTextIterStruct(), Str.toStringz(category));

		if(__p is null)
		{
			return null;
		}

		return new ListSG(cast(GSList*) __p);
	}

	/**
	 * Returns the list of marks of the given category at @line.
	 * If @category is %NULL, all marks at @line are returned.
	 *
	 * Params:
	 *     line = a line number.
	 *     category = category to search for, or %NULL
	 *
	 * Returns: a newly allocated #GSList.
	 *
	 * Since: 2.2
	 */
	public ListSG getSourceMarksAtLine(int line, string category)
	{
		auto __p = gtk_source_buffer_get_source_marks_at_line(gtkSourceBuffer, line, Str.toStringz(category));

		if(__p is null)
		{
			return null;
		}

		return new ListSG(cast(GSList*) __p);
	}

	/**
	 * Returns the #GtkSourceStyleScheme associated with the buffer,
	 * see gtk_source_buffer_set_style_scheme().
	 * The returned object should not be unreferenced by the user.
	 *
	 * Returns: the #GtkSourceStyleScheme
	 *     associated with the buffer, or %NULL.
	 */
	public StyleScheme getStyleScheme()
	{
		auto __p = gtk_source_buffer_get_style_scheme(gtkSourceBuffer);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(StyleScheme)(cast(GtkSourceStyleScheme*) __p);
	}

	/**
	 * Moves backward to the next toggle (on or off) of the context class. If no
	 * matching context class toggles are found, returns %FALSE, otherwise %TRUE.
	 * Does not return toggles located at @iter, only toggles after @iter. Sets
	 * @iter to the location of the toggle, or to the end of the buffer if no
	 * toggle is found.
	 *
	 * See the #GtkSourceBuffer description for the list of default context classes.
	 *
	 * Params:
	 *     iter = a #GtkTextIter.
	 *     contextClass = the context class.
	 *
	 * Returns: whether we found a context class toggle before @iter
	 *
	 * Since: 2.10
	 */
	public bool iterBackwardToContextClassToggle(ref TextIter iter, string contextClass)
	{
		return gtk_source_buffer_iter_backward_to_context_class_toggle(gtkSourceBuffer, (iter is null) ? null : iter.getTextIterStruct(true), Str.toStringz(contextClass)) != 0;
	}

	/**
	 * Moves forward to the next toggle (on or off) of the context class. If no
	 * matching context class toggles are found, returns %FALSE, otherwise %TRUE.
	 * Does not return toggles located at @iter, only toggles after @iter. Sets
	 * @iter to the location of the toggle, or to the end of the buffer if no
	 * toggle is found.
	 *
	 * See the #GtkSourceBuffer description for the list of default context classes.
	 *
	 * Params:
	 *     iter = a #GtkTextIter.
	 *     contextClass = the context class.
	 *
	 * Returns: whether we found a context class toggle after @iter
	 *
	 * Since: 2.10
	 */
	public bool iterForwardToContextClassToggle(ref TextIter iter, string contextClass)
	{
		return gtk_source_buffer_iter_forward_to_context_class_toggle(gtkSourceBuffer, (iter is null) ? null : iter.getTextIterStruct(true), Str.toStringz(contextClass)) != 0;
	}

	/**
	 * Check if the class @context_class is set on @iter.
	 *
	 * See the #GtkSourceBuffer description for the list of default context classes.
	 *
	 * Params:
	 *     iter = a #GtkTextIter.
	 *     contextClass = class to search for.
	 *
	 * Returns: whether @iter has the context class.
	 *
	 * Since: 2.10
	 */
	public bool iterHasContextClass(TextIter iter, string contextClass)
	{
		return gtk_source_buffer_iter_has_context_class(gtkSourceBuffer, (iter is null) ? null : iter.getTextIterStruct(), Str.toStringz(contextClass)) != 0;
	}

	/**
	 * Joins the lines of text between the specified iterators.
	 *
	 * Params:
	 *     start = a #GtkTextIter.
	 *     end = a #GtkTextIter.
	 *
	 * Since: 3.16
	 */
	public void joinLines(TextIter start, TextIter end)
	{
		gtk_source_buffer_join_lines(gtkSourceBuffer, (start is null) ? null : start.getTextIterStruct(), (end is null) ? null : end.getTextIterStruct());
	}

	/**
	 * Remove all marks of @category between @start and @end from the buffer.
	 * If @category is NULL, all marks in the range will be removed.
	 *
	 * Params:
	 *     start = a #GtkTextIter.
	 *     end = a #GtkTextIter.
	 *     category = category to search for, or %NULL.
	 *
	 * Since: 2.2
	 */
	public void removeSourceMarks(TextIter start, TextIter end, string category)
	{
		gtk_source_buffer_remove_source_marks(gtkSourceBuffer, (start is null) ? null : start.getTextIterStruct(), (end is null) ? null : end.getTextIterStruct(), Str.toStringz(category));
	}

	/**
	 * Controls the bracket match highlighting function in the buffer.  If
	 * activated, when you position your cursor over a bracket character
	 * (a parenthesis, a square bracket, etc.) the matching opening or
	 * closing bracket character will be highlighted.
	 *
	 * Params:
	 *     highlight = %TRUE if you want matching brackets highlighted.
	 */
	public void setHighlightMatchingBrackets(bool highlight)
	{
		gtk_source_buffer_set_highlight_matching_brackets(gtkSourceBuffer, highlight);
	}

	/**
	 * Controls whether syntax is highlighted in the buffer.
	 *
	 * If @highlight is %TRUE, the text will be highlighted according to the syntax
	 * patterns specified in the #GtkSourceLanguage set with
	 * gtk_source_buffer_set_language().
	 *
	 * If @highlight is %FALSE, syntax highlighting is disabled and all the
	 * #GtkTextTag objects that have been added by the syntax highlighting engine
	 * are removed from the buffer.
	 *
	 * Params:
	 *     highlight = %TRUE to enable syntax highlighting, %FALSE to disable it.
	 */
	public void setHighlightSyntax(bool highlight)
	{
		gtk_source_buffer_set_highlight_syntax(gtkSourceBuffer, highlight);
	}

	/**
	 * Sets whether the @buffer has an implicit trailing newline.
	 *
	 * If an explicit trailing newline is present in a #GtkTextBuffer, #GtkTextView
	 * shows it as an empty line. This is generally not what the user expects.
	 *
	 * If @implicit_trailing_newline is %TRUE (the default value):
	 * - when a #GtkSourceFileLoader loads the content of a file into the @buffer,
	 * the trailing newline (if present in the file) is not inserted into the
	 * @buffer.
	 * - when a #GtkSourceFileSaver saves the content of the @buffer into a file, a
	 * trailing newline is added to the file.
	 *
	 * On the other hand, if @implicit_trailing_newline is %FALSE, the file's
	 * content is not modified when loaded into the @buffer, and the @buffer's
	 * content is not modified when saved into a file.
	 *
	 * Params:
	 *     implicitTrailingNewline = the new value.
	 *
	 * Since: 3.14
	 */
	public void setImplicitTrailingNewline(bool implicitTrailingNewline)
	{
		gtk_source_buffer_set_implicit_trailing_newline(gtkSourceBuffer, implicitTrailingNewline);
	}

	/**
	 * Associates a #GtkSourceLanguage with the buffer.
	 *
	 * Note that a #GtkSourceLanguage affects not only the syntax highlighting, but
	 * also the [context classes][context-classes]. If you want to disable just the
	 * syntax highlighting, see gtk_source_buffer_set_highlight_syntax().
	 *
	 * The buffer holds a reference to @language.
	 *
	 * Params:
	 *     language = a #GtkSourceLanguage to set, or %NULL.
	 */
	public void setLanguage(Language language)
	{
		gtk_source_buffer_set_language(gtkSourceBuffer, (language is null) ? null : language.getLanguageStruct());
	}

	/**
	 * Sets a #GtkSourceStyleScheme to be used by the buffer and the view.
	 *
	 * Note that a #GtkSourceStyleScheme affects not only the syntax highlighting,
	 * but also other #GtkSourceView features such as highlighting the current line,
	 * matching brackets, the line numbers, etc.
	 *
	 * Instead of setting a %NULL @scheme, it is better to disable syntax
	 * highlighting with gtk_source_buffer_set_highlight_syntax(), and setting the
	 * #GtkSourceStyleScheme with the "classic" or "tango" ID, because those two
	 * style schemes follow more closely the GTK+ theme (for example for the
	 * background color).
	 *
	 * The buffer holds a reference to @scheme.
	 *
	 * Params:
	 *     scheme = a #GtkSourceStyleScheme or %NULL.
	 */
	public void setStyleScheme(StyleScheme scheme)
	{
		gtk_source_buffer_set_style_scheme(gtkSourceBuffer, (scheme is null) ? null : scheme.getStyleSchemeStruct());
	}

	/**
	 * Sort the lines of text between the specified iterators.
	 *
	 * Params:
	 *     start = a #GtkTextIter.
	 *     end = a #GtkTextIter.
	 *     flags = #GtkSourceSortFlags specifying how the sort should behave
	 *     column = sort considering the text starting at the given column
	 *
	 * Since: 3.18
	 */
	public void sortLines(TextIter start, TextIter end, GtkSourceSortFlags flags, int column)
	{
		gtk_source_buffer_sort_lines(gtkSourceBuffer, (start is null) ? null : start.getTextIterStruct(), (end is null) ? null : end.getTextIterStruct(), flags, column);
	}

	/**
	 * @iter is set to a valid iterator pointing to the matching bracket
	 * if @state is %GTK_SOURCE_BRACKET_MATCH_FOUND. Otherwise @iter is
	 * meaningless.
	 *
	 * The signal is emitted only when the @state changes, typically when
	 * the cursor moves.
	 *
	 * A use-case for this signal is to show messages in a #GtkStatusbar.
	 *
	 * Params:
	 *     iter = if found, the location of the matching bracket.
	 *     state = state of bracket matching.
	 *
	 * Since: 2.12
	 */
	gulong addOnBracketMatched(void delegate(TextIter, GtkSourceBracketMatchType, Buffer) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "bracket-matched", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * The "cursor-moved" signal is emitted when then insertion mark has moved.
	 *
	 * Since: 5.0
	 */
	gulong addOnCursorMoved(void delegate(Buffer) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "cursor-moved", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * The ::highlight-updated signal is emitted when the syntax
	 * highlighting and [context classes][context-classes] are updated in a
	 * certain region of the @buffer.
	 *
	 * Params:
	 *     start = the start of the updated region
	 *     end = the end of the updated region
	 */
	gulong addOnHighlightUpdated(void delegate(TextIter, TextIter, Buffer) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "highlight-updated", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * The ::source-mark-updated signal is emitted each time
	 * a mark is added to, moved or removed from the @buffer.
	 *
	 * Params:
	 *     mark = the #GtkSourceMark
	 */
	gulong addOnSourceMarkUpdated(void delegate(TextMark, Buffer) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "source-mark-updated", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}
}
