module sourceview.Style;

private import gobject.ObjectG;
private import gtk.TextTag;
private import sourceview.c.functions;
public  import sourceview.c.types;


/** */
public class Style : ObjectG
{
	/** the main Gtk struct */
	protected GtkSourceStyle* gtkSourceStyle;

	/** Get the main Gtk struct */
	public GtkSourceStyle* getStyleStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkSourceStyle;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkSourceStyle;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkSourceStyle* gtkSourceStyle, bool ownedRef = false)
	{
		this.gtkSourceStyle = gtkSourceStyle;
		super(cast(GObject*)gtkSourceStyle, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_source_style_get_type();
	}

	/**
	 * This function modifies the #GtkTextTag properties that are related to the
	 * #GtkSourceStyle properties. Other #GtkTextTag properties are left untouched.
	 *
	 * If @style is non-%NULL, applies @style to @tag.
	 *
	 * If @style is %NULL, the related *-set properties of #GtkTextTag are set to
	 * %FALSE.
	 *
	 * Params:
	 *     tag = a #GtkTextTag to apply styles to.
	 *
	 * Since: 3.22
	 */
	public void apply(TextTag tag)
	{
		gtk_source_style_apply(gtkSourceStyle, (tag is null) ? null : tag.getTextTagStruct());
	}

	/**
	 * Creates a copy of @style, that is a new #GtkSourceStyle instance which
	 * has the same attributes set.
	 *
	 * Returns: copy of @style, call g_object_unref()
	 *     when you are done with it.
	 *
	 * Since: 2.0
	 */
	public Style copy()
	{
		auto __p = gtk_source_style_copy(gtkSourceStyle);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Style)(cast(GtkSourceStyle*) __p, true);
	}
}
