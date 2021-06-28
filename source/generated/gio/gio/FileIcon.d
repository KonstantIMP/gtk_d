module gio.FileIcon;

private import gio.FileIF;
private import gio.IconIF;
private import gio.IconT;
private import gio.LoadableIconIF;
private import gio.LoadableIconT;
private import gio.c.functions;
public  import gio.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;


/**
 * #GFileIcon specifies an icon by pointing to an image file
 * to be used as icon.
 */
public class FileIcon : ObjectG, IconIF, LoadableIconIF
{
	/** the main Gtk struct */
	protected GFileIcon* gFileIcon;

	/** Get the main Gtk struct */
	public GFileIcon* getFileIconStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gFileIcon;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gFileIcon;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GFileIcon* gFileIcon, bool ownedRef = false)
	{
		this.gFileIcon = gFileIcon;
		super(cast(GObject*)gFileIcon, ownedRef);
	}

	// add the Icon capabilities
	mixin IconT!(GFileIcon);

	// add the LoadableIcon capabilities
	mixin LoadableIconT!(GFileIcon);


	/** */
	public static GType getType()
	{
		return g_file_icon_get_type();
	}

	/**
	 * Creates a new icon for a file.
	 *
	 * Params:
	 *     file = a #GFile.
	 *
	 * Returns: a #GIcon for the given
	 *     @file, or %NULL on error.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(FileIF file)
	{
		auto __p = g_file_icon_new((file is null) ? null : file.getFileStruct());

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GFileIcon*) __p, true);
	}

	/**
	 * Gets the #GFile associated with the given @icon.
	 *
	 * Returns: a #GFile.
	 */
	public FileIF getFile()
	{
		auto __p = g_file_icon_get_file(gFileIcon);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(FileIF)(cast(GFile*) __p);
	}
}
