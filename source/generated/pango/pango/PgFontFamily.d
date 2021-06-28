module pango.PgFontFamily;

private import glib.Str;
private import glib.c.functions;
private import gobject.ObjectG;
private import pango.PgFontFace;
private import pango.c.functions;
public  import pango.c.types;


/**
 * A `PangoFontFamily` is used to represent a family of related
 * font faces.
 * 
 * The font faces in a family share a common design, but differ in
 * slant, weight, width or other aspects.
 */
public class PgFontFamily : ObjectG
{
	/** the main Gtk struct */
	protected PangoFontFamily* pangoFontFamily;

	/** Get the main Gtk struct */
	public PangoFontFamily* getPgFontFamilyStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return pangoFontFamily;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)pangoFontFamily;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (PangoFontFamily* pangoFontFamily, bool ownedRef = false)
	{
		this.pangoFontFamily = pangoFontFamily;
		super(cast(GObject*)pangoFontFamily, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return pango_font_family_get_type();
	}

	/**
	 * Gets the `PangoFontFace` of @family with the given name.
	 *
	 * Params:
	 *     name = the name of a face. If the name is %NULL,
	 *         the family's default face (fontconfig calls it "Regular")
	 *         will be returned.
	 *
	 * Returns: the `PangoFontFace`,
	 *     or %NULL if no face with the given name exists.
	 *
	 * Since: 1.46
	 */
	public PgFontFace getFace(string name)
	{
		auto __p = pango_font_family_get_face(pangoFontFamily, Str.toStringz(name));

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(PgFontFace)(cast(PangoFontFace*) __p);
	}

	/**
	 * Gets the name of the family.
	 *
	 * The name is unique among all fonts for the font backend and can
	 * be used in a `PangoFontDescription` to specify that a face from
	 * this family is desired.
	 *
	 * Returns: the name of the family. This string is owned
	 *     by the family object and must not be modified or freed.
	 */
	public string getName()
	{
		return Str.toString(pango_font_family_get_name(pangoFontFamily));
	}

	/**
	 * A monospace font is a font designed for text display where the the
	 * characters form a regular grid.
	 *
	 * For Western languages this would
	 * mean that the advance width of all characters are the same, but
	 * this categorization also includes Asian fonts which include
	 * double-width characters: characters that occupy two grid cells.
	 * g_unichar_iswide() returns a result that indicates whether a
	 * character is typically double-width in a monospace font.
	 *
	 * The best way to find out the grid-cell size is to call
	 * [method@Pango.FontMetrics.get_approximate_digit_width], since the
	 * results of [method@Pango.FontMetrics.get_approximate_char_width] may
	 * be affected by double-width characters.
	 *
	 * Returns: %TRUE if the family is monospace.
	 *
	 * Since: 1.4
	 */
	public bool isMonospace()
	{
		return pango_font_family_is_monospace(pangoFontFamily) != 0;
	}

	/**
	 * A variable font is a font which has axes that can be modified to
	 * produce different faces.
	 *
	 * Returns: %TRUE if the family is variable
	 *
	 * Since: 1.44
	 */
	public bool isVariable()
	{
		return pango_font_family_is_variable(pangoFontFamily) != 0;
	}

	/**
	 * Lists the different font faces that make up @family.
	 *
	 * The faces in a family share a common design, but differ in slant, weight,
	 * width and other aspects.
	 *
	 * Params:
	 *     faces = location to store an array of pointers to `PangoFontFace` objects,
	 *         or %NULL. This array should be freed with g_free() when it is no
	 *         longer needed.
	 */
	public void listFaces(out PgFontFace[] faces)
	{
		PangoFontFace** outfaces = null;
		int nFaces;

		pango_font_family_list_faces(pangoFontFamily, &outfaces, &nFaces);

		faces = new PgFontFace[nFaces];
		for(size_t i = 0; i < nFaces; i++)
		{
			faces[i] = ObjectG.getDObject!(PgFontFace)(cast(PangoFontFace*) outfaces[i]);
		}
	}
}
