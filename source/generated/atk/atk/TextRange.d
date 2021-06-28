module atk.TextRange;

private import atk.c.functions;
public  import atk.c.types;
private import glib.MemorySlice;
private import glib.Str;
private import glib.c.functions;
private import linker.loader;


/**
 * A structure used to describe a text range.
 */
public final class TextRange
{
	/** the main Gtk struct */
	protected AtkTextRange* atkTextRange;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public AtkTextRange* getTextRangeStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return atkTextRange;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)atkTextRange;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (AtkTextRange* atkTextRange, bool ownedRef = false)
	{
		this.atkTextRange = atkTextRange;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_ATK[0]) && ownedRef )
			sliceFree(atkTextRange);
	}


	/**
	 * A rectangle giving the bounds of the text range
	 */
	public @property AtkTextRectangle bounds()
	{
		return atkTextRange.bounds;
	}

	/** Ditto */
	public @property void bounds(AtkTextRectangle value)
	{
		atkTextRange.bounds = value;
	}

	/**
	 * The start offset of a AtkTextRange
	 */
	public @property int startOffset()
	{
		return atkTextRange.startOffset;
	}

	/** Ditto */
	public @property void startOffset(int value)
	{
		atkTextRange.startOffset = value;
	}

	/**
	 * The end offset of a AtkTextRange
	 */
	public @property int endOffset()
	{
		return atkTextRange.endOffset;
	}

	/** Ditto */
	public @property void endOffset(int value)
	{
		atkTextRange.endOffset = value;
	}

	/**
	 * The text in the text range
	 */
	public @property string content()
	{
		return Str.toString(atkTextRange.content);
	}

	/** Ditto */
	public @property void content(string value)
	{
		atkTextRange.content = Str.toStringz(value);
	}

	/** */
	public static GType getType()
	{
		return atk_text_range_get_type();
	}
}
