module sourceview.IndenterT;

public  import gobject.ObjectG;
public  import gtk.TextIter;
public  import sourceview.View;
public  import sourceview.c.functions;
public  import sourceview.c.types;


/** */
public template IndenterT(TStruct)
{
	/** Get the main Gtk struct */
	public GtkSourceIndenter* getIndenterStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return cast(GtkSourceIndenter*)getStruct();
	}


	/**
	 * This function should be implemented to alter the indentation of text
	 * within the view. @view is provided so that the indenter may retrieve
	 * settings such as indentation and tab widths.
	 *
	 * @iter is the location where the indentation was requested. This typically
	 * is after having just inserted a newline (\n) character but can be other
	 * situations such as a manually requested indentation or reformatting.
	 *
	 * See gtk_source_indenter_is_trigger() for how to trigger indentation on
	 * various characters inserted into the buffer.
	 *
	 * The implementor of this function is expected to keep @iter valid across
	 * calls to the function and should contain the location of the insert mark
	 * after calling this function.
	 *
	 * The default implementation for this virtual function will copy the
	 * indentation of the previous line.
	 *
	 * Params:
	 *     view = a #GtkSourceView
	 *     iter = the location of the indentation request
	 *
	 * Since: 5.0
	 */
	public void indent(View view, ref TextIter iter)
	{
		gtk_source_indenter_indent(getIndenterStruct(), (view is null) ? null : view.getViewStruct(), (iter is null) ? null : iter.getTextIterStruct(true));
	}

	/**
	 * This function is used to determine if a key pressed should cause the
	 * indenter to automatically indent.
	 *
	 * The default implementation of this virtual method will check to see
	 * if @keyval is %GDK_KEY_Return or %GDK_KEY_KP_Enter and @state does
	 * not have %GDK_SHIFT_MASK set. This is to allow the user to avoid
	 * indentation when Shift+Return is pressed. Other indenters may want
	 * to copy this behavior to provide a consistent experience to users.
	 *
	 * Params:
	 *     view = a #GtkSourceView
	 *     location = the location where @ch is to be inserted
	 *     state = modifier state for the insertion
	 *     keyval = the keyval pressed such as %GDK_KEY_Return
	 *
	 * Returns: %TRUE if indentation should be automatically triggered;
	 *     otherwise %FALSE and no indentation will be performed.
	 *
	 * Since: 5.0
	 */
	public bool isTrigger(View view, TextIter location, GdkModifierType state, uint keyval)
	{
		return gtk_source_indenter_is_trigger(getIndenterStruct(), (view is null) ? null : view.getViewStruct(), (location is null) ? null : location.getTextIterStruct(), state, keyval) != 0;
	}
}
